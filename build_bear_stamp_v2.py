"""Rounded vector-derived bear paw stamp. All geometry is in millimetres.

Source silhouette: SVG Repo, Bear Pawprint #143754, CC0.
Uses sampled original Bezier paths, curved lofts and manifold Boolean operations.
Run: .venv/bin/python build_bear_stamp_v2.py
"""
from pathlib import Path
import json
import shutil
import zipfile
import numpy as np
from svgpathtools import svg2paths
from shapely.geometry import Polygon, Point, box
from shapely.geometry.polygon import orient
from shapely.ops import unary_union
from shapely import affinity
import manifold3d as mf
import mapbox_earcut
import triangle
from scipy.sparse import coo_matrix
from scipy.sparse.linalg import spsolve
import trimesh
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from cad_helpers import write_3mf, view3d

ROOT=Path(__file__).parent
OUT=ROOT/'bear_paw_v2'
OUT.mkdir(exist_ok=True)
REF=ROOT/'references'/'bear_pawprint_svgrepo.svg'
WIDTH=160.0
BASE=6.0
PAD_HEIGHT=16.0
CLAW_HEIGHT=18.0
ROOT_RADIUS=2.0
HANDLE_THICKNESS=24.0
MOUNT_A=np.array([-12.,52.])
MOUNT_B=np.array([-2.,-72.])
PITCH=float(np.linalg.norm(MOUNT_B-MOUNT_A))
MOUNT_CENTER=(MOUNT_A+MOUNT_B)/2
AXIS=(MOUNT_B-MOUNT_A)/PITCH
SIDE=np.array([-AXIS[1],AXIS[0]])


def section(poly):
    p=orient(poly,sign=1)
    return mf.CrossSection([np.array(p.exterior.coords)[:-1]]+
                           [np.array(h.coords)[:-1] for h in p.interiors])


def extrude(poly,h,z=0):
    return section(poly).extrude(h).translate((0,0,z))


def to_mesh(solid):
    assert solid.status()==mf.Error.NoError, str(solid.status())
    raw=solid.to_mesh64()
    result=trimesh.Trimesh(np.asarray(raw.vert_properties)[:,:3],np.asarray(raw.tri_verts),process=True)
    assert result.is_watertight and result.is_winding_consistent and result.volume>0
    assert len(result.split())==1
    return result


def sample_ring(poly,n,previous=None):
    assert poly.geom_type=='Polygon' and poly.is_valid and not poly.interiors
    p=np.array(orient(poly,sign=1).exterior.coords)
    lengths=np.r_[0,np.cumsum(np.linalg.norm(np.diff(p,axis=0),axis=1))]
    t=np.linspace(0,lengths[-1],n,endpoint=False)
    out=np.c_[np.interp(t,lengths,p[:,0]),np.interp(t,lengths,p[:,1])]
    if previous is not None:
        start=np.argmin(np.sum((out-previous[0])**2,axis=1))
        options=[np.roll(out,-int(start+d),axis=0) for d in range(-3,4)]
        out=min(options,key=lambda v:np.sum((v-previous)**2))
    return out


def loft(rings,n=192,apex=None,dome_height=None):
    """Closed loft through polygon/Z pairs with optional rounded terminal apex."""
    vertices=[]; previous=None
    for polygon,z in rings:
        pts=sample_ring(polygon,n,previous)
        vertices.append(np.c_[pts,np.full(n,z)])
        previous=pts
    vertices=np.vstack(vertices)
    faces=[]
    for j in range(len(rings)-1):
        a=np.arange(n)+j*n; b=np.roll(a,-1); c=a+n; d=b+n
        faces.extend(np.c_[a,b,d]); faces.extend(np.c_[a,d,c])
    cap=mapbox_earcut.triangulate_float64(vertices[:n,:2].copy(),np.array([n],dtype=np.uint32)).reshape(-1,3)
    faces.extend(cap[:,::-1])
    last=(len(rings)-1)*n
    if dome_height is not None:
        cap_vertices,cap_triangles=poisson_dome(vertices[last:,:2],rings[-1][1],dome_height)
        vertices=np.vstack([vertices,cap_vertices[n:]])
        faces.extend(cap_triangles+last)
    elif apex is None:
        cap=mapbox_earcut.triangulate_float64(vertices[last:,:2].copy(),np.array([n],dtype=np.uint32)).reshape(-1,3)
        faces.extend(cap+last)
    else:
        tip=len(vertices); vertices=np.vstack([vertices,np.array(apex)])
        a=np.arange(n)+last; b=np.roll(a,-1)
        faces.extend(np.c_[a,b,np.full(n,tip)])
    solid=mf.Manifold(mf.Mesh64(vertices,np.asarray(faces,dtype=np.uint64)))
    assert solid.status()==mf.Error.NoError
    return solid


def offset(p,d):
    return p.buffer(d,quad_segs=16) if abs(d)>1e-7 else p


def poisson_dome(boundary,z,height):
    """Smooth inflated cap on arbitrary SVG outline: FEM torsion + sqrt height.

    Unlike a radial apex loft, this has no rays/creases from concave corners.
    Fixed boundary and sqrt(u) give the crown a vertical tangent at its rim.
    """
    count=len(boundary)
    vertices=[boundary]
    segments=[np.c_[np.arange(count),np.roll(np.arange(count),-1)]]
    # Closely spaced contour rings resolve the high curvature at the rim.
    # Uniform unstructured triangles alone leave a visible scalloped band here.
    polygon=Polygon(boundary)
    previous=boundary
    for d in [.012,.045,.10,.20,.40,.70,1.10]:
        ring=sample_ring(polygon.buffer(-d,quad_segs=16),count,previous)
        ids=np.arange(count)+len(vertices)*count
        segments.append(np.c_[ids,np.roll(ids,-1)])
        vertices.append(ring);previous=ring
    data=triangle.triangulate({'vertices':np.vstack(vertices),'segments':np.vstack(segments)},'pa0.32YQ')
    xy=data['vertices']; tris=data['triangles']
    assert np.allclose(xy[:count],boundary)
    p=xy[tris]
    twice=(p[:,1,0]-p[:,0,0])*(p[:,2,1]-p[:,0,1])-(p[:,2,0]-p[:,0,0])*(p[:,1,1]-p[:,0,1])
    assert np.all(twice>0)
    area=twice/2
    gx=np.c_[p[:,1,1]-p[:,2,1],p[:,2,1]-p[:,0,1],p[:,0,1]-p[:,1,1]]/twice[:,None]
    gy=np.c_[p[:,2,0]-p[:,1,0],p[:,0,0]-p[:,2,0],p[:,1,0]-p[:,0,0]]/twice[:,None]
    stiffness=area[:,None,None]*(gx[:,:,None]*gx[:,None,:]+gy[:,:,None]*gy[:,None,:])
    rows=np.repeat(tris,3,axis=1).ravel();cols=np.tile(tris,(1,3)).ravel()
    K=coo_matrix((stiffness.ravel(),(rows,cols)),shape=(len(xy),len(xy))).tocsr()
    rhs=np.bincount(tris.ravel(),weights=np.repeat(area/3,3),minlength=len(xy))
    u=np.zeros(len(xy));u[count:]=spsolve(K[count:,count:],rhs[count:])
    assert u[count:].min()>0
    cap_z=z+height*np.sqrt(u/u.max())
    return np.c_[xy,cap_z],tris


def rounded_pad(poly,n):
    rings=[]
    # Concave quarter-circle foot blends horizontally into the backing face.
    for a in np.linspace(0,np.pi/2,15):
        rings.append((offset(poly,ROOT_RADIUS*(1-np.sin(a))),
                      BASE-.05+ROOT_RADIUS*(1-np.cos(a))))
    rings.append((poly,BASE+PAD_HEIGHT-7.0))
    return loft(rings,n=n,dome_height=7.0)


def rounded_claw(poly,n=112):
    # Retain the SVG's footprint, shift the 3D point towards its forward end.
    # The tiny terminal elliptical cap has curvature radius about 0.3 mm.
    outline=poly.convex_hull.buffer(-.5,quad_segs=16).buffer(.5,quad_segs=16)
    center=np.array([outline.centroid.x,outline.centroid.y])
    pts=np.array(outline.exterior.coords)[:-1]
    front=pts[np.argmax(pts[:,1])]
    apex_xy=.40*center+.60*front
    rings=[]
    for a in np.linspace(0,np.pi/2,11):
        rings.append((offset(outline,1.15*(1-np.sin(a))),BASE-.05+1.15*(1-np.cos(a))))
    # A tapering loft, rather than a flat-topped extrusion; all levels nest.
    def scaled(r):
        return affinity.scale(outline,r,r,origin=tuple(apex_xy))
    cap_r=.07
    for r in np.linspace(1,cap_r,36)[1:]:
        t=(1-r**.85)/(1-cap_r**.85)
        rings.append((scaled(r),BASE+1.10+(CLAW_HEIGHT-1.10-.28)*t))
    for a in np.linspace(0,np.pi/2,8)[1:-1]:
        rings.append((scaled(cap_r*np.cos(a)),BASE+CLAW_HEIGHT-.28+.28*np.sin(a)))
    return loft(rings,n=n,apex=(*apex_xy,BASE+CLAW_HEIGHT))


def edge_rounded_prism(poly,h,bottom=.8,top=2.0,n=384):
    rings=[]
    for a in np.linspace(0,np.pi/2,12):
        # Tiny lower fillet leaves a large flat build-plate contact area.
        rings.append((offset(poly,-bottom+bottom*np.sin(a)),bottom-bottom*np.cos(a)))
    rings.append((poly,h-top))
    for a in np.linspace(0,np.pi/2,19)[1:]:
        rings.append((offset(poly,-top+top*np.cos(a)),h-top+top*np.sin(a)))
    return loft(rings,n=n)


print('Reading original SVG Bezier contours...',flush=True)
paths,_=svg2paths(str(REF))
raw=[]
for p in paths:
    for sub in p.continuous_subpaths():
        samples=[sub.point(t) for t in np.linspace(0,1,2400,endpoint=False)]
        poly=Polygon([(z.real,-z.imag) for z in samples])
        assert poly.is_valid
        raw.append(poly)
assert len(raw)==11
raw_union=unary_union(raw)
x0,y0,x1,y1=raw_union.bounds
scale=WIDTH/(x1-x0)
contacts=[affinity.scale(affinity.translate(p,-(x0+x1)/2,-(y0+y1)/2),scale,scale,origin=(0,0)) for p in raw]
footprint=unary_union(contacts)
pads=contacts[:6]; claws=contacts[6:]
# Large 2D radius removes short hull facets; a separate 3D fillet rounds edges.
plate=footprint.convex_hull.buffer(6,quad_segs=32)

print('Lofting rounded pad crowns, roots and pointed claws...',flush=True)
stamp=edge_rounded_prism(plate,BASE)
for i,p in enumerate(pads):
    stamp+=rounded_pad(p,320 if i==0 else 176)
for p in claws:
    stamp+=rounded_claw(p)
for pt in (MOUNT_A,MOUNT_B):
    assert footprint.distance(Point(pt))>7.5
    stamp-=extrude(Point(pt).buffer(2.8,quad_segs=32),BASE+2,-1)

print('Rounding the handle and cutting M5 nut pockets...',flush=True)
outer=box(-PITCH/2-12,0,PITCH/2+12,61).buffer(-12).buffer(12,quad_segs=32)
outer=unary_union([outer,box(-PITCH/2-12,0,-PITCH/2+12,16),box(PITCH/2-12,0,PITCH/2+12,16)])
opening=box(-PITCH/2+12,-6,PITCH/2-12,40).buffer(-8).buffer(8,quad_segs=32)
profile=outer.difference(opening)
# Handle broad edges R3.5; bottom print-side edge R0.8.
handle=edge_rounded_prism(profile,HANDLE_THICKNESS,bottom=.8,top=3.5,n=384)
def to_handle(solid):
    return solid.transform(np.array([[0,1,0,0],[0,0,1,0],[1,0,0,HANDLE_THICKNESS/2]],float))
for u in (-PITCH/2,PITCH/2):
    bore=extrude(Point(0,u).buffer(2.8,quad_segs=32),26,-1)
    rad=8.5/np.sqrt(3)
    hexagon=Polygon([(rad*np.cos(a),u+rad*np.sin(a)) for a in np.arange(6)*np.pi/3])
    channel=unary_union([hexagon,box(0,u-4.25,14,u+4.25)])
    handle-=to_handle(bore+extrude(channel,4.6,6.0))

print('Validating and exporting STL and millimetre 3MF...',flush=True)
stamp_mesh=to_mesh(stamp)
handle_mesh=to_mesh(handle)
mirrored=stamp_mesh.copy();mirrored.apply_transform(np.diag([-1,1,1,1]))
parts={'paw_stamp_smooth':stamp_mesh,'paw_stamp_smooth_mirrored':mirrored,'handle_smooth':handle_mesh}
report={'version':2,'source':'https://www.svgrepo.com/svg/143754/bear-pawprint','source_license':'CC0',
        'nominal_vector_size_mm':[round(x1-x0,5)*scale,round(y1-y0,5)*scale],
        'base_mm':BASE,'pad_height_mm':PAD_HEIGHT,'claw_height_mm':CLAW_HEIGHT,
        'pad_root_radius_mm':ROOT_RADIUS,'pad_crown_rise_mm':7.0,'claw_tip_curvature_radius_approx_mm':.3,
        'mounts_mm':[MOUNT_A.tolist(),MOUNT_B.tolist()],'mount_pitch_mm':PITCH,
        'parts':{},'physical_print_tested':False,'slicer_tested':False}
for name,m in parts.items():
    m.export(OUT/(name+'.stl'))
    write_3mf(m,name,OUT/(name+'.3mf'))
    reloaded=trimesh.load(OUT/(name+'.stl'),force='mesh')
    assert reloaded.is_watertight and reloaded.is_winding_consistent
    assert len(reloaded.split())==1
    from3mf=next(iter(trimesh.load(OUT/(name+'.3mf')).geometry.values()))
    assert from3mf.is_watertight and np.allclose(from3mf.extents,m.extents,atol=1e-4)
    assert np.all(m.extents<246) and abs(m.bounds[0,2])<1e-5
    report['parts'][name]={'size_mm':np.round(m.extents,3).tolist(),'triangles':len(m.faces),
                          'watertight':True,'winding_consistent':True,'connected_solids':1,
                          'solid_volume_cm3':round(m.volume/1000,2)}

offset_handle_y=10+stamp_mesh.extents[1]+9
layout=[(stamp_mesh,'Smooth bear paw',(20,10,0)),(handle_mesh,'Rounded handle - print on side',(43,offset_handle_y,0))]
write_3mf(stamp_mesh,'P1S smooth bear paw',OUT/'P1S_paw_and_handle_v2.3mf',layout)
scene=trimesh.load(OUT/'P1S_paw_and_handle_v2.3mf')
assert len(scene.geometry)==2 and np.all(scene.bounds[0]>=0) and np.all(scene.bounds[1]<251)
report['P1S_plate_bounds_mm']=np.round(scene.bounds,3).tolist()

# U=handle length, V=height from back, W=thickness. Hand grip faces outwards.
assembly_transform=np.array([[AXIS[0],0,SIDE[0],MOUNT_CENTER[0]-SIDE[0]*12],
                             [AXIS[1],0,SIDE[1],MOUNT_CENTER[1]-SIDE[1]*12],
                             [0,-1,0,0],[0,0,0,1]])
assembled_handle=handle_mesh.copy();assembled_handle.apply_transform(assembly_transform)
intersection=trimesh.boolean.intersection([stamp_mesh,assembled_handle],engine='manifold')
intersection_volume=0 if len(intersection.faces)==0 else abs(intersection.volume)
assert intersection_volume<1e-4
report['assembly_intersection_volume_mm3']=intersection_volume
for u,expected in [(-PITCH/2,MOUNT_A),(PITCH/2,MOUNT_B)]:
    mount=(assembly_transform@np.array([u,0,12,1]))[:2]
    assert np.allclose(mount,expected)
report['mount_axes_aligned']=True

# Cross-section at working depth: illustrates actual impression of domed pads.
working_z=17.0
contours=stamp.slice(working_z).to_polygons()
report['working_contact_z_mm']=working_z
report['working_contact_islands']=len(contours)
assert len(contours)==11, 'All five claws, five toes and palm must remain separate'
report['minimum_claw_root_width_mm']=float(min(p.bounds[2]-p.bounds[0] for p in claws))
(OUT/'validation.json').write_text(json.dumps(report,indent=2,ensure_ascii=False)+'\n')
shutil.copy2(REF,OUT/'reference_original_CC0.svg')

print('Rendering vector comparison and rounded geometry...',flush=True)
# Only display meshes are simplified (maximum movement 0.025 mm).
display_stamp=to_mesh(stamp.simplify(.025)); display_handle=to_mesh(handle.simplify(.025))
display_assembled=display_handle.copy();display_assembled.apply_transform(assembly_transform)
plt.rcParams.update({'font.family':'DejaVu Sans','figure.facecolor':'#f3f0e9','axes.facecolor':'#f3f0e9','text.color':'#22332d'})
fig=plt.figure(figsize=(15,11),layout='constrained');gs=fig.add_gridspec(2,2,width_ratios=[1.18,1])
ax=fig.add_subplot(gs[0,0]);view3d(ax,[(display_stamp,'#7f9b84')],52,-74)
ax.set_title('Новая модель · выпуклые подушечки',fontsize=17,loc='left')
ax=fig.add_subplot(gs[0,1]);ax.set_aspect('equal')
for p in contacts:
    xy=np.array(p.exterior.coords);ax.fill(xy[:,0],xy[:,1],color='#304f3b')
ax.axis('off');ax.set_title('Исходный SVG · контуры сохранены',fontsize=17,loc='left')
ax.text(0,-100,'Номинальная ширина 160 мм',ha='center',fontsize=13)
ax=fig.add_subplot(gs[1,0]);flip=np.diag([1,-1,-1,1]);a=display_stamp.copy();b=display_assembled.copy();a.apply_transform(flip);b.apply_transform(flip)
view3d(ax,[(a,'#7f9b84'),(b,'#cc975d')],28,-36)
ax.set_title('Сборка · скруглённая ручка',fontsize=17,loc='left')
ax=fig.add_subplot(gs[1,1]);view3d(ax,[(display_stamp,'#7f9b84')],23,-103)
ax.set_title('Профиль · когти выступают на 2 мм',fontsize=17,loc='left')
fig.suptitle('МЕДВЕЖЬЯ ЛАПА · ВЕРСИЯ 2\nПо векторному рисунку · плавные поверхности · острые когти',fontsize=22,fontweight='bold')
fig.savefig(OUT/'preview_v2.png',dpi=160);plt.close(fig)

fig,ax=plt.subplots(figsize=(10,9));view3d(ax,[(display_stamp,'#7f9b84')],45,-76)
fig.savefig(OUT/'paw_closeup_v2.png',dpi=180);plt.close(fig)

fig,ax=plt.subplots(figsize=(210/25.4,297/25.4));fig.patch.set_facecolor('white');ax.set_position([0,0,1,1]);ax.set_xlim(-105,105);ax.set_ylim(-148.5,148.5);ax.set_aspect('equal')
for p in contacts:
    xy=np.array(p.exterior.coords);ax.fill(xy[:,0],xy[:,1],color='#304f3b')
ax.text(0,125,'Медвежья лапа V2 · векторный контур 1:1',ha='center',fontsize=12)
ax.text(0,114,'A4 · масштаб 100%, без подгонки',ha='center',fontsize=10)
ax.plot([-50,50],[-108,-108],color='black');ax.text(0,-118,'Контрольная линейка 100 мм',ha='center',fontsize=10)
ax.axis('off');fig.savefig(OUT/'vector_template_1to1_A4.pdf');plt.close(fig)
print(json.dumps(report,indent=2,ensure_ascii=False),flush=True)
