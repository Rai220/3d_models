from pathlib import Path
import json, hashlib, shutil
import numpy as np
import manifold3d as mf
import trimesh
from shapely.geometry import box, LineString
from shapely.geometry.polygon import orient
from shapely.ops import unary_union
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from cad_helpers import write_3mf, view3d
R=Path(__file__).resolve().parents[1]
p=json.loads((R/'parameters_small.json').read_text())
centers = np.array([[0.,0.],[p['front_hole_spacing'],0.],
                    [p['rear_hole_x'],p['rear_hole_y']]])
H,T,W = p['total_height'],p['plate_thickness'],p['post_width']
assert 0 < p['pilot_depth'] < H-T
assert 0 < p['pilot_diameter'] < p['entry_diameter'] < W-2

def rounded(w,h,r,x=0,y=0):
    return box(x-w/2+r,y-h/2+r,x+w/2-r,y+h/2-r).buffer(r,resolution=16)

def solid(poly,h,z=0):
    poly=orient(poly,sign=1)
    curves=[np.array(poly.exterior.coords)[:-1]]+[np.array(i.coords)[:-1] for i in poly.interiors]
    return mf.CrossSection(curves).extrude(h).translate((0,0,z))

posts=[rounded(W,W,p['post_corner_radius'],*xy) for xy in centers]
bar=rounded(p['front_hole_spacing']+W,p['bar_depth'],.7,p['front_hole_spacing']/2,0)
stem=box(p['stem_x']-p['stem_width']/2,0,p['stem_x']+p['stem_width']/2,p['stem_end_y'])
diagonal=LineString([centers[2],(p['stem_x'],p['stem_end_y']-6.5)]).buffer(p['diagonal_width']/2,resolution=20)
outline=unary_union([bar,stem,diagonal,*posts])
# Close acute re-entrant corners, preserving the outside dimensions.
outline=outline.buffer(p['inner_fillet'],resolution=20).buffer(-p['inner_fillet'],resolution=20)
tabs=[rounded(p['tab_width'],p['tab_depth'],.25,p['stem_x'],-p['bar_depth']/2-p['tab_depth']/2),
      rounded(p['tab_width'],p['tab_depth'],.25,p['stem_x'],p['stem_end_y']-.4)]
footprint=unary_union([outline,*tabs])
model=solid(footprint,T)
for post in posts:
    model += solid(post,H-T,T)
for tab in tabs:
    model += solid(tab,p['tab_height_above_plate'],T)
for x,y in centers:
    model -= mf.Manifold.cylinder(p['pilot_depth']+.1,p['pilot_diameter']/2,
                                  circular_segments=64).translate((x,y,H-p['pilot_depth']))
    model -= mf.Manifold.cylinder(p['entry_depth']+.02,p['pilot_diameter']/2,
                                  p['entry_diameter']/2,circular_segments=64).translate((x,y,H-p['entry_depth']))
assert model.status()==mf.Error.NoError
model=model.simplify(.002)
# Body footprint 19.8 x 21.5 mm and installed height 8.2 mm interpreted from user context.
# The open insertion prism proves only lateral clearance at the assumed orientation.
servo_x=W/2+p['servo_side_clearance']
servo_y=-p['bar_depth']/2+p['servo_side_clearance']
servo_plan=box(servo_x,servo_y,servo_x+p['servo_body_width'],servo_y+p['servo_body_depth'])
probe=solid(servo_plan,H+5,T+.01)
intersection=(model ^ probe).volume()
assert intersection<1e-5,('servo insertion prism obstructed',intersection)
assert p['front_hole_spacing']-W >= p['servo_body_width']+2*p['servo_side_clearance']-1e-6
raw=model.to_mesh()
m=trimesh.Trimesh(np.asarray(raw.vert_properties)[:,:3],np.asarray(raw.tri_verts),process=True)
shift=-m.bounds[0]
m.apply_translation(shift)
path=R/'Reduced_10p2mm.stl'
m.export(path)
m=trimesh.load_mesh(path,process=True)
assert m.is_watertight and m.is_winding_consistent and m.is_volume
assert len(m.split())==1 and np.all(m.area_faces>1e-10)
assert np.allclose(m.bounds[0],0,atol=1e-6)
assert np.all(m.extents<256)

print_centers=centers+shift[:2]
small=m
old_path=R/'Original_16mm.stl'
shutil.copyfile(R/'inputs/original.stl',old_path)
original=trimesh.load_mesh(old_path,process=True)
old=json.loads((R/'inputs/original_geometry.json').read_text())
assert hashlib.sha256(old_path.read_bytes()).hexdigest()==old['stl_sha256']
parts={'Original_16mm':original,'Reduced_10p2mm':small}
reports={}
for name,mesh in parts.items():
    assert mesh.is_watertight and mesh.is_winding_consistent and mesh.is_volume
    assert len(mesh.split())==1 and np.all(mesh.area_faces>1e-10)
    assert np.allclose(mesh.bounds[0],0,atol=1e-6)
    height=float(mesh.extents[2])
    reports[name]={'extents_mm':mesh.extents.tolist(),'watertight':True,'consistent_normals':True,
        'connected_solids':1,'volume_mm3':mesh.volume,'triangles':len(mesh.faces),
        'minimum_triangle_area_mm2':float(mesh.area_faces.min()),
        'stl_sha256':hashlib.sha256((R/(name+'.stl')).read_bytes()).hexdigest(),
        'pilot_centers_print_xy_mm':old['pilot_centers_print_xy_mm'] if name.startswith('Original') else print_centers.tolist(),
        'pilot_floor_z_mm':height-p['pilot_depth'],'pilot_diameter_mm':p['pilot_diameter'],
        'pilot_depth_mm':p['pilot_depth'],'under_plate_height_mm':height-T,
        'physical_fit_verified':False,'physical_print_verified':False}
    (R/(name+'_geometry.json')).write_text(json.dumps(reports[name],indent=2)+'\n')
# The new clamp contacts the assumed flat top of an 8.2 mm installed body.
assert abs(H-T-p['servo_body_height'])<1e-6
for x,y in centers:
    cavity=mf.Manifold.cylinder(p['pilot_depth']-.2,.48,circular_segments=32).translate((x,y,H-p['pilot_depth']+.1))
    assert (model^cavity).volume()<1e-7
    floor=mf.Manifold.cylinder(.2,.48,circular_segments=32).translate((x,y,H-p['pilot_depth']-.3))
    assert abs((model^floor).volume()-floor.volume())<1e-6
checks={'servo_installed_dimensions_mm':[19.8,21.5,8.2],
    'dimension_orientation_assumed_from_previous_user_plan_dimensions':True,
    'servo_insertion_prism_intersection_mm3':intersection,
    'nominal_lateral_clearance_mm':.25,'vertical_clearance_at_contact_mm':0,
    'material_below_blind_hole_mm':H-p['pilot_depth'],
    'head_and_chassis_dimensions_known':False,
    'chassis_hole_positions_verified':False,'steering_motion_verified':False,
    'assembly_note':'Same screw coordinates as original trial. Three stock screws enter from chassis into post ends. Tip insertion must be less than 7.5 mm. No nuts or printed threads. Verify real chassis and body height before tightening.'}
(R/'small_assembly_validation.json').write_text(json.dumps(checks,indent=2)+'\n')
(R/'geometry_validation.json').write_text(json.dumps({'parts':reports,'small_assembly':checks},indent=2)+'\n')
write_3mf(None,'WLToys servo clamps - two height trials',R/'geometry_only.3mf',
          [(original,'Original_16mm',(80,110,0)),(small,'Reduced_10p2mm',(125,110,0))])
fig,axs=plt.subplots(1,2,figsize=(13,6),facecolor='#f3f0e9')
for ax,(name,mesh),color in zip(axs,parts.items(),['#21879a','#df8a34']):
    view3d(ax,[(mesh,color)],30,-60)
    title='Первый вариант: высота 16 мм\nПод пластиной 14 мм (оценка по фото)' if name.startswith('Original') else 'Уменьшенный: высота 10,2 мм\nПод пластиной 8,2 мм'
    ax.set_title(title,fontsize=12)
fig.suptitle('Две прижимные пластины на одном столе P1S',fontsize=16)
fig.text(.5,.04,'Одинаковый план 30,3 × 28,5 мм; корпус в плане 19,8 × 21,5 мм.\nКаналы Ø1,2 × 8 мм. Физическая посадка не проверена.',ha='center',fontsize=11)
fig.tight_layout(rect=(0,.12,1,.92));fig.savefig(R/'comparison.png',dpi=160)
print(json.dumps({name:r['extents_mm'] for name,r in reports.items()},indent=2))
