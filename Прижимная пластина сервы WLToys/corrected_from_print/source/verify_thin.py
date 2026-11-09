"""Inspect both model and support extrusion envelopes around the new bores."""
from pathlib import Path
import re,json,hashlib,zipfile
import numpy as np
from shapely.geometry import LineString,Point,Polygon
from shapely.ops import unary_union
import trimesh, math
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.collections import LineCollection
R=Path(__file__).resolve().parents[1]
def verify():
    v=json.loads((R/'thin_geometry_validation.json').read_text())
    s=json.loads((R/'slicing_validation.json').read_text())
    g=(R/'slicing_check/plate_1.gcode').read_text()
    assert hashlib.sha256(g.encode()).hexdigest()==s['gcode_sha256']
    with zipfile.ZipFile(R/'P1S_servo_clamp_corrected.3mf') as z:cfg=json.loads(z.read('Metadata/project_settings.config'))
    offset=np.array([float(x) for x in cfg['extruder_offset'][0].split('x')])
    b=next(o for o in s['sliced_plates'][0]['objects'] if o['name']=='Thin_DHV56MG')['bbox']
    origin=np.array([b['x'],b['y']])-offset
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
        end=np.array([d.get('X',xy[0]),d.get('Y',xy[1])]);seg=np.array([xy,end])-origin
        if z is not None and d.get('E',0)>0 and feature!='Custom':
            assert relative and w[0] in ('G0','G1')
            if np.linalg.norm(end-xy)>1e-7 and np.all(seg>=-5) and np.all(seg[:,0]<=b['width']+5) and np.all(seg[:,1]<=b['depth']+5):
                layers[z].append((seg,width,feature))
        xy=end
    def clearance(paths,point):
        return min(LineString(seg).distance(Point(point))-w/2 for seg,w,f in paths)
    chassis=[]
    for z,paths in layers.items():
        if paths and z<=v['chassis_pilot_depth_mm']+.001:
            for i,c in enumerate(v['chassis_pilot_centers_xy_mm']):
                gap=clearance(paths,c);assert gap>.7,(z,i,gap)
                chassis.append({'z_mm':z,'hole':i,'clear_radius_mm':gap})
    assert len(chassis)>100
    ears=[]
    for x,y,cz in v['ear_pilot_centers_xyz_mm']:
        for z,paths in layers.items():
            mid=z-float(cfg['layer_height'])/2
            if abs(mid-cz)>.5:continue
            for depth in (.5,1.5,2.5,3.5):
                gap=clearance(paths,(x,y+depth))
                # Near the blind end the nearest material is the end wall, not a radial wall.
                expected=min((.8**2-(mid-cz)**2)**.5,v['ear_pilot_depth_mm']-depth)
                assert gap>expected-.15,(z,depth,gap,expected)
                ears.append({'z_mm':z,'x_mm':x,'depth_mm':depth,'clear_radius_mm':gap})
    assert len(ears)>40
    support=[(z,seg,w) for z,paths in layers.items() for seg,w,f in paths if 'support' in f.lower()]
    assert not support and cfg['enable_support']=='0'
    mesh=trimesh.load_mesh(R/'servo_clamp_thin.stl')
    # Solid base is present from the first layer, with three through bores through the 5-mm base.
    assert v['shelf_bottom_z_mm']==0 and v['shelf_top_z_mm']==5
    base_section=mesh.section(plane_origin=[0,0,v['shelf_top_z_mm']-.5],plane_normal=[0,0,1])
    assert len(base_section.discrete)==4
    floor_checks=[]
    for target in (.2,.68,v['shelf_top_z_mm']-.2):
        layer=min((z for z,paths in layers.items() if paths),key=lambda z:abs(z-target))
        for point in [(v['nominal_body_min_mm'][0]+v['nominal_body_size_mm'][0]/2+v['print_shift_mm'][0],y) for y in (2,11.5,20.7)]:
            gap=clearance(layers[layer],point)
            assert gap<.25,(layer,point,gap)
            floor_checks.append({'z_mm':layer,'xy_mm':point,'material_distance_mm':gap})
    # The abandoned A bore must be filled; there must not be a fourth lower hole.
    former_A=np.array(v['reference_hole_centers_before_turnover_mm'][0])+np.array(v['print_shift_mm'])[:2]
    old_A_checks=[]
    for target in (.2,.44,.68,v['shelf_top_z_mm']-.2):
        z=min((z for z,paths in layers.items() if paths),key=lambda z:abs(z-target))
        distance=clearance(layers[z],former_A)
        assert distance<.25,(z,'old A not filled',distance)
        old_A_checks.append({'z_mm':z,'material_distance_mm':distance})
    fig,axs=plt.subplots(2,3,figsize=(13,9))
    for ax,target in zip(axs.flat,(.2,1.88,2.12,v['shelf_top_z_mm']-.04,v['ear_pilot_centers_xyz_mm'][0][2],v['ear_pilot_centers_xyz_mm'][0][2]+.9)):
        z=min(layers,key=lambda z:abs(z-target));paths=layers[z]
        ax.add_collection(LineCollection([q[0] for q in paths],linewidths=.6,
            colors=['#bd55ae' if 'support' in q[2].lower() else '#237c88' for q in paths]))
        ax.set(xlim=(-4,b['width']+4),ylim=(-4,33),aspect='equal',title=f'Z={z:g} мм')
    fig.suptitle('Пластина 5 мм без нижних ножек и поддержек; крепёжные каналы проверены')
    fig.tight_layout(rect=(0,0,1,.95));fig.savefig(R/'thin_toolpaths.png',dpi=150)
    report={'project_sha256':s['project_sha256'],'gcode_sha256':s['gcode_sha256'],
        'former_A_filled_checks':old_A_checks,'chassis_checks':chassis,'ear_checks':ears,'base_material_checks':floor_checks,'all_functional_bores_clear':True,'chassis_bores_through_all_plate_layers':True,
        'no_support_extrusions':True,'solid_plate_thickness_mm':v['shelf_top_z_mm'],
        'minimum_chassis_nominal_diameter_mm':2*min(q['clear_radius_mm'] for q in chassis),
        'physical_fit_verified':False,'limitation':'Extrusion-width envelopes do not establish printed fit or support removability.'}
    (R/'thin_toolpath_validation.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({'chassis_checks':len(chassis),'ear_checks':len(ears),'no_support_extrusions':True}))
if __name__=='__main__':verify()
