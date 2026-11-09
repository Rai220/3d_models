"""Parametric paper box for the photographed lamp; dimensions in millimetres.

Run from this project: .venv/bin/python build_lamp_paper_box.py
The lamp dimensions are photo estimates, not measured fit guarantees.
"""
from pathlib import Path
import json
import zipfile
import numpy as np
import trimesh
import manifold3d as mf
from shapely.geometry import box, Polygon, Point
from shapely.geometry.polygon import orient
from shapely.ops import unary_union
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from cad_helpers import write_3mf, view3d

ROOT = Path(__file__).parent
OUT = ROOT / 'lamp_paper_box'
OUT.mkdir(exist_ok=True)

# Edit these values and rebuild; do not scale the STL to adjust the collar.
PAPER_SIDE = 90.0
INNER_SIDE = 95.0
INNER_HEIGHT = 105.0
WALL = 2.8
FLOOR = 3.2
OUTER_RADIUS = 5.0
SLOT_WIDTH = 28.0
SLOT_LIP = 1.6  # remaining front wall above the floor at centre of the notch
COLLAR_CLEAR_WIDTH = 68.0
COLLAR_CLEAR_DEPTH = 34.0
COLLAR_HEIGHT = 12.0
COLLAR_WALL = 3.6
COLLAR_INNER_RADIUS = 1.0
COLLAR_OVERLAP = 1.2
RIM_CHAMFER = 0.6

OUTER = INNER_SIDE + 2 * WALL
HEIGHT = FLOOR + INNER_HEIGHT
COLLAR_FRONT = OUTER - COLLAR_OVERLAP
HOLE_FRONT = COLLAR_FRONT + COLLAR_WALL
HOLE_BACK = HOLE_FRONT + COLLAR_CLEAR_DEPTH


def rounded_rect(x0, y0, x1, y1, r):
    return box(x0 + r, y0 + r, x1 - r, y1 - r).buffer(r, quad_segs=24)


def section(poly):
    poly = orient(poly, sign=1)
    return mf.CrossSection([np.asarray(poly.exterior.coords)[:-1]] +
                           [np.asarray(h.coords)[:-1] for h in poly.interiors])


def extrude(poly, height, z=0):
    return section(poly).extrude(height).translate((0, 0, z))


def ramp_between(a, za, b, zb):
    """Convex ruled chamfer between two convex outlines."""
    return (extrude(a, 0.001, za) + extrude(b, 0.001, zb)).hull()


def to_mesh(solid):
    assert solid.status() == mf.Error.NoError, solid.status()
    raw = solid.simplify(0.001).to_mesh()
    mesh = trimesh.Trimesh(np.asarray(raw.vert_properties)[:, :3],
                           np.asarray(raw.tri_verts), process=True)
    mesh.update_faces(mesh.nondegenerate_faces())
    mesh.remove_unreferenced_vertices()
    assert mesh.is_watertight and mesh.is_winding_consistent
    assert mesh.volume > 0 and len(mesh.split()) == 1
    return mesh


outer = rounded_rect(-OUTER/2, 0, OUTER/2, OUTER, OUTER_RADIUS)
inner = rounded_rect(-INNER_SIDE/2, WALL, INNER_SIDE/2,
                     OUTER-WALL, OUTER_RADIUS-WALL)
collar_hole = rounded_rect(-COLLAR_CLEAR_WIDTH/2, HOLE_FRONT,
                          COLLAR_CLEAR_WIDTH/2, HOLE_BACK,
                          COLLAR_INNER_RADIUS)
collar_outline = collar_hole.buffer(COLLAR_WALL, quad_segs=24)

# Chamfer the top lips for fingers/paper; keep the floor flat for printing.
box_outer = extrude(outer, HEIGHT-RIM_CHAMFER)
box_outer += ramp_between(outer, HEIGHT-RIM_CHAMFER-0.001,
                         outer.buffer(-RIM_CHAMFER), HEIGHT-0.001)
box_inner = extrude(inner, HEIGHT+2, FLOOR)
box_inner += ramp_between(inner, HEIGHT-RIM_CHAMFER,
                         inner.buffer(RIM_CHAMFER), HEIGHT)
body = box_outer - box_inner

# A U-shaped slot, open at the top; XZ outline is extruded across the front wall.
slot_r = SLOT_WIDTH/2
slot_centre = FLOOR + SLOT_LIP + slot_r
slot_profile = unary_union([
    Point(0, slot_centre).buffer(slot_r, quad_segs=40),
    box(-slot_r, slot_centre, slot_r, HEIGHT+5),
])
slot = extrude(slot_profile, WALL+4).rotate((90, 0, 0)).translate((0, WALL+2, 0))
body -= slot

# Short bottom collar: no suspended bridge, no long sleeve to bind on the hinge.
ring_outer = extrude(collar_outline, COLLAR_HEIGHT-RIM_CHAMFER)
ring_outer += ramp_between(collar_outline, COLLAR_HEIGHT-RIM_CHAMFER-0.001,
                          collar_outline.buffer(-RIM_CHAMFER), COLLAR_HEIGHT-0.001)
ring_void = extrude(collar_hole, COLLAR_HEIGHT+2, -1)
ring_void += ramp_between(collar_hole, COLLAR_HEIGHT-RIM_CHAMFER,
                         collar_hole.buffer(RIM_CHAMFER), COLLAR_HEIGHT)
body += ring_outer - ring_void

# The coupon has the EXACT full collar height and complete box footprint,
# so it also checks the first 12 mm of seating on the lamp base.
# Only an outline is printed: economical but it is not a substitute for a full fit test.
footprint = outer.union(collar_outline)
coupon_profile = footprint.difference(inner.union(collar_hole))
coupon = extrude(coupon_profile, COLLAR_HEIGHT)

mesh = to_mesh(body)
coupon_mesh = to_mesh(coupon)
mesh.export(OUT / 'paper_box.stl')
coupon_mesh.export(OUT / 'fit_check.stl')
write_3mf(mesh, 'Lamp paper box 95x95x105 mm', OUT/'paper_box_geometry.3mf',
          plate_parts=[(mesh, 'Paper box', ((256-mesh.extents[0])/2,
                                           (256-mesh.extents[1])/2, 0))])
write_3mf(coupon_mesh, 'Lamp collar fit check 68x34 mm', OUT/'fit_check_geometry.3mf',
          plate_parts=[(coupon_mesh, 'Fit check', ((256-coupon_mesh.extents[0])/2,
                                                   (256-coupon_mesh.extents[1])/2, 0))])

# Check actual functional voids, rather than only the exported bounding boxes.
paper = extrude(box(-PAPER_SIDE/2, WALL+(INNER_SIDE-PAPER_SIDE)/2,
                    PAPER_SIDE/2, WALL+(INNER_SIDE+PAPER_SIDE)/2),
                INNER_HEIGHT-0.2, FLOOR+0.1)
assert (body ^ paper).volume() < 1e-6
passage = extrude(collar_hole.buffer(-0.01), HEIGHT+20, -5)
assert (body ^ passage).volume() < 1e-6
assert (coupon ^ passage).volume() < 1e-6
slot_probe = extrude(box(-SLOT_WIDTH/2+0.02, -1,
                        SLOT_WIDTH/2-0.02, WALL+1),
                     HEIGHT-slot_centre, slot_centre+0.01)
assert (body ^ slot_probe).volume() < 1e-6
floor_probe = extrude(inner.buffer(-0.1), FLOOR-0.2, 0.1)
assert abs((body ^ floor_probe).volume()-floor_probe.volume()) < 1e-5
assert max(mesh.extents) < 230 and mesh.bounds[0,2] == 0

# No new unsupported islands or >45 degree outward expansions above the floor.
# The first transition from a full floor to hollow walls only removes material.
overhang_max = 0.0
prior = body.slice(0.1)
for z in np.arange(0.3, HEIGHT, 0.2):
    current = body.slice(float(z))
    unsupported = current - prior.offset(0.21, circular_segments=48)
    overhang_max = max(overhang_max, unsupported.area())
    prior = current
assert overhang_max < 0.02, overhang_max

validation = {
    'dimensions_are_photo_estimates': True,
    'printer': 'Bambu Lab P1S',
    'assumed_nozzle_mm': 0.4,
    'assumed_material': 'Generic PLA',
    'paper_side_mm': PAPER_SIDE,
    'clear_storage_mm': [INNER_SIDE, INNER_SIDE, INNER_HEIGHT],
    'clear_collar_mm': [COLLAR_CLEAR_WIDTH, COLLAR_CLEAR_DEPTH],
    'collar_height_mm': COLLAR_HEIGHT,
    'finger_slot_mm': SLOT_WIDTH,
    'paper_fit_intersection_mm3': (body ^ paper).volume(),
    'collar_passage_intersection_mm3': (body ^ passage).volume(),
    'max_unsupported_area_at_45deg_mm2': overhang_max,
    'physical_fit_verified': False,
    'parts': {},
}
for name, part in [('paper_box', mesh), ('fit_check', coupon_mesh)]:
    reloaded = trimesh.load_mesh(OUT/f'{name}.stl')
    assert reloaded.is_watertight and reloaded.is_winding_consistent
    assert len(reloaded.split()) == 1
    assert np.allclose(reloaded.extents, part.extents, atol=1e-4)
    validation['parts'][name] = dict(
        extents_mm=np.round(part.extents,3).tolist(),
        watertight=bool(reloaded.is_watertight),
        connected_solids=len(reloaded.split()),
        volume_cm3=round(float(part.volume)/1000,2),
        triangles=int(len(part.faces)),
    )
(OUT/'validation.json').write_text(json.dumps(validation, ensure_ascii=False, indent=2)+'\n')

# Render the actual STL geometry with a depth buffer; no invented product images.
fig, axes = plt.subplots(1, 2, figsize=(14, 7), facecolor='#f3f0e9')
view3d(axes[0], [(mesh, '#468d9a')], 32, -62)
view3d(axes[1], [(mesh, '#468d9a')], 43, 126)
axes[0].set_title('Вид спереди · прорезь 28 мм', fontsize=16, pad=8)
axes[1].set_title('Вид сзади · проход 68 × 34 мм', fontsize=16, pad=8)
fig.suptitle('Коробочка для бумажек на лампу', fontsize=24, y=.94)
fig.text(.5, .055, 'Внутри 95 × 95 × 105 мм  •  Обойма высотой 12 мм  •  Опора на основание лампы',
         ha='center', fontsize=14, color='#35474b')
fig.subplots_adjust(left=.015, right=.985, bottom=.13, top=.83, wspace=.035)
fig.savefig(OUT/'preview.png', dpi=170, facecolor=fig.get_facecolor())
plt.close(fig)

# Orthographic plan and front elevation with model-space dimensions.
fig, (top, front) = plt.subplots(1, 2, figsize=(13, 8), facecolor='white')
for p in (outer, inner, collar_outline, collar_hole):
    a = np.asarray(p.exterior.coords)
    top.plot(a[:,0], a[:,1], color='#245767', lw=1.6)
top.set_title('Вид сверху', fontsize=17)
top.annotate('', (-INNER_SIDE/2,48), (INNER_SIDE/2,48), arrowprops={'arrowstyle':'<->'})
top.text(0, 50, '95 мм внутри', ha='center', fontsize=12)
top.annotate('', (-COLLAR_CLEAR_WIDTH/2, HOLE_FRONT+17),
             (COLLAR_CLEAR_WIDTH/2,HOLE_FRONT+17), arrowprops={'arrowstyle':'<->'})
top.text(0,HOLE_FRONT+19,'68 мм',ha='center',fontsize=12)
top.annotate('', (43,HOLE_FRONT),(43,HOLE_BACK),arrowprops={'arrowstyle':'<->'})
top.text(45,HOLE_FRONT+17,'34 мм',rotation=90,va='center',fontsize=12)
front_outline = box(-OUTER/2,0,OUTER/2,HEIGHT).difference(slot_profile)
for p in [front_outline]:
    a=np.asarray(p.exterior.coords);front.plot(a[:,0],a[:,1],color='#245767',lw=1.6)
front.plot([-OUTER/2,OUTER/2],[FLOOR,FLOOR],color='#a0aeb4',ls='--')
front.annotate('',(-slot_r,65),(slot_r,65),arrowprops={'arrowstyle':'<->'})
front.text(0,68,'28 мм',ha='center',fontsize=12)
front.annotate('',(OUTER/2+8,FLOOR),(OUTER/2+8,HEIGHT),arrowprops={'arrowstyle':'<->'})
front.text(OUTER/2+11,(HEIGHT+FLOOR)/2,'105 мм внутри',rotation=90,va='center',fontsize=12)
front.set_title('Вид спереди', fontsize=17)
for ax in (top,front):
    ax.set_aspect('equal');ax.set_axis_off();ax.margins(.16)
fig.suptitle('Размеры, мм · оценка по фотографиям',fontsize=21)
fig.text(.5,.055,'Бумажки ≈ 90 × 90 мм  |  Стенки 2,8 мм  |  Дно 3,2 мм  |  Габариты '+
         ' × '.join(f'{v:.1f}' for v in mesh.extents)+' мм',ha='center',fontsize=12)
fig.savefig(OUT/'dimensions.png',dpi=170,bbox_inches='tight')
plt.close(fig)
print(json.dumps(validation, ensure_ascii=False, indent=2))
