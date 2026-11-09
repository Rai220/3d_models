"""Check every sliced pilot layer using extrusion widths, plus first/floor layers."""
from pathlib import Path
import re,json,hashlib,zipfile
import numpy as np
from shapely.geometry import LineString,Point
from shapely.ops import unary_union
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.collections import LineCollection

R=Path(__file__).resolve().parents[1]
v=json.loads((R/'geometry_validation.json').read_text())
s=json.loads((R/'slicing_validation.json').read_text())
p=v['parameters']
assert hashlib.sha256((R/'P1S_servo_clamp_corrected.3mf').read_bytes()).hexdigest()==s['project_sha256']
g=(R/'slicing_check/plate_1.gcode').read_text()
assert hashlib.sha256(g.encode()).hexdigest()==s['gcode_sha256']
with zipfile.ZipFile(R/'P1S_servo_clamp_corrected.3mf') as z:cfg=json.loads(z.read('Metadata/project_settings.config'))
offset=np.array([float(x) for x in cfg['extruder_offset'][0].split('x')])
b=next(o for o in s['sliced_plates'][0]['objects'] if o['name']=='Original_H13')['bbox']
origin=np.array([b['x'],b['y']])-offset
centers=np.array(v['pilot_centers_print_xy_mm'])
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
        seg=np.array([xy,end])-origin
        if np.linalg.norm(end-xy)>1e-7 and np.all(seg>=-.5) and np.all(seg[:,0]<=b['width']+.5) and np.all(seg[:,1]<=b['depth']+.5):
            assert 'support' not in feature.lower()
            layers[z].append((seg,width,feature))
    xy=end

layers={z:paths for z,paths in layers.items() if paths}
bridge_paths=[(z,seg,w) for z,paths in layers.items() for seg,w,f in paths if 'bridge' in f.lower()]
# Short top-skin bridges over sparse infill inside the base are permissible;
# no bridge may close a screw bore or begin above the plate.
for z,seg,w in bridge_paths:
    assert z<=p['plate_thickness'] and np.linalg.norm(seg[1]-seg[0])<5,(z,seg)
checks=[]
for z,paths in layers.items():
    assert paths,(z,'empty layer')
    if z-float(cfg['layer_height'])/2<=v['pilot_floor_z_mm']+.001:continue
    for name,center in zip('ABC',centers):
        # Distance to the nominal width envelope, not just the line centre.
        clearance=min(LineString(seg).distance(Point(center))-w/2 for seg,w,f in paths)
        assert clearance>p['pilot_diameter']/2-.08,(z,name,clearance)
        assert clearance<p['entry_diameter']/2+.1,(z,name,'hole or coordinate transform absent')
        checks.append({'z_mm':z,'hole':name,'nominal_clear_radius_mm':clearance})
assert len(checks)>100
for target in (.2,1.88,v['pilot_floor_z_mm']-.12):
    z=min(layers,key=lambda q:abs(q-target))
    for center in centers:
        distance=min(LineString(seg).distance(Point(center))-w/2 for seg,w,f in layers[z])
        assert distance<.25,(z,'missing material beneath pilot',distance)

fig,axs=plt.subplots(2,3,figsize=(13,9))
for ax,target in zip(axs.flat,(.2,1.88,2.12,v['pilot_floor_z_mm']-.12,v['pilot_floor_z_mm']+.12,v['extents_mm'][2]-.08)):
    z=min(layers,key=lambda q:abs(q-target));paths=layers[z]
    ax.add_collection(LineCollection([q[0] for q in paths],linewidths=.6,
        colors=['#1d718a' if 'wall' in q[2].lower() else '#d28b38' for q in paths]))
    for name,c in zip('ABC',centers):
        ax.add_patch(plt.Circle(c,p['pilot_diameter']/2,fill=False,color='#c93838',lw=.8))
        ax.text(c[0]+1,c[1]+1,name,fontsize=9)
    ax.set(xlim=(-1,32),ylim=(-1,30),aspect='equal',title=f'Z = {z:g} мм')
fig.suptitle(f"Траектории из повторной нарезки итогового 3MF\nДно каналов Z={v['pilot_floor_z_mm']:g} мм; верх Z={v['extents_mm'][2]:g} мм; каналы Ø{p['pilot_diameter']:g} мм.")
fig.tight_layout(rect=(0,0,1,.93));fig.subplots_adjust(hspace=.28)
fig.savefig(R/'toolpaths.png',dpi=160)
# Check extrusion coverage across both strengthened teeth and their supporting base.
tab_checks=[]
for target in (1.88,2.36,3.08,3.8):
    z=min(layers,key=lambda q:abs(q-target))
    material=unary_union([LineString(seg).buffer(w/2) for seg,w,f in layers[z]])
    for name,bounds in zip(('front','rear'),v['tab_bounds_xy_mm']):
        x=(bounds[0]+bounds[2])/2+v['print_shift_mm'][0]
        y0=bounds[1]+v['print_shift_mm'][1];y1=bounds[3]+v['print_shift_mm'][1]
        coverage=material.intersection(LineString([(x,y0+.15),(x,y1-.15)])).length
        assert coverage>p['tab_depth']-.5,(z,name,coverage)
        tab_checks.append({'z_mm':z,'tooth':name,'material_across_depth_mm':coverage})
report={'tab_material_checks':tab_checks,'project_sha256':s['project_sha256'],'gcode_sha256':s['gcode_sha256'],
        'layers':len(layers),'pilot_layer_checks':len(checks),
        'minimum_nominal_open_diameter_mm':2*min(c['nominal_clear_radius_mm'] for c in checks),
        'all_pilot_layers_clear':True,'solid_material_below_pilots':True,
        'no_support_extrusions':True,
        'bridges_only_inside_plate':True,'bridge_segments':len(bridge_paths),
        'maximum_bridge_segment_mm':max((float(np.linalg.norm(seg[1]-seg[0])) for z,seg,w in bridge_paths),default=0),
        'checks':checks,'physical_hole_diameter_verified':False,
        'limitations':'Nominal line-width envelopes only. Printed bore depends on flow, material and machine. No printed threads.'}
(R/'toolpath_validation.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({k:report[k] for k in ['layers','pilot_layer_checks','minimum_nominal_open_diameter_mm']},indent=2))

from verify_thin import verify as verify_thin_variant
verify_thin_variant()

