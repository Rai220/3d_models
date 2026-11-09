"""Thin servo sits on top; horizontal ear screws enter from shaft side.
All coordinates are assembly coordinates, mm; Z=0 is the chassis plane.
Ear geometry is an explicit photo-based assumption, not a measured interface.
"""
from pathlib import Path
import json,hashlib
import numpy as np
import manifold3d as mf
import trimesh
from shapely.geometry import box,LineString
from shapely.affinity import translate
from shapely.geometry.polygon import orient
from shapely.ops import unary_union
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from cad_helpers import write_3mf,view3d

R=Path(__file__).resolve().parents[1]
def build():
    p=json.loads((R/'parameters_thin.json').read_text())
    oldp=json.loads((R/'parameters.json').read_text())
    old=trimesh.load_mesh(R/'servo_clamp_corrected.stl',process=True)
    assert hashlib.sha256((R/'servo_clamp_corrected.stl').read_bytes()).hexdigest()==p['original_stl_sha256']
    centers=np.array([[0.,0.],[oldp['front_hole_spacing'],0.],[oldp['rear_hole_x'],oldp['rear_hole_y']]])
    L=p['post_free_length'];T=p['plate_thickness'];top=L+T;base_cx=oldp['stem_x'];dx=p['servo_offset_x_mm'];cx=base_cx+dx
    assert L==0 and T==5
    assert p['chassis_holes_through'] and p['chassis_pilot_depth']==T
    def rounded(w,h,r,x,y):
        return box(x-w/2+r,y-h/2+r,x+w/2-r,y+h/2-r).buffer(r,resolution=16)
    def solid(poly,h,z=0):
        poly=orient(poly,sign=1)
        return mf.CrossSection([np.asarray(poly.exterior.coords)[:-1]]+[np.asarray(i.coords)[:-1] for i in poly.interiors]).extrude(h).translate((0,0,z))
    def cyl_y(x,y,z,r,depth):
        return mf.Manifold.cylinder(depth,r,circular_segments=64).rotate((-90,0,0)).translate((x,y,z))
    posts=[rounded(4.5,4.5,.7,*xy) for xy in centers]
    ex=[cx-p['ear_spacing_estimate']/2,cx+p['ear_spacing_estimate']/2]
    ez=top+p['ear_hole_height_over_body_bottom'];ey=p['ear_mount_face_y']
    body_min=np.array([cx-p['body_width']/2,p['body_back_y']-p['body_length'],top])
    body_size=np.array([p['body_width'],p['body_length'],p['body_thickness']])
    shelf=box(body_min[0]-.3,body_min[1]-.3,body_min[0]+body_size[0]+.3,p['body_back_y']+.3)
    pads=[rounded(p['mount_width'],p['mount_depth'],.3,x,ey+p['mount_depth']/2) for x in ex]
    bar=box(ex[0]-p['mount_width']/2,-2.25,ex[1]+p['mount_width']/2,3)
    rear_web=LineString([(cx,14),tuple(centers[2])]).buffer(3,resolution=20)
    # Preserve the original base footprint and chassis anchors; add material under the shifted seat.
    old_shelf=translate(shelf,xoff=-dx)
    old_bar=translate(bar,xoff=-dx)
    old_pads=[translate(pad,xoff=-dx) for pad in pads]
    old_web=LineString([(base_cx,14),tuple(centers[2])]).buffer(3,resolution=20)
    original_footprint=unary_union([old_shelf,old_bar,old_web,*old_pads,*posts])
    footprint=unary_union([original_footprint,shelf,bar,rear_web,*pads])
    assert footprint.geom_type=='Polygon'
    assert original_footprint.difference(footprint).area<1e-8
    # The shift is measured in the chassis frame, before normalization for STL export.
    old_ear_x=np.array([base_cx-p['ear_spacing_estimate']/2,base_cx+p['ear_spacing_estimate']/2])
    assert np.allclose(np.array(ex)-old_ear_x,[-5.,-5.])
    assert np.allclose(centers,[[0,0],[22.5,0],[oldp['rear_hole_x'],oldp['rear_hole_y']]])
    # Old clamp is printed screw-openings-up, but this plate is screw-openings-down.
    # The user confirms B and C fit; register the fitted reference after a rigid turnover.
    # Swapping the reference long-side endpoints fixes B,C and gives the unique nearby A.
    fixed_mid=(centers[1]+centers[2])/2
    fixed_axis=centers[2]-centers[1];fixed_axis/=np.linalg.norm(fixed_axis)
    flip_xy=np.eye(2)-2*np.outer(fixed_axis,fixed_axis)
    translation_xy=fixed_mid-flip_xy@fixed_mid
    fitted_reference=centers@flip_xy.T+translation_xy
    assert np.allclose(fitted_reference[1],centers[2])
    assert np.allclose(fitted_reference[2],centers[1])
    hole_centers=centers.copy();hole_centers[0]=fitted_reference[0]
    turn=np.eye(4);turn[:2,:2]=flip_xy;turn[2,2]=-1
    turn[:2,3]=translation_xy;turn[2,3]=oldp['total_height']
    assert abs(np.linalg.det(turn[:3,:3])-1)<1e-8
    assert np.allclose(hole_centers[1:],centers[1:])
    from shapely.geometry import Point
    assert footprint.contains(Point(hole_centers[0]).buffer(2.25))
    model=solid(footprint,T,L)
    for pad in pads:model+=solid(pad,p['mount_height_above_plate'],top)
    # Three through chassis pilots; extend cuts beyond both faces.
    for x,y in hole_centers:
        model-=mf.Manifold.cylinder(p['chassis_pilot_depth']+.1,.8,circular_segments=64).translate((x,y,-.05))
        model-=mf.Manifold.cylinder(.32,1.0,.8,circular_segments=64).translate((x,y,-.02))
    for x in ex:
        model-=cyl_y(x,ey-.05,ez,.8,p['ear_pilot_depth']+.05)
        entry=mf.Manifold.cylinder(.32,1.0,.8,circular_segments=64).rotate((-90,0,0)).translate((x,ey-.02,ez))
        model-=entry
    assert model.status()==mf.Error.NoError
    # Nominal body can be lowered vertically without bending ears or uprights.
    body=mf.Manifold.cube(body_size).translate(body_min)
    ears=[]
    for x in ex:
        ear=cyl_y(x,ey-p['ear_thickness_assumption'],ez,1.75,p['ear_thickness_assumption'])
        ear-=cyl_y(x,ey-p['ear_thickness_assumption']-.01,ez,1.05,p['ear_thickness_assumption']+.02)
        ears.append(ear)
    envelope=body
    for ear in ears:envelope+=ear
    insertion=[]
    for lift in [0,.2,.5,1,2,4,8,15,25]:
        collision=(model^envelope.translate((0,0,lift))).volume()
        assert collision<1e-6,(lift,collision)
        insertion.append({'lift_mm':lift,'intersection_mm3':collision})
    # Driver and screw heads have clear straight approach from the shaft side.
    for x in ex:
        driver=cyl_y(x,-20,ez,1.8,20-p['ear_thickness_assumption']-.05)
        assert (model^driver).volume()<1e-6
        assert (body^driver).volume()<1e-6
        bore=cyl_y(x,.05,ez,.75,p['ear_pilot_depth']-.1)
        assert (model^bore).volume()<1e-7
    for x,y in hole_centers:
        bore=mf.Manifold.cylinder(T+.1,.75,circular_segments=48).translate((x,y,-.05))
        assert (model^bore).volume()<1e-7
    model=model.simplify(.001)
    raw=model.to_mesh();mesh=trimesh.Trimesh(np.asarray(raw.vert_properties)[:,:3],np.asarray(raw.tri_verts),process=True)
    shift=-mesh.bounds[0];mesh.apply_translation(shift)
    path=R/'servo_clamp_thin.stl';mesh.export(path);mesh=trimesh.load_mesh(path,process=True)
    assert mesh.is_volume and mesh.is_watertight and mesh.is_winding_consistent
    assert len(mesh.split())==1 and np.all(mesh.area_faces>1e-10) and np.allclose(mesh.bounds[0],0)
    report={'parameters':p,'extents_mm':mesh.extents.tolist(),'bounds_mm':mesh.bounds.tolist(),
        'watertight':True,'consistent_normals':True,'connected_solids':1,'positive_volume':True,
        'volume_mm3':mesh.volume,'minimum_triangle_area_mm2':float(mesh.area_faces.min()),
        'stl_sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'print_shift_mm':shift.tolist(),
        'chassis_pilot_centers_xy_mm':(hole_centers+shift[:2]).tolist(),
        'chassis_hole_centers_assembly_xy_mm':hole_centers.tolist(),
        'reference_hole_centers_before_turnover_mm':centers.tolist(),
        'reference_turnover_transform':turn.tolist(),
        'reference_hole_mapping':{'thin_A':'original_A','thin_B':'original_C','thin_C':'original_B'},
        'corrected_hole':'A - outer front','hole_A_delta_from_previous_mm':(hole_centers[0]-centers[0]).tolist(),
        'holes_B_C_unchanged':True,'orientation_inferred_from_two_matching_holes':True,
        'ear_hole_centers_assembly_xyz_mm':[[x,ey,ez] for x in ex],
        'ear_offset_from_previous_mm':[dx,0,0],'chassis_holes_unchanged':False,
        'original_base_footprint_retained':True,
        'ear_pilot_centers_xyz_mm':[[x+shift[0],ey+shift[1],ez] for x in ex],
        'chassis_pilot_depth_mm':p['chassis_pilot_depth'],'ear_pilot_depth_mm':p['ear_pilot_depth'],
        'shelf_bottom_z_mm':L,'shelf_top_z_mm':top,'nominal_body_min_mm':body_min.tolist(),
        'nominal_body_size_mm':body_size.tolist(),'body_clearance_per_side_at_uprights_mm':.2,
        'minimum_ear_bore_side_wall_mm':(p['mount_width']-p['ear_entry_diameter'])/2,
        'ear_bore_end_wall_mm':p['mount_depth']-p['ear_pilot_depth'],
        'ear_entry_top_ligament_mm':p['mount_height_above_plate']-p['ear_hole_height_over_body_bottom']-p['ear_entry_diameter']/2,
        'chassis_bore_roof_to_servo_mm':0,'chassis_holes_through':True,
        'chassis_holes_under_nominal_servo':['A'],
        'insertion_sweep':insertion,'driver_envelope_diameter_mm':3.6,
        'maximum_chassis_screw_penetration_mm':4.8,'maximum_ear_screw_penetration_mm':3.5,
        'lower_legs_removed':True,'solid_plate_thickness_mm':T,
        'ear_spacing_is_estimate':True,'physical_fit_verified':False,
        'limitations':'Nominal box and assumed ears only. Real ear spacing, height, thickness, screw sizes, wire exit, horn swept volume and chassis are not measured.'}
    (R/'thin_geometry_validation.json').write_text(json.dumps(report,indent=2)+'\n')
    parts=[(old,'Original_H13',(0,0,0)),(mesh,'Thin_DHV56MG',(40,0,0))]
    write_3mf(old,'WLToys - original and thin servo',R/'geometry_only.3mf',plate_parts=parts)
    plt.rcParams['font.family']='DejaVu Sans'
    fig=plt.figure(figsize=(14,10),facecolor='#f3f0e9')
    ax=fig.add_subplot(221);view3d(ax,[(old,'#21879a')],35,-60);ax.set_title('Старая: H=13 мм, ножки 11 мм')
    ax=fig.add_subplot(222);view3d(ax,[(mesh,'#d28b38')],30,-60);ax.set_title('Пластина 5 мм: опоры смещены к борту на 5 мм')
    ax=fig.add_subplot(223)
    outline=np.array(footprint.exterior.coords)
    # Same orientation as the installation photo: shaft above, outer chassis side below.
    ax.fill(-outline[:,1],outline[:,0],color='#d28b38',alpha=.15)
    for pad in pads:
        c=np.array(pad.exterior.coords);ax.fill(-c[:,1],c[:,0],color='#d28b38',alpha=.8)
    for x in old_ear_x:
        ax.plot([-ey-2.6], [x], marker='+',color='#697580',markersize=10)
        ax.annotate('',xy=(-ey-2.6,x+dx),xytext=(-ey-2.6,x),arrowprops={'arrowstyle':'->','color':'#b44730','lw':1.6})
    for label,(x,y) in zip('ABC',hole_centers):
        ax.add_patch(plt.Circle((-y,x),.8,fill=False,color='#176879'))
        ax.text(-y+1,x,label,color='#176879')
    ax.plot(-centers[0,1],centers[0,0],'x',color='#b44730')
    ax.annotate('',xy=(-hole_centers[0,1],hole_centers[0,0]),xytext=(-centers[0,1],centers[0,0]),arrowprops={'arrowstyle':'->','color':'#b44730'})
    ax.text(-18,28,'К кардану',fontsize=10)
    ax.text(-18,-9,'К борту ↓ 5 мм',fontsize=10)
    ax.set(aspect='equal',xlim=(-30,8),ylim=(-11,31),title='Вид сверху: исправлено A; B и C сохранены',xlabel='−Y, мм',ylabel='X, мм')
    ax.grid(alpha=.15)
    ax=fig.add_subplot(224)
    cut=mesh.section(plane_origin=[ex[0]+shift[0],0,0],plane_normal=[1,0,0])
    for c in cut.discrete:ax.plot(c[:,1]-shift[1],c[:,2],color='#946219',lw=1.5)
    ax.annotate('Винт через ушко →',(0,ez),xytext=(-12,ez+.8),arrowprops={'arrowstyle':'->'})
    ax.text(6,top+.8,'Ø1,6 × 4 мм',fontsize=10)
    ax.set(xlim=(-13,15),ylim=(-.5,16),aspect='equal',title='Разрез левой опоры: винт горизонтально',xlabel='Y, мм',ylabel='Z, мм');ax.grid(alpha=.2)
    fig.suptitle('WLToys • два варианта на одной пластине',fontsize=17)
    fig.text(.5,.02,'Три отверстия шасси Ø1,6 мм сквозные через 5 мм. Положение отверстий и ушек сохранено. Без поддержек.',ha='center')
    fig.tight_layout(rect=(0,.05,1,.95));fig.savefig(R/'design_preview.png',dpi=160)
    print(json.dumps({'thin_extents_mm':mesh.extents.tolist(),'leg_length_mm':L,'parts':2},indent=2))
if __name__=='__main__':build()
