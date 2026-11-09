"""Corrected single clamp; servo dimensions were withdrawn by the user.
Run measure_photos.py to reproduce the evidence, then this source and slicer checks.
"""
from pathlib import Path
import json,hashlib
import numpy as np
import manifold3d as mf
import trimesh
from shapely.geometry import box,LineString,Point,Polygon
from shapely.geometry.polygon import orient
from shapely.ops import unary_union
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from cad_helpers import write_3mf,view3d
R=Path(__file__).resolve().parents[1]
p=json.loads((R/'parameters.json').read_text())
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
front_inner=-p['bar_depth']/2-p['front_tab_extension']
rear_inner=p['rear_tab_inner_y']
tabs=[rounded(p['tab_width'],p['tab_depth'],.25,p['stem_x'],front_inner-p['tab_depth']/2),
      rounded(p['tab_width'],p['tab_depth'],.25,p['stem_x'],rear_inner+p['tab_depth']/2)]
# A broad, overlapping tongue carries the extended tooth; no tangent-only join.
front_outer=front_inner-p['tab_depth']
rear_outer=rear_inner+p['tab_depth']
g=p['tab_outer_gusset']
tongues=[rounded(p['tab_width']+.8,(-.5)-(front_outer-g),.35,p['stem_x'],(front_outer-g-.5)/2),
         rounded(p['tab_width']+.8,rear_outer+g-(rear_inner-1),.35,p['stem_x'],(rear_outer+g+rear_inner-1)/2)]
footprint=unary_union([outline,*tabs,*tongues])
model=solid(footprint,T)
for post in posts:
    model += solid(post,H-T,T)
for tab in tabs:
    model += solid(tab,p['tab_height_above_plate'],T)
# Outside-only 45-degree gussets support the teeth without reducing servo space.
for outer,direction in [(front_outer,-1),(rear_outer,1)]:
    triangle=orient(Polygon([[outer-direction*.2,T],[outer+direction*g,T],
                             [outer-direction*.2,T+g+.2]]),sign=1)
    yz=mf.CrossSection([np.asarray(triangle.exterior.coords)[:-1]])
    gusset=yz.extrude(p['tab_width']-1).transform(np.array([[0,0,1,p['stem_x']-(p['tab_width']-1)/2],
                                                          [1,0,0,0],[0,1,0,0]]))
    model += gusset
    assert gusset.status()==mf.Error.NoError and gusset.volume()>2
for x,y in centers:
    model -= mf.Manifold.cylinder(p['pilot_depth']+.1,p['pilot_diameter']/2,
                                  circular_segments=64).translate((x,y,H-p['pilot_depth']))
    model -= mf.Manifold.cylinder(p['entry_depth']+.02,p['pilot_diameter']/2,
                                  p['entry_diameter']/2,circular_segments=64).translate((x,y,H-p['entry_depth']))
assert model.status()==mf.Error.NoError
model=model.simplify(.002)
raw=model.to_mesh()
m=trimesh.Trimesh(np.asarray(raw.vert_properties)[:,:3],np.asarray(raw.tri_verts),process=True)
shift=-m.bounds[0]
m.apply_translation(shift)
path=R/'servo_clamp_corrected.stl'
m.export(path)
m=trimesh.load_mesh(path,process=True)
assert m.is_watertight and m.is_winding_consistent and m.is_volume
assert len(m.split())==1 and np.all(m.area_faces>1e-10)
assert np.allclose(m.bounds[0],0,atol=1e-6)
assert np.all(m.extents<256)

print_centers=centers+shift[:2]
write_3mf(m,'WLToys servo clamp - current fit trial',R/'geometry_only.3mf')
checks=[]
for name,(x,y) in zip('ABC',centers):
    bore=mf.Manifold.cylinder(p['pilot_depth']-.2,p['pilot_diameter']/2-.03,circular_segments=32).translate((x,y,H-p['pilot_depth']+.1))
    assert (model^bore).volume()<1e-7
    floor=mf.Manifold.cylinder(.2,.48,circular_segments=32).translate((x,y,H-p['pilot_depth']-.3))
    assert abs((model^floor).volume()-floor.volume())<1e-6
    checks.append({'hole':name,'empty_bore_checked':True,'floor_checked':True})
# Verify that the extra space between the teeth is open in the finished solid.
for y in [front_inner+.05,rear_inner-.05]:
    probe=mf.Manifold.cube((p['tab_width']-.8,.02,p['tab_height_above_plate']-.1)).translate((p['stem_x']-(p['tab_width']-.8)/2,y,T+.05))
    assert (model^probe).volume()<1e-7
assert abs(rear_inner-front_inner-21.25)<1e-6
report={'status':'FIT_FEEDBACK_SINGLE_TRIAL','parameters':p,
    'extents_mm':m.extents.tolist(),'volume_mm3':m.volume,'triangles':len(m.faces),
    'watertight':True,'consistent_normals':True,'positive_volume':True,'connected_solids':1,
    'minimum_triangle_area_mm2':float(m.area_faces.min()),'bounds_mm':m.bounds.tolist(),
    'print_shift_mm':shift.tolist(),'pilot_centers_print_xy_mm':print_centers.tolist(),
    'pilot_checks':checks,'pilot_floor_z_mm':H-p['pilot_depth'],
    'minimum_post_wall_mm':(W-p['entry_diameter'])/2,
    'nominal_under_plate_height_mm':H-T,
    'front_clear_width_mm':p['front_hole_spacing']-W,
    'between_tabs_clear_depth_mm':tabs[1].bounds[1]-tabs[0].bounds[3],
    'tab_bounds_xy_mm':[list(t.bounds) for t in tabs],
    'tab_root_depth_mm':p['tab_depth'],
    'outside_gusset_mm':g,'tongue_thickness_mm':T,
    'tab_clearance_probes_passed':True,
    'hole_distances_mm':{name:float(np.linalg.norm(centers[i]-centers[j])) for name,i,j in [('AB',0,1),('AC',0,2),('BC',1,2)]},
    'previous_servo_dimensions_valid':False,'servo_fit_computation_performed':False,
    'physical_fit_verified':False,'physical_print_verified':False,
    'previous_oversized_reference_physically_printed_user_report':True,
    'assembly_limitations':'Latest physical trial: bores too small, front tooth broke during servo insertion. Revised bores and tooth; post height reduced by 0.5 mm from H13.5 to H13 at user request. Actual servo and screw dimensions remain unmeasured; fit and durability require trial.',
    'stl_sha256':hashlib.sha256(path.read_bytes()).hexdigest()}
(R/'geometry_validation.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
plt.rcParams['font.family']='DejaVu Sans'
fig=plt.figure(figsize=(14,10),facecolor='#f3f0e9')
ax=fig.add_subplot(221);view3d(ax,[(m,'#21879a')],35,-60)
ax.set_title('Исправленная: стойки вверх, плоская сторона на столе')
ax=fig.add_subplot(222)
cut=m.section(plane_origin=[p['stem_x']+shift[0],0,0],plane_normal=[1,0,0])
for c in cut.discrete:ax.plot(c[:,1]-shift[1],c[:,2],color='#176074',lw=1.5)
ax.annotate('',(front_inner,5),(rear_inner,5),arrowprops={'arrowstyle':'<->'})
ax.text((front_inner+rear_inner)/2,5.4,f'{rear_inner-front_inner:g} мм между зубчиками',ha='center')
ax.set(xlim=(front_outer-g-1,rear_outer+g+1),ylim=(-.5,7),aspect='equal',
       title='Зубчики 2,2 мм; усиления снаружи; основание 2 мм',xlabel='Y, мм',ylabel='Z печати, мм')
ax.grid(alpha=.15)
ax=fig.add_subplot(223)
for poly in [footprint,*posts]:
    c=np.asarray(poly.exterior.coords);ax.plot(c[:,0],c[:,1],color='#176074',lw=1.4)
for name,(x,y) in zip('ABC',centers):
    ax.add_patch(plt.Circle((x,y),p['pilot_diameter']/2,fill=False,color='#c45135'))
    ax.annotate(f'{name} ({x:.3g}; {y:.3g})',(x,y),xytext=(x-6 if name=='B' else x+1,y+3),fontsize=10)
ax.annotate('',(0,-5.5),(p['front_hole_spacing'],-5.5),arrowprops={'arrowstyle':'<->'})
ax.text(p['front_hole_spacing']/2,-7.3,f"{p['front_hole_spacing']:g} мм между A–B",ha='center')
ax.set(xlim=(-4,30),ylim=(-9,28),aspect='equal',title='Вид со стороны отверстий • мм',xlabel='X',ylabel='Y');ax.grid(alpha=.15)
ax=fig.add_subplot(224)
section=m.section(plane_origin=[0,print_centers[0,1],0],plane_normal=[0,1,0])
for c in section.discrete:ax.plot(c[:,0],c[:,2],color='#176074',lw=1.5)
ax.text(14,8.7,f"Ø{p['pilot_diameter']:g} × {p['pilot_depth']:g} мм\nбез резьбы",ha='center',fontsize=11)
ax.text(14,4,f'Под пластиной {H-T:g} мм',ha='center',fontsize=11)
ax.annotate('',(31,0),(31,H),arrowprops={'arrowstyle':'<->'})
ax.text(32,H/2,f'{H:g} мм',rotation=90,va='center')
ax.set(xlim=(-2,35),ylim=(-1,16),aspect='equal',title=f'Разрез A–B: под дном каналов {H-p["pilot_depth"]:g} мм',xlabel='X, мм',ylabel='Z печати, мм');ax.grid(alpha=.15)
fig.suptitle(f'WLToys • отверстия Ø1,6 • общая высота {H:g} мм • передний зубчик наружу на 1 мм',fontsize=15)
fig.text(.5,.02,'Один экземпляр в проекте. Низкий вариант исключён. Физическая посадка новой модели не проверена.',ha='center',fontsize=11)
fig.tight_layout(rect=(0,.05,1,.95));fig.savefig(R/'design_preview.png',dpi=160)
print(json.dumps({'extents_mm':m.extents.tolist(),'under_plate_mm':H-T,'hole_centers_mm':centers.tolist()},indent=2))

# User-requested simultaneous second variant; the original STL stays unchanged.
from build_thin import build as build_thin_variant
build_thin_variant()
