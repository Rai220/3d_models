"""Parametric brown-bear forepaw stamp. Dimensions in mm; run with .venv/bin/python.

Original illustrative geometry, not a scan. mesh booleans use Manifold.
"""
from pathlib import Path
import json
import zipfile
import xml.etree.ElementTree as ET

import numpy as np
from scipy.interpolate import splprep, splev
from shapely.geometry import Polygon, Point, box
from shapely.geometry.polygon import orient
from shapely.ops import unary_union
from shapely import affinity
import manifold3d as mf
import trimesh
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

OUT = Path(__file__).parent / 'bear_paw'
OUT.mkdir(exist_ok=True)
WIDTH = 160.0                 # width of contact silhouette
BASE = 6.0
RELIEF = 14.0
HOLES_X = (-60.0, 60.0)
HOLES_Y = 14.0
HOLE_D = 5.6                 # clearance for M5
HANDLE_THICKNESS = 24.0


def smooth(points, n=128):
    p = np.array(points + [points[0]], dtype=float)
    tck, _ = splprep(p.T, s=0, per=True)
    return Polygon(np.array(splev(np.linspace(0, 1, n, endpoint=False), tck)).T)


def ellipse(x, y, rx, ry, angle=0):
    p = affinity.scale(Point(0, 0).buffer(1, quad_segs=32), rx, ry)
    return affinity.translate(affinity.rotate(p, angle), x, y)


def cs(poly):
    poly = orient(poly, sign=1.0)
    return mf.CrossSection([np.array(poly.exterior.coords)[:-1]] +
                           [np.array(r.coords)[:-1] for r in poly.interiors])


def extrude(poly, height, z=0):
    return cs(poly).extrude(height).translate((0, 0, z))


def mesh(solid):
    m = solid.to_mesh()
    result = trimesh.Trimesh(np.asarray(m.vert_properties)[:, :3], np.asarray(m.tri_verts), process=True)
    assert result.is_watertight and result.is_winding_consistent and result.volume > 0
    assert len(result.split()) == 1
    return result


def relief(poly):
    # Constant draft tapers towards the contact surface: no unsupported ledges.
    center = poly.centroid
    p = affinity.translate(poly, -center.x, -center.y)
    bounds = p.bounds
    sx = 1 + 2.8 / (bounds[2] - bounds[0])
    sy = 1 + 2.8 / (bounds[3] - bounds[1])
    foot = affinity.scale(p, sx, sy, origin=(0, 0))
    return cs(foot).extrude(RELIEF + .2, scale_top=(1/sx, 1/sy)).translate((center.x, center.y, BASE - .2))


palm = smooth([(-77,-23),(-66,-46),(-38,-55),(-10,-50),(19,-55),
               (51,-49),(74,-33),(74,-10),(51,4),(20,7),(-13,6),(-47,5),(-69,-3)])
toe_specs = [(-65,34,12,14,-10),(-36,41,14,16,-5),(-4,44,14.5,17,0),
             (29,42,14,16,4),(61,36,14.5,15,10)]
toes = [ellipse(*s) for s in toe_specs]
claws = []
for x,y,rx,ry,a in toe_specs:
    start = y + ry + 8
    p = smooth([(x-3.5,start),(x-3.0,start+8),(x-1.4,start+17),
                (x+.2,start+19),(x+1.8,start+17),(x+3.4,start+7),(x+3.5,start)])
    claws.append(p)
contacts = [palm] + toes + claws
footprint = unary_union(contacts)
scale_x = WIDTH / (footprint.bounds[2] - footprint.bounds[0])
mid_x = (footprint.bounds[2] + footprint.bounds[0]) / 2
contacts = [affinity.scale(affinity.translate(p,-mid_x,0), scale_x, 1, origin=(0,0)) for p in contacts]
footprint = unary_union(contacts)
plate = footprint.convex_hull.buffer(5.4, quad_segs=24)
stamp = extrude(plate, BASE)
for p in contacts:
    stamp += relief(p)
for x in HOLES_X:
    # Bolt heads sit in the empty space between pads, below the working surface.
    assert footprint.distance(Point(x,HOLES_Y)) > 6
    stamp -= extrude(Point(x,HOLES_Y).buffer(HOLE_D/2, quad_segs=24), BASE+2, -1)

# Handle model local coordinates: U = long axis along stamp X; V = height
# away from stamp back. Extrusion W = thickness across stamp Y.
# Print exactly in these coordinates, broad side W=0 against the build plate.
outer = box(-72,0,72,61).buffer(-5).buffer(5, quad_segs=12)
# Fill the bottom corner rounding at feet so both mounting faces lie at V=0.
outer = unary_union([outer, box(-72,0,-48,12), box(48,0,72,12)])
opening = box(-48,-3,48,40).buffer(-5).buffer(5, quad_segs=12)
profile = outer.difference(opening)
handle = extrude(profile, HANDLE_THICKNESS)
# Make fastener voids in a temporary (X,U,V) space, then map to print (U,V,W).
def to_handle(solid):
    return solid.transform(np.array([[0,1,0,0],[0,0,1,0],[1,0,0,HANDLE_THICKNESS/2]], float))

for y in HOLES_X:
    bore = extrude(Point(0,y).buffer(HOLE_D/2, quad_segs=24), 26, -1)
    # M5 nuts: 8 mm across flats, 4 mm thick. 0.5/0.6 mm fit allowances.
    # Side-access channel opens on the upward-facing side during printing.
    nut_r = 8.5/np.sqrt(3)
    hexagon = Polygon([(nut_r*np.cos(a), y+nut_r*np.sin(a)) for a in np.arange(6)*np.pi/3])
    channel = unary_union([hexagon, box(0,y-4.25,13,y+4.25)])
    pocket = extrude(channel, 4.6, 6.0)
    handle -= to_handle(bore + pocket)

stamp_mesh = mesh(stamp)
mirror_mesh = stamp_mesh.copy()
mirror_mesh.apply_transform(np.diag([-1,1,1,1]))
handle_mesh = mesh(handle)


def write_3mf(m, name, path, plate_parts=None):
    # Portable geometry-only 3MF; intentional absence of printer/G-code settings.
    ns = 'http://schemas.microsoft.com/3dmanufacturing/core/2015/02'
    ET.register_namespace('', ns)
    q = lambda t: '{'+ns+'}'+t
    root = ET.Element(q('model'), {'unit':'millimeter','{http://www.w3.org/XML/1998/namespace}lang':'en-US'})
    ET.SubElement(root,q('metadata'),{'name':'Title'}).text=name
    res = ET.SubElement(root,q('resources'))
    entries = plate_parts or [(m,name,(0,0,0))]
    build=ET.SubElement(root,q('build'))
    for i,(part,part_name,offset) in enumerate(entries,1):
        obj = ET.SubElement(res,q('object'),{'id':str(i),'type':'model','name':part_name})
        me = ET.SubElement(obj,q('mesh'))
        vs,ts = ET.SubElement(me,q('vertices')), ET.SubElement(me,q('triangles'))
        for v in part.vertices-part.bounds[0]+np.array(offset):
            ET.SubElement(vs,q('vertex'),dict(zip(['x','y','z'],[f'{x:.6f}' for x in v])))
        for f in part.faces:
            ET.SubElement(ts,q('triangle'),dict(zip(['v1','v2','v3'],map(str,f))))
        ET.SubElement(build,q('item'),{'objectid':str(i)})
    with zipfile.ZipFile(path,'w',zipfile.ZIP_DEFLATED) as z:
        z.writestr('[Content_Types].xml','<?xml version="1.0" encoding="UTF-8"?><Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types"><Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/><Default Extension="model" ContentType="application/vnd.ms-package.3dmanufacturing-3dmodel+xml"/></Types>')
        z.writestr('_rels/.rels','<?xml version="1.0" encoding="UTF-8"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Target="/3D/3dmodel.model" Id="rel0" Type="http://schemas.microsoft.com/3dmanufacturing/2013/01/3dmodel"/></Relationships>')
        z.writestr('3D/3dmodel.model',ET.tostring(root,encoding='utf-8',xml_declaration=True))


parts = {'paw_stamp':stamp_mesh,'paw_stamp_mirrored':mirror_mesh,'handle':handle_mesh}
report = {'contact_size_mm':[round(footprint.bounds[2]-footprint.bounds[0],2),round(footprint.bounds[3]-footprint.bounds[1],2)],
          'relief_mm':RELIEF,'base_mm':BASE,'parts':{}}
for name,m in parts.items():
    m.export(OUT/(name+'.stl'))
    write_3mf(m,name,OUT/(name+'.3mf'))
    report['parts'][name] = {'size_mm':np.round(m.extents,3).tolist(),'watertight':bool(m.is_watertight),
                          'winding_consistent':bool(m.is_winding_consistent),'connected_solids':len(m.split()),
                          'solid_volume_cm3':round(m.volume/1000,2),'triangles':len(m.faces)}
    assert np.all(m.extents <= 176), 'Exceeds mini envelope with margin'
    assert abs(m.bounds[0,2])<1e-5
    # Check exported files too, not just in-memory solids.
    reloaded = trimesh.load(OUT/(name+'.stl'), force='mesh')
    assert reloaded.is_watertight and reloaded.is_winding_consistent
    scene = trimesh.load(OUT/(name+'.3mf'))
    loaded = next(iter(scene.geometry.values()))
    assert np.allclose(loaded.extents,m.extents,atol=1e-4)
    assert loaded.is_watertight

write_3mf(stamp_mesh,'P1S paw and handle',OUT/'P1S_paw_and_handle.3mf',
          [(stamp_mesh,'Paw stamp',(20,15,0)),(handle_mesh,'Handle - print on side',(45,181,0))])
plate_scene=trimesh.load(OUT/'P1S_paw_and_handle.3mf')
assert len(plate_scene.geometry)==2
assert np.all(plate_scene.bounds[0]>=0) and np.all(plate_scene.bounds[1]<256)
report['P1S_plate_bounds_mm']=np.round(plate_scene.bounds,3).tolist()

# Assemble in stamp coordinates: grip goes behind Z=0.
assembled_handle = handle_mesh.copy()
assembled_handle.apply_transform(np.array([[1,0,0,0],[0,0,1,HOLES_Y-HANDLE_THICKNESS/2],[0,-1,0,0],[0,0,0,1]]))
collision = trimesh.boolean.intersection([stamp_mesh,assembled_handle],engine='manifold')
assert abs(collision.volume)<1e-4, 'Handle intersects stamp'
report['assembly_interference_cm3'] = round(abs(collision.volume)/1000,8)
report['hardware'] = '2 x M5x20 socket-head screws (no washers); 2 x regular M5 hex nuts, AF8 x 4 mm'
report['physical_print_tested'] = False
(OUT/'validation.json').write_text(json.dumps(report,indent=2,ensure_ascii=False)+'\n')


def view3d(ax, meshes, elev, azim):
    # Orthographic CPU z-buffer avoids painter-sort artifacts on CAD triangles.
    e,a=np.deg2rad([elev,azim]); eye=np.array([np.cos(e)*np.cos(a),np.cos(e)*np.sin(a),np.sin(e)])
    right=np.array([-np.sin(a),np.cos(a),0]); up=np.cross(eye,right)
    basis=np.vstack([right,up,eye])
    project=lambda v: np.sum(v[:,None,:]*basis[None,:,:],axis=2)
    vv=project(np.vstack([m.vertices for m,c in meshes]))
    lo,hi=vv.min(0),vv.max(0)
    w,h=1000,700; factor=min((w-70)/(hi[0]-lo[0]),(h-70)/(hi[1]-lo[1]))
    center=(lo+hi)/2
    canvas=np.full((h,w,3),matplotlib.colors.to_rgb('#f3f0e9'))
    depth=np.full((h,w),-np.inf)
    light=.25*right+.45*up+.86*eye; light/=np.linalg.norm(light)
    for m,color in meshes:
        verts=project(m.vertices)
        verts[:,0]=(verts[:,0]-center[0])*factor+w/2
        verts[:,1]=h/2-(verts[:,1]-center[1])*factor
        brightness=.65+.35*np.clip(np.sum(m.face_normals*light,axis=1),0,1)
        colors=np.array(matplotlib.colors.to_rgb(color))[None,:]*brightness[:,None]
        visible=np.sum(m.face_normals*eye,axis=1)>1e-8
        for tri,c in zip(verts[m.faces[visible]],colors[visible]):
            x0,y0,z0=tri[0]; x1,y1,z1=tri[1]; x2,y2,z2=tri[2]
            xmin=max(0,int(np.floor(tri[:,0].min()))); xmax=min(w-1,int(np.ceil(tri[:,0].max())))
            ymin=max(0,int(np.floor(tri[:,1].min()))); ymax=min(h-1,int(np.ceil(tri[:,1].max())))
            denom=(y1-y2)*(x0-x2)+(x2-x1)*(y0-y2)
            if abs(denom)<1e-9 or xmin>xmax or ymin>ymax: continue
            xx,yy=np.meshgrid(np.arange(xmin,xmax+1)+.5,np.arange(ymin,ymax+1)+.5)
            u=((y1-y2)*(xx-x2)+(x2-x1)*(yy-y2))/denom
            v=((y2-y0)*(xx-x2)+(x0-x2)*(yy-y2))/denom
            t=1-u-v; zz=u*z0+v*z1+t*z2
            patch=depth[ymin:ymax+1,xmin:xmax+1]
            use=(u>=-1e-8)&(v>=-1e-8)&(t>=-1e-8)&(zz>patch)
            patch[use]=zz[use]; canvas[ymin:ymax+1,xmin:xmax+1][use]=c
    ax.imshow(canvas); ax.set_axis_off()


plt.rcParams.update({'font.family':'DejaVu Sans','figure.facecolor':'#f3f0e9','axes.facecolor':'#f3f0e9','text.color':'#22332d'})
fig=plt.figure(figsize=(15,10),layout='constrained')
gs=fig.add_gridspec(2,2,width_ratios=[1.2,1])
ax=fig.add_subplot(gs[0,0])
view3d(ax,[(stamp_mesh,'#577866')],55,-68)
ax.set_title('Лапа-штамп · рабочая сторона',fontsize=17,loc='left')
ax2=fig.add_subplot(gs[0,1]); ax2.set_aspect('equal')
# Reflection across X when the stamp is flipped around its Y axis onto the ground.
for p in contacts:
    xy=np.array(p.exterior.coords); ax2.fill(-xy[:,0],xy[:,1],color='#344d3f')
ax2.annotate('',xy=(-80,-68),xytext=(80,-68),arrowprops={'arrowstyle':'<->','color':'#344d3f'})
ax2.text(0,-78,'160 мм',ha='center',fontsize=12)
ax2.set(xlim=(-95,95),ylim=(-88,104)); ax2.axis('off')
ax2.set_title('Контур отпечатка',fontsize=17,loc='left')
ax3=fig.add_subplot(gs[1,0])
display_stamp=stamp_mesh.copy(); display_handle=assembled_handle.copy()
flip=np.diag([1,-1,-1,1])
display_stamp.apply_transform(flip); display_handle.apply_transform(flip)
view3d(ax3,[(display_stamp,'#577866'),(display_handle,'#d89655')],27,-52)
ax3.set_title('Сборка · ручка на обратной стороне',fontsize=17,loc='left')
ax4=fig.add_subplot(gs[1,1])
view3d(ax4,[(handle_mesh,'#d89655')],53,-64)
ax4.set_title('Ручка · положение для печати',fontsize=17,loc='left')
fig.suptitle('МЕДВЕЖЬЯ ЛАПА\nПередний след · рельеф 14 мм · крепление 2 × М5',fontsize=23,fontweight='bold')
fig.savefig(OUT/'preview.png',dpi=170)
plt.close(fig)

# Full-size footprint template for checking scale on A4 paper.
fig,ax=plt.subplots(figsize=(210/25.4,297/25.4))
fig.patch.set_facecolor('white'); ax.set_facecolor('white')
ax.set_position([0,0,1,1]); ax.set_xlim(-105,105); ax.set_ylim(-148.5,148.5); ax.set_aspect('equal')
for p in contacts:
    xy=np.array(p.exterior.coords); ax.fill(-xy[:,0],xy[:,1],color='#344d3f')
ax.text(0,125,'Медвежья лапа · шаблон следа 1:1',ha='center',fontsize=13)
ax.text(0,113,'A4 · печатать 100%, без «вписать в страницу»',ha='center',fontsize=10)
ax.plot([-50,50],[-100,-100],color='black'); ax.plot([-50,-50],[-103,-97],color='black'); ax.plot([50,50],[-103,-97],color='black')
ax.text(0,-111,'Контрольная линейка: 100 мм',ha='center',fontsize=10)
ax.axis('off'); fig.savefig(OUT/'footprint_1to1_A4.pdf'); plt.close(fig)
print(json.dumps(report,indent=2,ensure_ascii=False))
