"""Verify actual sliced nut cavities and through bores remain open."""
from pathlib import Path
import hashlib, json, re, zipfile
import numpy as np
import trimesh
from shapely.geometry import LineString,Point
from shapely.ops import unary_union
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.collections import LineCollection
from gcode_paths import extrusion_paths
R=Path(__file__).resolve().parent
v=json.loads((R/'validation.json').read_text())
project=R/v['project_file'];sliced=R/'checked_2plates.gcode.3mf'
assert hashlib.sha256(sliced.read_bytes()).hexdigest()==v['gcode_3mf_sha256']
scene=trimesh.load_scene(project)
with zipfile.ZipFile(project) as z:
    settings=json.loads(z.read('Metadata/project_settings.config'))
offset=np.array([float(a) for a in settings['extruder_offset'][0].split('x')])
entries={}
for node in scene.graph.nodes_geometry:
    T,key=scene.graph[node];m=scene.geometry[key];world=m.copy();world.apply_transform(T)
    plate=1 if world.bounds.mean(0)[0]<256 else 2
    bounds=world.bounds-np.array([(plate-1)*307.2,0,0])
    name=next(n for n,d in v['layout'].items() if d['plate']==plate and np.allclose(bounds,d['actual_bounds_mm'],atol=.001))
    part=name.rsplit('_',1)[0];source=trimesh.load_mesh(R/f'{part}.stl')
    entries[name]=(plate,T,m.bounds[0]-source.bounds[0],part)
cache={}
with zipfile.ZipFile(sliced) as z:
    for plate in (1,2):
        g=z.read(next(n for n in z.namelist() if n.endswith(f'plate_{plate}.gcode'))).decode()
        cuts=list(re.finditer(r'^; CHANGE_LAYER\s*\n; Z_HEIGHT: ([0-9.]+)',g,re.M))
        for i,c in enumerate(cuts):
            height=round(float(c.group(1)),3)
            cache[plate,height]=g[c.start():cuts[i+1].start() if i+1<len(cuts) else len(g)]

def local_paths(name,z):
    plate,T,shift,part=entries[name]
    key=(plate,z)
    if isinstance(cache[key],str):cache[key]=extrusion_paths(cache[key])+offset+[(plate-1)*307.2,0]
    p=cache[key]
    verts=np.column_stack([p.reshape(-1,2),np.full(p.size//2,z)])
    q=trimesh.transform_points(verts,np.linalg.inv(T))-shift
    return q[:,:2].reshape(-1,2,2)

checks=[];examples=[]
for name,(plate,T,shift,part) in entries.items():
    probes=[]
    if part.startswith('wheel_carriage') or part=='fit_slider':
        probes += [('pivot nut slot',(0,0),z,2.8) for z in (6.2,7.4,8.6)]
        probes += [('pivot bore',(0,0),z,1.45) for z in (.2,3.,5.8)]
        probes += [('clamp nut slot',(9,-12.2),z,1.3) for z in (10.,12.6,15.2)]
    if part=='axle_saddle':
        probes += [('crossrail nut slot',(0,y),z,2.8) for y in (-11,11) for z in (5.4,6.6,7.8)]
        probes += [('mount through bore',(0,y),z,1.45) for y in (-11,11) for z in (.2,3.,8.8)]
    if part=='foot':
        probes += [('underside hex nut',(0,0),z,2.6) for z in (.2,1.8,3.4)]
        probes += [('through foot bore',(0,0),z,1.45) for z in (4.,7.,10.8)]
    if part=='wheel_unit':
        probes += [('wheel unit pivot bore',(0,0),z,1.45) for z in (.2,2.,3.)]
    for feature,center,z,minimum in probes:
        lines=local_paths(name,z)
        center=np.array(center);keep=np.linalg.norm(lines.mean(1)-center,axis=1)<12
        network=unary_union([LineString(line) for line in lines[keep]])
        d=network.distance(Point(center));assert minimum<d<6,(name,feature,z,d)
        checks.append({'object':name,'feature':feature,'print_z_mm':z,'center_to_extrusion_mm':round(d,4)})
        if len(examples)<4 and feature not in [e[0] for e in examples]:examples.append((feature,name,z,center,lines[keep]))
fig,axs=plt.subplots(2,2,figsize=(12,9),facecolor='white')
for ax,(feature,name,z,center,lines) in zip(axs.flat,examples):
    ax.add_collection(LineCollection(lines,colors='#087482',linewidths=.9))
    ax.plot(*center,'+',color='#ba5837',ms=9)
    ax.set(xlim=(center[0]-10,center[0]+10),ylim=(center[1]-8,center[1]+8),aspect='equal')
    ax.set_title(f'{name} / Z={z} mm\n{feature}',fontsize=11)
fig.suptitle('Проходы под винты и гайки в итоговом G-code',fontsize=18)
fig.tight_layout(rect=(0,0,1,.94));fig.savefig(R/'fastener_toolpaths.png',dpi=160);plt.close(fig)
report={'project_sha256':hashlib.sha256(project.read_bytes()).hexdigest(),
        'gcode_3mf_sha256':hashlib.sha256(sliced.read_bytes()).hexdigest(),
        'source':'actual extrusion centerlines; nominal extrusion width allowance',
        'physical_fit_verified':False,'checks':checks}
(R/'fastener_toolpath_validation.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
print(f'{len(checks)} actual-G-code nut-slot/bore checks passed.')
