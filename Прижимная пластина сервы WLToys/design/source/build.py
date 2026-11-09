"""Photo-derived servo clamp, mm. Run with the workspace .venv Python.

parameters.json is the editable dimensional source. This is a fit trial,
not measured OEM geometry. No printed thread, three blind pilot bores.
"""
from pathlib import Path
import json, hashlib
import numpy as np
import manifold3d as mf
import trimesh
from shapely.geometry import box, LineString, Point
from shapely.geometry.polygon import orient
from shapely.ops import unary_union
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from cad_helpers import write_3mf, view3d

R = Path(__file__).resolve().parents[1]
p = json.loads((R/'parameters.json').read_text())
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
# Known body footprint supplied by the user; height remains unknown.
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
path=R/'servo_clamp_trial.stl'
m.export(path)
m=trimesh.load_mesh(path,process=True)
assert m.is_watertight and m.is_winding_consistent and m.is_volume
assert len(m.split())==1 and np.all(m.area_faces>1e-10)
assert np.allclose(m.bounds[0],0,atol=1e-6)
assert np.all(m.extents<256)
print_centers=centers+shift[:2]
write_3mf(m,'WLToys servo clamp - photo fit trial',R/'geometry_only.3mf')
# Direct manifold probes: pilot interior empty; floor below it solid.
checks=[]
for name,(x,y) in zip('ABC',centers):
    for z in (H-p['pilot_depth']+.1,H-2,H-.15):
        probe=mf.Manifold.cylinder(.05,.48,circular_segments=32).translate((x,y,z))
        assert (model ^ probe).volume()<1e-8
    floor=mf.Manifold.cylinder(.2,.48,circular_segments=32).translate((x,y,H-p['pilot_depth']-.3))
    assert abs((model ^ floor).volume()-floor.volume())<1e-6
    checks.append({'hole':name,'center_mm':print_centers['ABC'.index(name)].tolist(),
                   'open_above_z_mm':H-p['pilot_depth'],'floor_present':True})

# Record the actual image landmarks and calibration, so assumptions can be audited.
pix=np.array([[364,450],[459,450],[557,452],[654,452],[360,537],[463,539],[563,539],[669,541],
              [358,634],[466,635],[572,635],[681,636],[354,737],[470,738],[583,738],[700,739]],float)
mm=np.array([[x,y] for y in [0,10,20,30] for x in [0,10,20,30]],float)
a=[];b=[]
for (u,v),(x,y) in zip(pix,mm):
    a.extend([[u,v,1,0,0,0,-x*u,-x*v],[0,0,0,u,v,1,-y*u,-y*v]]);b.extend([x,y])
hom=np.r_[np.linalg.lstsq(a,b,rcond=None)[0],1].reshape(3,3)
def rectified(points):
    q=np.c_[points,np.ones(len(points))]@hom.T
    return q[:,:2]/q[:,2,None]
roots=np.array([[388,711],[645,711],[423,518]])
inferred=rectified(roots)
inferred-=inferred[0].copy()
inferred[:,1]*=-1
evidence={'source':'photo_2026-10-30_11-46-12.jpg','grid_pixels':pix.tolist(),
          'grid_mm':mm.tolist(),'pixel_to_grid_homography':hom.tolist(),
          'grid_fit_rms_mm':float(np.sqrt(np.mean((rectified(pix)-mm)**2))),
          'estimated_post_root_pixels':roots.tolist(),'estimated_relative_centers_mm':inferred.tolist(),
          'important':'Roots are manually estimated, partly occluded, and above mat; grid residual is NOT part dimensional accuracy.',
          'other_photos':'35: outline and two tabs; 22/26/32/38: post arrangement and approximate height.',
          'height_method':'Side-view comparison with nearby grid; 16 mm adopted with roughly +/- 2 mm uncertainty; no calibrated 3D scan.',
          'practical_uncertainty_mm':{'hole_pitch':1,'rear_hole_position':1.5,'total_height':2,'plate_thickness':.5},
          'user_measurement_mm':[p['servo_body_width'],p['servo_body_depth']],
          'design_change':'Photo-only AB=23 and C_y=20 would not clear the known servo body. Adopted AB=25.3, C_y=22 for a 19.8 x 21.5 footprint and 0.25 mm clearance each side. Chassis pitch must be trial fitted.',
          'source_hashes':{f.name:hashlib.sha256(f.read_bytes()).hexdigest() for f in sorted(R.parent.glob('*.jpg'))}}
(R/'photo_estimates.json').write_text(json.dumps(evidence,indent=2)+'\n')
report={'status':'PHOTO_ESTIMATED_FIT_TRIAL','physical_fit_verified':False,'physical_print_verified':False,
        'parameters':p,'extents_mm':m.extents.tolist(),'volume_mm3':m.volume,'triangles':len(m.faces),
        'watertight':True,'consistent_normals':True,'positive_volume':True,'connected_solids':1,
        'minimum_triangle_area_mm2':float(m.area_faces.min()),'bounds_mm':m.bounds.tolist(),
        'print_shift_mm':shift.tolist(),'pilot_centers_print_xy_mm':print_centers.tolist(),
        'pilot_checks':checks,'minimum_post_wall_mm':(W-p['entry_diameter'])/2,
        'pilot_floor_z_mm':H-p['pilot_depth'],
        'known_servo_footprint_mm':[p['servo_body_width'],p['servo_body_depth']],
        'servo_height_known':False,'nominal_under_plate_height_mm':H-T,
        'servo_plan_bounds_design_mm':list(servo_plan.bounds),
        'servo_vertical_insertion_prism_intersection_mm3':intersection,
        'nominal_servo_side_clearance_mm':p['servo_side_clearance'],
        'front_clear_width_mm':p['front_hole_spacing']-W,
        'between_tabs_clear_depth_mm':tabs[1].bounds[1]-tabs[0].bounds[3],
        'hole_distances_mm':{'AB':float(np.linalg.norm(centers[1]-centers[0])),
                             'AC':float(np.linalg.norm(centers[2]-centers[0])),
                             'BC':float(np.linalg.norm(centers[2]-centers[1]))},
        'assembly_limitations':'Only the photographed part is available. Chassis, servo, screw dimensions, access, clearances and full steering travel cannot be validated.',
        'construction':'Single solid. Flat outer face on bed, posts and blind holes upward. Decorative molded rim omitted; solid 2 mm plate.',
        'stl_sha256':hashlib.sha256(path.read_bytes()).hexdigest()}
(R/'geometry_validation.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')

plt.rcParams['font.family']='DejaVu Sans'
fig=plt.figure(figsize=(14,10),facecolor='#f3f0e9')
ax=fig.add_subplot(221);view3d(ax,[(m,'#21879a')],35,-60)
ax.set_title('Печатная ориентация: стойки вверх',fontsize=12)
ax=fig.add_subplot(222);inv=m.copy();inv.apply_transform(trimesh.transformations.rotation_matrix(np.pi,[1,0,0]))
view3d(ax,[(inv,'#21879a')],35,-60);ax.set_title('Рабочее положение: плоская сторона сверху',fontsize=12)
ax=fig.add_subplot(223)
for poly in [footprint,*posts]:
    v=np.asarray(poly.exterior.coords);ax.plot(v[:,0],v[:,1],color='#176074',lw=1.4)
for name,(x,y) in zip('ABC',centers):
    ax.add_patch(plt.Circle((x,y),p['pilot_diameter']/2,fill=False,color='#c45135'))
    ax.annotate(f'{name} ({x:g}; {y:g})',(x,y),xytext=(x-6 if name=='B' else x+1,y+3),fontsize=10)
sv=np.asarray(servo_plan.exterior.coords)
ax.plot(sv[:,0],sv[:,1],'--',color='#bf7b27',lw=1.2,label='Корпус 19,8 × 21,5')
ax.legend(fontsize=8,loc='lower right')
ax.annotate('',(0,-6),(p['front_hole_spacing'],-6),arrowprops={'arrowstyle':'<->'})
ax.text(p['front_hole_spacing']/2,-7.8,f"{p['front_hole_spacing']:g} мм между A–B",ha='center')
ax.set(xlim=(-5,31),ylim=(-10,29),aspect='equal',title='Вид со стороны отверстий • мм',xlabel='X',ylabel='Y')
ax.grid(alpha=.15)
ax=fig.add_subplot(224)
section=m.section(plane_origin=[0,print_centers[0,1],0],plane_normal=[0,1,0])
for line in section.discrete:ax.plot(line[:,0],line[:,2],color='#176074',lw=1.5)
ax.annotate('',(32,0),(32,H),arrowprops={'arrowstyle':'<->'})
ax.text(33,H/2,f'{H:g} мм',rotation=90,va='center')
ax.text(10,12,'Глухие каналы\nØ1,2 × 8 мм\nбез резьбы',fontsize=11)
ax.text(10,4,'Пластина 2 мм',fontsize=11)
ax.set(xlim=(-2,37),ylim=(-1,H+2),aspect='equal',title='Разрез через стойки A–B',xlabel='X, мм',ylabel='Z печати, мм')
ax.grid(alpha=.15)
fig.suptitle('WLToys • прижимная пластина сервы • пробная модель по фото',fontsize=17)
fig.text(.5,.015,'Размеры оценочные. Физическая посадка не проверена. Один экземпляр для примерки.',ha='center',fontsize=11,color='#9e4428')
fig.tight_layout(rect=(0,.04,1,.96));fig.savefig(R/'design_preview.png',dpi=170);plt.close(fig)
print(json.dumps({'extents_mm':m.extents.tolist(),'volume_mm3':m.volume,'centers':print_centers.tolist()},indent=2))
