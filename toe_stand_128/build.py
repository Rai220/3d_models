"""Rail-guided RC toe stand, mm. Edit parameters.json and rebuild + reslice.

Manifold solids are kept in assembly coordinates until their final print
orientation is applied. Printed bearings, axially retained side-loading M3 nuts, no solid base plate.
Only M3x10 and M3x16 countersunk screws. Length includes the head.
"""
from pathlib import Path
import json
import hashlib
import math
import numpy as np
import trimesh
import manifold3d as mf
from shapely.geometry import box, Polygon, Point
from shapely.geometry.polygon import orient
from shapely.affinity import translate, rotate
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.textpath import TextPath
from matplotlib.font_manager import FontProperties
from cad_helpers import view3d

SRC=Path(__file__).resolve().parent
OUT=SRC
P=json.loads((SRC/'parameters.json').read_text())

def extrude(poly,h,z=0):
    if poly.is_empty:return mf.Manifold()
    if poly.geom_type=='MultiPolygon':
        return sum((extrude(p,h,z) for p in poly.geoms),mf.Manifold())
    p=orient(poly,sign=1)
    return mf.CrossSection([np.asarray(p.exterior.coords)[:-1]]+
             [np.asarray(h.coords)[:-1] for h in p.interiors]).extrude(h).translate((0,0,z))

def block(x0,y0,z0,x1,y1,z1):return extrude(box(x0,y0,x1,y1),z1-z0,z0)

def circle(r,x=0,y=0):return Point(x,y).buffer(r,quad_segs=32)

def hole(d,h,z=0,x=0,y=0):return extrude(circle(d/2,x,y),h,z)

def hexagon(af,x=0,y=0):
    r=af/math.sqrt(3)
    a=np.radians(np.arange(6)*60+30)
    return Polygon(np.column_stack([x+r*np.cos(a),y+r*np.sin(a)]))

def hexhole(af,h,z=0,x=0,y=0):return extrude(hexagon(af,x,y),h,z)

def mesh(s):
    assert s.status()==mf.Error.NoError,s.status()
    raw=s.simplify(.0001).to_mesh()
    m=trimesh.Trimesh(np.asarray(raw.vert_properties)[:,:3],np.asarray(raw.tri_verts),process=True)
    # Boolean circle/cone seams may collapse to identical float32 vertices.
    # Remove those zero-area triangles, then require a closed single shell.
    m.update_faces(m.nondegenerate_faces())
    m.remove_unreferenced_vertices()
    assert m.is_watertight and m.is_winding_consistent and m.volume>0
    assert len(m.split())==1 and np.all(m.nondegenerate_faces())
    return m

def along_x(poly,length):
    # Polygon coordinates are (Y,Z), extrusion becomes X.
    return extrude(poly,length).rotate((90,0,90)).translate((-length/2,0,0))

def countersink(top,x=0,y=0):
    r=P['bolt_clearance']/2; R=P['countersink_diameter']/2
    # 90-degree recess, 0.1 mm overlap into the through bore.
    h=R-r+.1
    return mf.Manifold.cylinder(h,r-.1,R,128).translate((x,y,top-h))

def rail(length, mounting_x=()):
    b,n,t=P['rail_base_width']/2,P['rail_neck_width']/2,P['rail_top_width']/2
    bh,nh,h=P['rail_base_height'],P['rail_neck_top'],P['rail_height']
    profile=Polygon([(-b,0),(b,0),(b,bh),(n,bh),(n,nh),(t,h),(-t,h),(-n,nh),(-n,bh),(-b,bh)])
    s=along_x(profile,length)
    for x in mounting_x:
        s-=hole(P['bolt_clearance'],h+2,-1,x,0)
        s-=countersink(h,x,0)
    return s

def guide_void(length):
    c=P['guide_side_clearance'];b=P['rail_base_width']/2+c
    n=P['rail_neck_width']/2+c;t=P['rail_top_width']/2+c
    z=P['rail_height'];nt=P['rail_neck_top'];bh=P['rail_base_height']+.3
    return along_x(Polygon([(-b,-1),(b,-1),(b,bh),(n,bh),(n,nt),(t,z),
                            (t,z+P['guide_top_clearance']),(-t,z+P['guide_top_clearance']),
                            (-t,z),(-n,nt),(-n,bh),(-b,bh)]),length+2)

def side_nut_slot(z0,z1,y=0):
    # Nut slides in along X. Continuous material above and below retains it
    # against both starting and tightening forces; no thin nut-pocket membrane.
    return block(-P['slider_length']/2-1,y-P['nut_af']/2,z0,
                 3.5,y+P['nut_af']/2,z1)

def slider(top,pivot=False,mounts=False):
    length=P['slider_length'];width=P['slider_width']
    s=block(-length/2,-width/2,P['slider_bottom'],length/2,width/2,top)-guide_void(length)
    cx,cz=P['clamp_x'],P['clamp_z']
    # M3x10 direct clamp: recessed 90-degree head has travel before bottoming.
    passage=hole(P['bolt_clearance'],width/2+2,-1).rotate((-90,0,0)).translate((cx,0,cz))
    cs=countersink(width/2).rotate((-90,0,0)).translate((cx,0,cz))
    s-=passage+cs
    # Horizontal side loading, with the nut flats parallel to Z. Axial walls
    # retain the nut in Y; the loading slot opens at the X end of the slider.
    s-=block(cx-3.5,P['clamp_nut_inner_y'],cz-P['nut_af']/2,
             length/2+1,P['clamp_nut_outer_y'],cz+P['nut_af']/2)
    if pivot:
        s-=side_nut_slot(P['pivot_nut_bottom'],P['pivot_nut_top'])
        s-=hole(P['bolt_clearance'],top-P['rail_height']+1,P['rail_height'])
    if mounts:
        for y in (-P['mount_x'],P['mount_x']):
            s-=side_nut_slot(P['saddle_nut_bottom'],P['saddle_nut_top'],y)
            s-=hole(P['bolt_clearance'],top+2,-1,0,y)
    return s

def letters(text,x,y,size=3.6):
    path=TextPath((0,0),text,size=size,prop=FontProperties(family='DejaVu Sans',weight='bold'))
    shape=Polygon()
    # XOR preserves enclosed counters in the engraved 0, R, etc.
    for points in path.to_polygons():
        if len(points)>2:shape=shape.symmetric_difference(Polygon(points))
    a,b,c,d=shape.bounds
    return translate(shape,xoff=x-(a+c)/2,yoff=y-(b+d)/2)

def degree_scale_polygons(side):
    R=P['scale_tick_radius'];w=P['scale_tick_width']
    grooves=Polygon()
    for theta in np.arange(-P['design_max_toe_per_wheel_deg'],
                            P['design_max_toe_per_wheel_deg']+.01,P['scale_tick_step_deg']):
        length=5 if abs(theta) in (0,5) else 3
        grooves=grooves.union(rotate(box(R,-w/2,R+length,w/2),theta,origin=(0,0)))
    for theta in (-5,0,5):
        label='0' if theta==0 else f'{int(side*theta):+d}'
        a=math.radians(theta)
        grooves=grooves.union(letters(label,60.5*math.cos(a),60.5*math.sin(a)))
    grooves=grooves.union(letters('R' if side>0 else 'L',39,6,size=4))
    return grooves

def wheel_carriage(side):
    top=P['wheel_carriage_top'];R=P['scale_tick_radius'];outer=P['scale_outer_radius']
    angles=np.radians(np.linspace(-P['scale_sector_half_angle_deg'],P['scale_sector_half_angle_deg'],73))
    sector=Polygon(np.vstack([np.column_stack([outer*np.cos(angles),outer*np.sin(angles)]),
                            np.column_stack([(R-3)*np.cos(angles[::-1]),(R-3)*np.sin(angles[::-1])])]))
    stalk=box(13,-3.5,R,3.5)
    shelf=sector.union(stalk).union(box(35,3,43,9))
    s=slider(top,pivot=True)+extrude(shelf,P['scale_plate_thickness'],top-P['scale_plate_thickness'])
    return s-extrude(degree_scale_polygons(side),P['scale_engraving_depth']+.01,top-P['scale_engraving_depth'])

def wheel_unit():
    # Single printable body: wheel pad, side-contact gauge, pointer and noses.
    # There are no mounting nuts and no thin nut roofs in this rotating part.
    r=P['platform_radius'];t=P['platform_thickness'];o=P['contact_offset_from_pivot']
    L=P['gauge_length'];span=P['measurement_span']
    shape=circle(r).union(box(o,-L/2,o+16,L/2))
    # Bring the support pad into the gauge foundation without a thin neck.
    shape=shape.union(box(8,-12,o+16,12))
    for y in (-span/2,span/2):
        shape=shape.union(Polygon([(o+8,y-4),(o+17,y-1),(o+17,y+1),(o+8,y+4)]))
        shape=shape.union(circle(1,o+17,y))
    s=extrude(shape,t)
    pr=P['pointer_tip_radius']
    pointer=box(12,-1.5,pr-5,1.5).union(Polygon([(pr-6,-2),(pr,-.25),(pr,.25),(pr-6,2)]))
    s+=extrude(pointer,P['pointer_thickness'])
    s+=block(o+6,-L/2,t,o+9,L/2,t+P['gauge_backbone_height'])
    for y in (-P['contact_spacing']/2,P['contact_spacing']/2):
        s+=block(o,y-P['contact_width']/2,t,o+9,y+P['contact_width']/2,t+P['gauge_contact_height'])
    s-=hole(P['bolt_clearance'],t+2,-1)
    s-=countersink(t)
    return s

def foot():
    d=P['foot_side'];h=P['foot_height']
    shape=box(-d/2+3,-d/2+3,d/2-3,d/2-3).buffer(3,quad_segs=12)
    s=extrude(shape,h)
    # Through bolt from rail top; nut is reached from UNDER the foot.
    # The 7.4 mm shoulder above it carries the clamping load.
    s-=hexhole(P['nut_af'],P['foot_nut_depth']+.1,-.1)
    s-=hole(P['bolt_clearance'],h+2,-1)
    return s

def zero():
    w,l=P['zero_width'],P['zero_length']
    shape=box(-w/2,-l/2,-w/2+2.4,l/2).union(box(w/2-2.4,-l/2,w/2,l/2))
    shape=shape.union(box(-w/2,-2,w/2,2))
    return extrude(shape,P['zero_height'])

def fit_slider():
    # Actual guide, pivot nut slot and clamp, without the scale shelf.
    return slider(P['wheel_carriage_top'],pivot=True)

parts={
 'spine':rail(P['spine_length']),
 'crossrail':rail(P['crossrail_length'],[-P['foot_mount_x'],-P['mount_x'],P['mount_x'],P['foot_mount_x']]),
 'axle_saddle':slider(P['axle_saddle_top'],mounts=True),
 'wheel_carriage_right':wheel_carriage(1),
 'wheel_carriage_left':wheel_carriage(-1),
 'wheel_unit':wheel_unit(),
 'bearing_washer':extrude(circle(P['bearing_od']/2).difference(circle(P['bearing_id']/2)),P['bearing_thickness']),
 'foot':foot(),'zero_block':zero(),
 'fit_rail':rail(40),'fit_slider':fit_slider(),
}
count={'spine':1,'crossrail':2,'axle_saddle':2,'wheel_carriage_right':2,'wheel_carriage_left':2,'wheel_unit':4,
       'bearing_washer':4,'foot':4,'zero_block':1}
inverted={'axle_saddle','wheel_carriage_right','wheel_carriage_left','fit_slider'}
print_solids={}
for name,s in parts.items():
    q=s.rotate((180,0,0)) if name in inverted else s
    b=np.array(q.bounding_box()).reshape(2,3)
    print_solids[name]=q.translate((0,0,-b[0,2]))
meshes={}
for n,s in print_solids.items():
    print('Mesh',n,flush=True)
    meshes[n]=mesh(s)
assembly_meshes={n:mesh(s) for n,s in parts.items()}
v={'units':'millimeter','variant':'1:28 M3x10/M3x16 countersunk mechanical redesign','parameters':P,'quantities':count,
   'assumed_nozzle_mm':.4,'assumed_material':'Generic PLA',
   'physical_fit_verified':False,'physical_print_verified':False,
   'measurement_accuracy_verified':False,'bambu_studio_slicing_verified':False,'parts':{}}
for n,m in meshes.items():
    path=OUT/f'{n}.stl';m.export(path)
    r=trimesh.load_mesh(path)
    assert r.is_watertight and r.is_winding_consistent and r.volume>0
    assert len(r.split())==1 and np.all(r.nondegenerate_faces())
    assert np.allclose(r.extents,m.extents,atol=1e-4) and abs(r.bounds[0,2])<1e-5
    assert max(r.extents)<250
    v['parts'][n]={'file':f'{n}.stl','extents_mm':r.extents.round(4).tolist(),
       'watertight':True,'consistent_normals':True,'connected_components':1,'degenerate_triangles':0,
       'positive_volume_mm3':round(r.volume,3),'minimum_z_mm':round(r.bounds[0,2],5),
       'sha256':hashlib.sha256(path.read_bytes()).hexdigest(),
       'print_inverted_from_assembly':n in inverted}

# Mating checks are performed on the final float32 STL mesh converted back to solids.
def from_mesh(m):
    return mf.Manifold(mf.Mesh(np.asarray(m.vertices,dtype=np.float32),np.asarray(m.faces,dtype=np.uint32)))
reloaded={}
for n in parts:
    m=trimesh.load_mesh(OUT/f'{n}.stl')
    if n in inverted:
        # Undo normalization and print inversion to restore assembly Z.
        top=P['wheel_carriage_top'] if n.startswith('wheel_carriage') else (P['wheel_carriage_top'] if n=='fit_slider' else P['axle_saddle_top'])
        m.apply_transform(trimesh.transformations.rotation_matrix(math.pi,[1,0,0]))
        m.apply_translation([0,0,top])
    reloaded[n]=from_mesh(m)
checks=[]
for slider_name in ('axle_saddle','wheel_carriage_right','wheel_carriage_left','fit_slider'):
    for shift in (-5,0,5):
        overlap=(reloaded[slider_name].translate((shift,0,0)) ^ reloaded['fit_rail']).volume()
        assert overlap<1e-5,(slider_name,overlap)
        checks.append({'slider':slider_name,'offset_mm':shift,'intersection_mm3':overlap})
# Hardware corridors: M3 shaft clearances, nut pockets, and guide roof are separate.
shaft=hole(3.0,12,7.5)
assert (reloaded['wheel_carriage_right'] ^ shaft).volume()<1e-5
assert 7.5>P['rail_height']
v['guide_mating_checks']=checks
v['pivot_shaft_probe_tip_clearance_above_rail_mm']=1.5

# Four complete independent measurement stations, including the rear axle.
def place(n,xyz=(0,0,0),angle=0):
    return reloaded[n].rotate((0,0,angle)).translate(xyz)

def assembly(wb=98,width_front=78,width_rear=78,toe=0,rear_toe=0,with_zero=False):
    items=[]
    spine_z=P['foot_height']-P['axle_saddle_top']
    items.append(('spine',place('spine',(0,0,spine_z),90),'#627981'))
    beam_z=P['foot_height'];car_top=beam_z+P['wheel_carriage_top']
    platform_z=car_top+P['bearing_thickness'];wheel_z=platform_z+P['platform_thickness']
    for axle,y,width in [('front',wb/2,width_front),('rear',-wb/2,width_rear)]:
        items.append((axle+'_saddle',place('axle_saddle',(0,y,spine_z),90),'#c3cfd1'))
        items.append((axle+'_rail',place('crossrail',(0,y,beam_z)),'#627981'))
        for side in (-1,1):
            px=side*(width/2-P['contact_offset_from_pivot'])
            base_angle=180 if side<0 else 0
            a=base_angle+side*(toe if axle=='front' else rear_toe)
            items.append((f'{axle}_foot_{side}',place('foot',(side*P['foot_mount_x'],y,0)),'#627981'))
            carrier='wheel_carriage_left' if side<0 else 'wheel_carriage_right'
            items.append((f'{axle}_carrier_{side}',place(carrier,(px,y,beam_z),base_angle),'#c3cfd1'))
            items.append((f'{axle}_bearing_{side}',place('bearing_washer',(px,y,car_top)),'#dca24a'))
            items.append((f'{axle}_platform_{side}',place('wheel_unit',(px,y,platform_z),a),'#168c98'))
    if with_zero:items.append(('zero',place('zero_block',(0,wb/2,wheel_z)),'#dfa343'))
    return items,wheel_z

# Pairwise collision audit excludes only intentional touching/union mates;
# intersections of ALL separate printed parts must have zero volume.
assembly_cases=[]
cases=[(70,50,50,0,0),(98,78,78,0,0)]
cases += [(wb,wf,wr,tf,tr) for wb in (70,140) for wf in (50,120) for wr in (50,120)
          for tf in (-5,5) for tr in (-5,5)]
for wb,wf,wr,toe,rear_toe in cases:
    items,wz=assembly(wb,wf,wr,toe,rear_toe)
    intersections=[]
    for i,(n,a,col) in enumerate(items):
        for nn,b,co in items[i+1:]:
            bb1=np.array(a.bounding_box()).reshape(2,3);bb2=np.array(b.bounding_box()).reshape(2,3)
            if np.any(np.minimum(bb1[1],bb2[1])-np.maximum(bb1[0],bb2[0])<1e-5):continue
            volume=(a ^ b).volume()
            assert volume<.002,(wb,wf,wr,toe,rear_toe,n,nn,volume)
            intersections.append(volume)
    assembly_cases.append({'wheelbase':wb,'front_width':wf,'rear_width':wr,'front_toe_per_wheel':toe,'rear_toe_per_wheel':rear_toe,
                          'maximum_intersection_mm3':max(intersections,default=0)})
v['assembly_collision_cases']=assembly_cases
v['wheel_support_height_mm']=P['foot_height']+P['wheel_carriage_top']+P['bearing_thickness']+P['platform_thickness']
v['degree_scale']={'min_deg':-5,'max_deg':5,'tick_step_deg':P['scale_tick_step_deg'],
    'tick_pitch_at_50mm_mm':2*P['scale_tick_radius']*math.sin(math.radians(P['scale_tick_step_deg']/2)),
    'pointer_to_scale_vertical_clearance_mm':P['bearing_thickness'],
    'positive_means':'toe-in on correctly installed L/R carriages, chassis front toward +Y',
    'individual_zero_and_chassis_alignment_required':True,'scale_step_is_not_accuracy':True}

(OUT/'geometry_validation.json').write_text(json.dumps(v,ensure_ascii=False,indent=2)+'\n')

# Actual-part CAD preview. No grey wheel or car geometry is exported for printing.
items,wz=assembly()
display=[(mesh(s),col) for n,s,col in items]
car=[]
for y in (-49,49):
    for side in (-1,1):
        tire=trimesh.creation.cylinder(13,10,sections=64)
        tire.apply_transform(trimesh.transformations.rotation_matrix(math.pi/2,[0,1,0]))
        tire.apply_translation((side*34,y,wz+13));car.append((tire,'#424b52'))
body=trimesh.creation.box([43,116,6]);body.apply_translation((0,0,wz+13));car.append((body,'#abb1b3'))
fig,axes=plt.subplots(1,2,figsize=(16,8),facecolor='#f3f0e9')
view3d(axes[0],display+car,40,-61)
view3d(axes[1],display,48,-62)
axes[0].set_title('Колёса стоят на поворотных площадках',fontsize=16)
axes[1].set_title('Открытая рама · ползунки по ширине и базе',fontsize=16)
fig.suptitle('Стенд 1:28 · исправленное крепление М3×10 / М3×16',fontsize=23,y=.96)
fig.text(.5,.075,'4 цельных колёсных узла   •   4 шкалы ±5°   •   Сквозное крепление ножек',ha='center',fontsize=14)
fig.text(.5,.035,'Серая машина — условный габарит. Метизы на визуализации не показаны.',ha='center',fontsize=11,color='#5b6970')
fig.subplots_adjust(left=.015,right=.985,bottom=.12,top=.86,wspace=.01)
fig.savefig(OUT/'preview.png',dpi=165,facecolor=fig.get_facecolor());plt.close(fig)
print(json.dumps({'printable_parts':sum(count.values()),'parts':{n:v['parts'][n]['extents_mm'] for n in parts},
                  'wheel_support_height':v['wheel_support_height_mm']},ensure_ascii=False,indent=2))
