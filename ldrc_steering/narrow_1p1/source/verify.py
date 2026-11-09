"""Check the narrow slot and both knuckles in the exact delivered G-code."""
from pathlib import Path
import json,re,zipfile,hashlib
import numpy as np
import trimesh
from shapely.geometry import LineString,Point,box
from shapely.ops import unary_union
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.collections import LineCollection
from mpl_toolkits.mplot3d.art3d import Poly3DCollection
from gcode_paths import extrusion_paths
R=Path(__file__).resolve().parents[1]
v=json.loads((R/'geometry_validation.json').read_text());s=json.loads((R/'slicing_validation.json').read_text())
project=R/'P1S_LDRC_slot_1p1_pair.3mf'
assert hashlib.sha256(project.read_bytes()).hexdigest()==s['project_sha256']
with zipfile.ZipFile(project) as z:cfg=json.loads(z.read('Metadata/project_settings.config'))
offset=np.array([float(x) for x in cfg['extruder_offset'][0].split('x')])
gcode=(R/'check/plate_1.gcode').read_text()
cuts=list(re.finditer(r'^; CHANGE_LAYER\s*\n; Z_HEIGHT: ([0-9.]+)',gcode,re.M))
layers={float(c.group(1)):gcode[c.start():cuts[i+1].start() if i+1<len(cuts) else len(gcode)] for i,c in enumerate(cuts)}
objects={Path(o['name']).stem:o['bbox'] for o in s['sliced_plates'][0]['objects']}
meshes={name:trimesh.load_mesh(R/f'stl/{name}.stl') for name in objects}
checks=[]
rects=[]
for name,b in objects.items():
    m=meshes[name];assert np.allclose(m.extents,[b['width'],b['depth'],b['height']],atol=.001)
    rects.append(box(b['x']-4,b['y']-4,b['x']+b['width']+4,b['y']+b['depth']+4))
for i,a in enumerate(rects):
    for b in rects[i+1:]:assert a.disjoint(b),'4 mm clearance envelopes intersect'

def paths(name,z,model_only=False):
    t=layers[z]
    if model_only:t=re.sub(r'^; FEATURE: (?:Support[^\n]*|Brim)','; FEATURE: ',t,flags=re.M)
    b=objects[name]
    return extrusion_paths(t)+offset-[b['x'],b['y']]

name='tie_rod_slot_1p1';cx=v['parameters']['slot_center_x_mm']+v['parts'][name]['shift'][0]
for target in (.32,.8,1.52,2.48,2.96):
    z=min(layers,key=lambda x:abs(x-target));lines=paths(name,z)
    network=unary_union([LineString(a) for a in lines]);probe=LineString([(cx,.3),(cx,8.2)])
    d=network.distance(probe);assert .55<d<1.1,(z,d)
    checks.append({'part':name,'feature':'servo slot clear, including support and brim paths','z_mm':z,'centerline_clearance_mm':d})
for z in (1.52,2.48,3.68):
    network=unary_union([LineString(a) for a in paths(name,z)])
    for x in (3,46.5):
        d=network.distance(LineString([(x,.3),(x,3.7)]));assert d>1.2
        checks.append({'part':name,'feature':'unchanged eye bore','x_mm':x,'z_mm':z,'centerline_clearance_mm':d})
for name in ('knuckle_original','knuckle_mirrored'):
    center=np.array(v['parts'][name]['shift'][:2])
    for z,radius in ((.32,6.25),(4.76,6.25),(9.56,3.75),(11.84,2.25)):
        lines=paths(name,z,True);net=unary_union([LineString(a) for a in lines])
        d=net.distance(Point(center));assert d>radius-.05,(name,z,d)
        checks.append({'part':name,'feature':'axial bore after support removal','z_mm':z,'centerline_clearance_mm':d})
    centers=paths(name,.32,True).mean(1)
    lo,hi=(9.8,13.7) if name.endswith('original') else (6.05,9.95)
    count=int(((centers[:,0]>lo)&(centers[:,0]<hi)&(centers[:,1]>15)&(centers[:,1]<19)).sum())
    assert count>3
    checks.append({'part':name,'feature':'arm starts on first layer','segments':count})

fig,axs=plt.subplots(1,3,figsize=(15,5))
for ax,(name,b) in zip(axs,objects.items()):
    z=1.52 if name.startswith('tie') else .32
    ax.add_collection(LineCollection(paths(name,z),colors='#51a961',linewidths=.7))
    ax.add_collection(LineCollection(paths(name,z,True),colors='#12566b',linewidths=.8))
    m=meshes[name];section=m.section(plane_origin=[0,0,z-.01],plane_normal=[0,0,1])
    for curve in section.discrete:ax.plot(curve[:,0],curve[:,1],color='#ce732f',lw=.6)
    if name.startswith('tie'):ax.set(xlim=(8,15),ylim=(-1,11),aspect='equal',title='Паз 1,1 мм: траектории, Z=1,52')
    else:ax.set(xlim=(-4,24),ylim=(-4,26),aspect='equal',title=f'{name}: первый слой')
fig.tight_layout();fig.savefig(R/'analysis/toolpaths.png',dpi=170)

fig=plt.figure(figsize=(11,8));ax=fig.add_subplot(111,projection='3d')
light=np.array([.3,-.5,.8]);light/=np.linalg.norm(light)
for name,b in objects.items():
    m=meshes[name].copy();m.apply_translation([b['x'],b['y'],0])
    color=np.array([.15,.52,.65]) if name.startswith('tie') else np.array([.85,.52,.18])
    shades=.45+.55*np.maximum(0,m.face_normals@light)
    ax.add_collection3d(Poly3DCollection(m.triangles,facecolors=shades[:,None]*color,edgecolors='none'))
ax.set(xlim=(94,161),ylim=(102,159),zlim=(0,14),xlabel='X, мм',ylabel='Y, мм',zlabel='Z, мм')
ax.set_box_aspect((67,57,14));ax.view_init(48,-73);ax.set_title('P1S: тяга с пазом 1,1 мм + два зеркальных кулака')
fig.tight_layout();fig.savefig(R/'analysis/plate_preview.png',dpi=170)
(R/'toolpath_validation.json').write_text(json.dumps({'checks':checks,'project_sha256':s['project_sha256'],
    'gcode_sha256':hashlib.sha256(gcode.encode()).hexdigest(),'physical_fit_verified':False,
    'limitations':'Extrusion centerlines, not printed dimensions. Screw diameter and mating chassis unavailable. Knuckle supports must be removed.'},indent=2))
print('PASS:',len(checks),'functional toolpath checks; 3 objects on one plate')
