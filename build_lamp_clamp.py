"""Removable, fully printed clamp for the existing lamp paper-box collar.

Run: .venv/bin/python build_lamp_clamp.py
Dimensions in mm. The original paper-box files are read only.
Custom 12 mm / 4 mm pitch thread; NOT an ISO metric fastener.
"""
from pathlib import Path
import json
import numpy as np
import manifold3d as mf
import trimesh
from shapely.geometry import Polygon, Point, box
from shapely.geometry.polygon import orient
from shapely import affinity
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from cad_helpers import write_3mf, view3d

ROOT = Path(__file__).resolve().parent
OUT = ROOT/'lamp_clamp'
OUT.mkdir(exist_ok=True)
PITCH = 4.0
ROOT_R, CREST_R = 4.8, 6.0
THREAD_RADIAL_CLEARANCE = 0.30
THREAD_AXIAL_CLEARANCE = 0.16
SHAFT_LENGTH, HEAD_H, TIP_LENGTH = 40.0, 7.0, 3.0
NUT_SIDE, NUT_H, NUT_POCKET_SIDE = 18.2, 12.0, 19.0
AXIS_Z = 29.0
BODY_REAR_Y, NUT_REAR_Y = 155.4, 149.4
FRONT_STOP_Y = 103.0
PAD_W, PAD_H, PAD_T, CUP_DEPTH = 32.0, 30.0, 4.0, 1.6
COLLAR_BACK_INNER, COLLAR_BACK_OUTER = 137.0, 140.6


def cs(p):
    p = orient(p, sign=1)
    return mf.CrossSection([np.array(p.exterior.coords)[:-1]] +
                           [np.array(h.coords)[:-1] for h in p.interiors])


def extrude(p, h, z=0):
    return cs(p).extrude(h).translate((0,0,z))


def rounded_rect(w, h, r):
    return box(-w/2+r,-h/2+r,w/2-r,h/2-r).buffer(r,quad_segs=24)


def cylinder(h,r,r2=-1,z=0):
    return mf.Manifold.cylinder(h,r,r2,96).translate((0,0,z))


def mesh(solid):
    assert solid.status() == mf.Error.NoError, solid.status()
    raw=solid.simplify(.001).to_mesh()
    m=trimesh.Trimesh(np.asarray(raw.vert_properties)[:,:3],np.asarray(raw.tri_verts),process=True)
    m.update_faces(m.nondegenerate_faces());m.remove_unreferenced_vertices()
    assert m.is_watertight and m.is_winding_consistent and m.volume>0
    assert len(m.split())==1
    return m


def from_mesh(m):
    return mf.Manifold(mf.Mesh64(np.asarray(m.vertices),np.asarray(m.faces,dtype=np.uint64)))


def threaded_solid(z0,z1,female=False,taper_tip=False):
    """Closed radial helical mesh; root/crest flats and 45-degree flanks."""
    na=128
    angles=np.arange(na)*2*np.pi/na
    zs=np.linspace(z0,z1,int(np.ceil((z1-z0)/.1))+1)
    phase=(zs[:,None]-PITCH*angles[None,:]/(2*np.pi)+PITCH/2)%PITCH-PITCH/2
    crest_half=.30+(THREAD_AXIAL_CLEARANCE if female else 0)
    tooth=np.clip(1-(np.abs(phase)-crest_half)/(CREST_R-ROOT_R),0,1)
    radii=ROOT_R+(CREST_R-ROOT_R)*tooth
    if female:
        radii+=THREAD_RADIAL_CLEARANCE
    if taper_tip:
        lead=np.clip((z1-zs)/1.5,0,1)
        radii=ROOT_R+(radii-ROOT_R)*lead[:,None]
    verts=np.stack([radii*np.cos(angles),radii*np.sin(angles),
                    np.broadcast_to(zs[:,None],radii.shape)],axis=-1).reshape(-1,3)
    a=(np.arange(len(zs)-1)[:,None]*na+np.arange(na)).ravel()
    b=(a//na)*na+(a+1)%na;c=a+na;d=b+na
    faces=np.vstack([np.c_[a,b,d],np.c_[a,d,c]])
    bottom=len(verts);top=bottom+1
    verts=np.vstack([verts,[0,0,z0],[0,0,z1]])
    ids=np.arange(na);last=(len(zs)-1)*na
    faces=np.vstack([faces,np.c_[np.full(na,bottom),np.roll(ids,-1),ids],
                     np.c_[np.full(na,top),ids+last,np.roll(ids,-1)+last]])
    s=mf.Manifold(mf.Mesh64(verts,np.asarray(faces,dtype=np.uint64)))
    assert s.status()==mf.Error.NoError
    return s


# Frame: saddle over the existing 3.6 mm back rail, with a replaceable nut.
# The U slot is open below; the original box needs no drilled hole or reprint.
yz=Polygon([(133,1.2),(136.6,1.2),(136.6,12),(141.2,12),
            (141.2,1.2),(155.4,1.2),(155.4,46),(137,46),
            (137,16.2),(133,16.2)])
body=extrude(yz,36).transform(((0,0,1,-18),(1,0,0,0),(0,1,0,0)))

# Diamond pocket has a 45-degree roof when the frame is printed on its side.
pocket=affinity.rotate(box(-NUT_POCKET_SIDE/2,-NUT_POCKET_SIDE/2,
                           NUT_POCKET_SIDE/2,NUT_POCKET_SIDE/2),45,origin=(0,0))
nut_cut=extrude(pocket,12.6).rotate((90,0,0)).translate((0,NUT_REAR_Y,AXIS_Z))
body-=nut_cut
# Teardrop clearance bore: it does not contain threads and needs no support roof.
r=6.7
circle=Point(0,0).buffer(r,quad_segs=32)
roof=Polygon([(r/np.sqrt(2),-r/np.sqrt(2)),(r*np.sqrt(2),0),
              (r/np.sqrt(2),r/np.sqrt(2))])
bore=extrude(circle.union(roof),22).rotate((90,0,0)).translate((0,BODY_REAR_Y+.5,AXIS_Z))
body-=bore

# The nut and screw are both printed with their thread axis vertical.
nut_outline=affinity.rotate(rounded_rect(NUT_SIDE,NUT_SIDE,.8),45,origin=(0,0))
nut=extrude(nut_outline,NUT_H)-threaded_solid(-.5,NUT_H+.5,female=True)
nut-=cylinder(1.6,6.7,ROOT_R+THREAD_RADIAL_CLEARANCE)
nut-=cylinder(1.6,ROOT_R+THREAD_RADIAL_CLEARANCE,6.7,z=NUT_H-1.6)

angle=np.linspace(0,2*np.pi,192,endpoint=False)
rad=13.2+.8*np.cos(8*angle)
knob_outline=Polygon(np.c_[rad*np.cos(angle),rad*np.sin(angle)])
knob=extrude(knob_outline,HEAD_H)
shaft=threaded_solid(0,SHAFT_LENGTH,taper_tip=True).translate((0,0,HEAD_H-.02))
tip=cylinder(TIP_LENGTH+.04,4,z=HEAD_H+SHAFT_LENGTH-.04)
tip+=cylinder(.6,4,3.4,z=HEAD_H+SHAFT_LENGTH+TIP_LENGTH-.6)
screw=knob+shaft+tip

# Unattached swivel pressure pad: flat lamp face, shallow cup on its rear.
pad=extrude(rounded_rect(PAD_W,PAD_H,3),PAD_T)
pad-=cylinder(CUP_DEPTH+.1,4.4,z=PAD_T-CUP_DEPTH)


def assembled_screw(backoff):
    # Matched helical phase for every axial position.
    turn=-(BODY_REAR_Y+backoff-NUT_REAR_Y+.02)/PITCH*360
    return screw.rotate((0,0,turn)).rotate((90,0,0)).translate(
        (0,BODY_REAR_Y+backoff+HEAD_H,AXIS_Z))


def pad_front(backoff):
    tip_y=BODY_REAR_Y+backoff-SHAFT_LENGTH-TIP_LENGTH
    return tip_y-(PAD_T-CUP_DEPTH)


def assembled_pad(backoff):
    return pad.rotate((-90,0,0)).translate((0,pad_front(backoff),AXIS_Z))


nut_inst=nut.rotate((90,0,0)).translate((0,NUT_REAR_Y,AXIS_Z))
box_mesh=trimesh.load_mesh(ROOT/'lamp_paper_box/paper_box.stl')
box_solid=from_mesh(box_mesh)
print_body=body.transform(((0,1,0,-133),(0,0,1,-1.2),(1,0,0,18)))
solids={'clamp_body':print_body,'square_nut':nut,'thumb_screw':screw,'pressure_pad':pad}
parts={name:mesh(s) for name,s in solids.items()}

report={'printer':'Bambu Lab P1S','assumed_nozzle_mm':.4,'assumed_material':'Generic PLA',
        'physical_fit_verified':False,'custom_thread':{'major_diameter_mm':12,'pitch_mm':PITCH,
        'radial_clearance_mm':THREAD_RADIAL_CLEARANCE,'axial_clearance_per_flank_mm':THREAD_AXIAL_CLEARANCE,
        'standard_metric_thread':False},'rail_slot_width_mm':4.6,'nominal_rail_mm':[3.6,12],
        'lamp_depth_range_mm':[round(pad_front(b)-FRONT_STOP_Y,2) for b in (0,18)],
        'pressure_face_mm':[PAD_W,PAD_H],'parts':{},'assembly_checks':[]}

for name,m in parts.items():
    m.export(OUT/(name+'.stl'))
    reread=trimesh.load_mesh(OUT/(name+'.stl'))
    assert reread.is_watertight and reread.is_winding_consistent and reread.is_volume
    assert len(reread.split())==1 and np.allclose(reread.extents,m.extents,atol=1e-4)
    assert np.min(reread.area_faces)>1e-10
    report['parts'][name]={'extents_mm':np.round(m.extents,3).tolist(),
                         'volume_cm3':round(m.volume/1000,3),'watertight':True,'connected_solids':1,
                         'triangles':int(len(m.faces))}

# Thread fit, pad cup fit, original-rail fit, and lamp gap across the full travel.
assert (body^box_solid).volume()<.01
assert (body^nut_inst).volume()<.001
for backoff in (0,3,6,9,12,15,18):
    s=assembled_screw(backoff);p=assembled_pad(backoff)
    collisions={
        'screw_nut':(s^nut_inst).volume(),'screw_frame':(s^body).volume(),
        'screw_pad':(s^p).volume(),'pad_frame':(p^body).volume(),
        'pad_box':(p^box_solid).volume(),'screw_box':(s^box_solid).volume(),
    }
    assert max(collisions.values())<.01,(backoff,collisions)
    test_lamp=extrude(box(-22,FRONT_STOP_Y,22,pad_front(backoff)),75)
    assert (test_lamp^(body+nut_inst+s+p+box_solid)).volume()<.01
    report['assembly_checks'].append({'backoff_mm':backoff,'lamp_depth_mm':pad_front(backoff)-FRONT_STOP_Y,
                                      'intersections_mm3':collisions})

# Support check in the actual print orientations. Upper layers may shrink or
# grow by <=0.21 mm at 0.20 mm layer spacing. Report rather than assume for threads.
for name,solid in solids.items():
    h=parts[name].bounds[1,2];prev=solid.slice(.1);worst=0
    for z in np.arange(.3,h,.2):
        current=solid.slice(float(z))
        worst=max(worst,(current-prev.offset(.23,circular_segments=32)).area())
        prev=current
    report['parts'][name]['max_unsupported_area_45deg_mm2']=round(worst,5)
    assert worst<.02,(name,worst)

offsets=[(60,70,0),(100,70,0),(140,70,0),(185,70,0)]
plate=[(parts[k],k,pos) for k,pos in zip(parts,offsets)]
write_3mf(None,'Removable lamp clamp - 4 printed parts',OUT/'clamp_geometry.3mf',plate_parts=plate)
(OUT/'validation.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')

# Actual geometry previews; the grey post is an illustrative 44 x 16 mm section.
example=9.0
inst=[(mesh(body),'#3c8192'),(mesh(nut_inst),'#eab65c'),
      (mesh(assembled_screw(example)),'#ecac4f'),(mesh(assembled_pad(example)),'#70a999')]
post=mesh(extrude(rounded_rect(44,16,1),92).translate((0,111,0)))
fig,axes=plt.subplots(1,2,figsize=(14,7),facecolor='#f3f0e9')
view3d(axes[0],[(box_mesh,'#609aa5'),(post,'#cbd2d4')]+inst,30,128)
view3d(axes[1],inst,28,132)
axes[0].set_title('На существующей коробочке',fontsize=16,pad=8)
axes[1].set_title('Скоба · гайка · винт · прижимная пятка',fontsize=15,pad=8)
fig.suptitle('Съёмная струбцина для лампы',fontsize=24,y=.95)
fig.text(.5,.055,'4 печатные детали  •  Без металлического крепежа  •  Коробочку перепечатывать не нужно',
         fontsize=13,ha='center')
fig.subplots_adjust(left=.015,right=.985,bottom=.14,top=.83,wspace=.025)
fig.savefig(OUT/'preview.png',dpi=160,facecolor=fig.get_facecolor());plt.close(fig)

fig,axes=plt.subplots(1,4,figsize=(15,5),facecolor='#f3f0e9')
labels=['1. Скоба — на боку','2. Квадратная гайка','3. Винт — ручкой вниз','4. Пятка — углублением вверх']
for ax,(name,m),title in zip(axes,parts.items(),labels):
    view3d(ax,[(m,'#468d9a' if name=='clamp_body' else '#dbac5a')],32,-60)
    ax.set_title(title,fontsize=12)
fig.suptitle('Положение деталей для печати на P1S',fontsize=21)
fig.tight_layout();fig.savefig(OUT/'print_orientation.png',dpi=160);plt.close(fig)
print(json.dumps(report,ensure_ascii=False,indent=2))
