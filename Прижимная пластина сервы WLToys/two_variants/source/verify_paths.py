"""Check every sliced pilot layer using extrusion widths, plus first/floor layers."""
from pathlib import Path
import re,json,hashlib,zipfile
import numpy as np
import trimesh
from shapely.geometry import LineString,Point,MultiPoint
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.collections import LineCollection

R=Path(__file__).resolve().parents[1]
v=json.loads((R/'geometry_validation.json').read_text())
s=json.loads((R/'slicing_validation.json').read_text())
assert hashlib.sha256((R/'P1S_both_servo_clamps.3mf').read_bytes()).hexdigest()==s['project_sha256']
g=(R/'slicing_check/plate_1.gcode').read_text()
assert hashlib.sha256(g.encode()).hexdigest()==s['gcode_sha256']
with zipfile.ZipFile(R/'P1S_both_servo_clamps.3mf') as z:cfg=json.loads(z.read('Metadata/project_settings.config'))
offset=np.array([float(x) for x in cfg['extruder_offset'][0].split('x')])
origin=np.zeros(2)
layers={};xy=None;z=None;width=.42;feature='';relative=False
for line in g.splitlines():
    if line.startswith('; Z_HEIGHT: '):z=float(line.split(':')[1]);layers[z]=[]
    if line.startswith('; LINE_WIDTH: '):width=float(line.split(':')[1])
    if line.startswith('; FEATURE: '):feature=line.split(': ',1)[1]
    w=line.split(';',1)[0].split()
    if not w:continue
    if w[0]=='M83':relative=True
    if w[0]=='M82':relative=False
    if w[0] not in ('G0','G1','G2','G3'):continue
    d={t[0]:float(t[1:]) for t in w[1:] if re.fullmatch(r'[XYEIJFZ][-+]?\d*\.?\d+',t)}
    if 'X' not in d and 'Y' not in d:continue
    if xy is None:
        if 'X' in d and 'Y' in d:xy=np.array([d['X'],d['Y']])
        continue
    end=np.array([d.get('X',xy[0]),d.get('Y',xy[1])])
    if z is not None and d.get('E',0)>0 and feature!='Custom':
        assert relative and w[0] in ('G0','G1')
        assert 'support' not in feature.lower() and 'bridge' not in feature.lower()
        if np.linalg.norm(end-xy)>1e-7:layers[z].append((np.array([xy,end])-origin,width,feature))
    xy=end


reports={}
fig,axs=plt.subplots(2,3,figsize=(13,9))
for row,obj in enumerate(s['sliced_plates'][0]['objects']):
    name=obj['name'];b=obj['bbox'];part=v['parts'][name]
    origin=np.array([b['x'],b['y']])-offset
    centers=np.array(part['pilot_centers_print_xy_mm'])+origin
    H=part['extents_mm'][2];floor=part['pilot_floor_z_mm']
    local_mesh=trimesh.load_mesh(R/(name+'.stl'))
    drawing_region=MultiPoint(local_mesh.vertices[:,:2]).convex_hull.buffer(.4)
    checks=[]
    for z,paths in layers.items():
        # Z_HEIGHT is the deposited layer top; slicing samples its middle plane.
        # The 2.24 mm layer has midpoint 2.18 and still belongs to the 2.2 mm floor.
        if z-float(cfg['layer_height'])/2<=floor+.001 or z>H+.01:continue
        assert paths
        for hole,center in zip('ABC',centers):
            clearance=min(LineString(seg).distance(Point(center))-w/2 for seg,w,f in paths)
            assert .45<clearance<1.0,(name,z,hole,clearance)
            checks.append({'z_mm':z,'hole':hole,'nominal_clear_radius_mm':clearance})
    assert len(checks)>100
    floor_checks=[]
    for target in (.2,1.88,floor-.12):
        z=min(layers,key=lambda q:abs(q-target))
        for hole,center in zip('ABC',centers):
            distance=min(LineString(seg).distance(Point(center))-w/2 for seg,w,f in layers[z])
            assert distance<.25,(name,z,'missing floor',distance)
            floor_checks.append({'z_mm':z,'hole':hole,'nominal_extrusion_distance_mm':distance})
    for col,target in enumerate((.2,floor+.12,H-.08)):
        ax=axs[row,col];z=min(layers,key=lambda q:abs(q-target));paths=layers[z]
        paths=[q for q in paths if drawing_region.contains(Point(q[0].mean(axis=0)-origin))]
        ax.add_collection(LineCollection([q[0]-origin for q in paths],linewidths=.6,
            colors=['#1d718a' if 'wall' in q[2].lower() else '#d28b38' for q in paths]))
        for hole,c in zip('ABC',centers-origin):
            ax.add_patch(plt.Circle(c,.6,fill=False,color='#c93838',lw=.8))
        ax.set(xlim=(-1,32),ylim=(-1,30),aspect='equal',title=f'{name}: Z={z:g} мм')
    report={'project_sha256':s['project_sha256'],'gcode_sha256':s['gcode_sha256'],
        'stl_sha256':part['stl_sha256'],'pilot_layer_checks':len(checks),
        'minimum_nominal_open_diameter_mm':2*min(c['nominal_clear_radius_mm'] for c in checks),
        'all_pilot_layers_clear':True,'floor_checks':floor_checks,'checks':checks,
        'physical_hole_diameter_verified':False}
    reports[name]=report
    (R/(name+'_toolpath_validation.json')).write_text(json.dumps(report,indent=2)+'\n')
fig.suptitle('Обе детали: первый слой, начало канала и верхний слой\nТраектории повторной нарезки выдаваемого проекта 3MF')
fig.tight_layout(rect=(0,0,1,.92));fig.subplots_adjust(hspace=.28)
fig.savefig(R/'toolpaths.png',dpi=160)
(R/'toolpath_validation.json').write_text(json.dumps({'parts':reports,'no_support_or_bridge_extrusions':True},indent=2)+'\n')
print(json.dumps({name:{'checks':v['pilot_layer_checks'],'minimum_nominal_hole_mm':v['minimum_nominal_open_diameter_mm']} for name,v in reports.items()},indent=2))
