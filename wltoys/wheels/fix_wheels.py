#!/usr/bin/env python3
"""Shorten the K989 wheel hubs without scaling their rims or axle holes.

The stock axial hub length is NOT documented in the source project. It must
be supplied explicitly, measured between the two axial mounting faces.

Coordinates in the revised model: z=0 is the inboard mounting face; +z points
out of the car. The rim spans 0..width; the hub spans 0..hub_length, regardless
of wheel width. The nut goes on the short hub inside the open outer dish.

Run with the workspace .venv Python. Existing printer settings and placement
are retained, with rectilinear infill names normalized to Bambu's zig-zag enum;
there is no cached G-code in the source project.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import re
import sys
import xml.etree.ElementTree as ET
import zipfile

import numpy as np
import trimesh

ROOT = Path(__file__).resolve().parent
SOURCE = ROOT / "WLtoys_K989_P1S_PLA_Basic_STRONG_W6-14_20pcs (1).3mf"
NS = "http://schemas.microsoft.com/3dmanufacturing/core/2015/02"
PROD = "http://schemas.microsoft.com/3dmanufacturing/production/2015/06"
Q = lambda name: f"{{{NS}}}{name}"
WIDTHS = (6, 8, 10, 12, 14)
SOURCE_HUB_RADIUS = 3.25
HUB_RADIUS = 2.5  # Measured in both downloaded reference wheels; see references/.
SPOKE_HEIGHT = 1.5
INFILL_PATTERN_KEYS = ("sparse_infill_pattern", "internal_solid_infill_pattern")


def compatible_project_settings(raw):
    """Use Bambu's enum for straight-line infill, including at 100% density."""
    settings = json.loads(raw)
    changes = {}
    for key in INFILL_PATTERN_KEYS:
        if settings.get(key) == "rectilinear":
            settings[key] = "zig-zag"
            changes[key] = {"from": "rectilinear", "to": "zig-zag"}
    return settings, changes


def mesh_from_object(obj):
    v = np.array([[float(x.get(k)) for k in ("x", "y", "z")]
                  for x in obj.findall(f"{Q('mesh')}/{Q('vertices')}/{Q('vertex')}")])
    f = np.array([[int(x.get(k)) for k in ("v1", "v2", "v3")]
                  for x in obj.findall(f"{Q('mesh')}/{Q('triangles')}/{Q('triangle')}")])
    return trimesh.Trimesh(v, f, process=False)


def shorten_hub(mesh, width, hub_length):
    """Move the hub face and OD only. Keep the original axle-hole profile."""
    fixed = mesh.copy()
    v = fixed.vertices.copy()
    radial = np.linalg.norm(v[:, :2], axis=1)
    outer_hub = (radial <= SOURCE_HUB_RADIUS + 0.001) & np.isclose(v[:, 2], width)
    assert outer_hub.sum() > 50, "Unexpected source hub topology"
    v[outer_hub, 2] = hub_length
    # All non-bore vertices in the central region lie on the source OD. Move
    # the spoke roots with that OD, keeping shared vertices and topology intact.
    hub_od = (radial > SOURCE_HUB_RADIUS - .002) & (radial < SOURCE_HUB_RADIUS + .001)
    v[hub_od, :2] *= HUB_RADIUS / SOURCE_HUB_RADIUS
    fixed.vertices = v
    return fixed


def verify(original, fixed, width, hub_length):
    assert fixed.is_watertight and fixed.is_winding_consistent
    assert fixed.is_volume and fixed.body_count == 1
    assert np.all(fixed.area_faces > 1e-10)
    np.testing.assert_allclose(fixed.bounds, [[-10, -10, 0], [10, 10, width]], atol=1e-5)
    np.testing.assert_array_equal(original.faces, fixed.faces)
    r = np.linalg.norm(fixed.vertices[:, :2], axis=1)
    source_r = np.linalg.norm(original.vertices[:, :2], axis=1)
    unchanged = source_r > SOURCE_HUB_RADIUS + .001
    np.testing.assert_array_equal(original.vertices[unchanged], fixed.vertices[unchanged])
    np.testing.assert_array_equal(original.vertices[source_r < 2, :2], fixed.vertices[r < 2, :2])
    core = fixed.vertices[r <= HUB_RADIUS + 0.001]
    assert np.isclose(core[:, 2].min(), 0)
    assert np.isclose(core[:, 2].max(), hub_length)
    bore = fixed.vertices[r < 2]
    np.testing.assert_allclose(np.ptp(bore[:, :2], axis=0), [3.1, 2.1], atol=3e-5)
    # Above the nut seat there is only the rim. This checks the whole triangles,
    # not only the absence of central vertices, for unobstructed tool access.
    tri = fixed.triangles
    high = tri[:, :, 2].max(axis=1) > hub_length + 1e-6
    high_points = tri[high].reshape(-1, 3)
    minimum_high_radius = np.linalg.norm(high_points[:, :2], axis=1).min()
    assert minimum_high_radius > 8.09
    return {
        "width_mm": width,
        "hub_length_mm": hub_length,
        "hub_outer_diameter_mm": 2 * HUB_RADIUS,
        "bore_xy_mm": np.ptp(bore[:, :2], axis=0).tolist(),
        "inboard_mount_z_mm": 0,
        "nut_seat_z_mm": hub_length,
        "rim_inboard_z_mm": 0,
        "rim_outboard_z_mm": width,
        "outer_extension_vs_W06_mm": width - 6,
        "watertight": bool(fixed.is_watertight),
        "winding_consistent": bool(fixed.is_winding_consistent),
        "connected_bodies": int(fixed.body_count),
        "volume_mm3": float(fixed.volume),
        "original_volume_mm3": float(original.volume),
        "min_radius_above_nut_seat_mm": float(minimum_high_radius),
    }


def save_archive(source, target, replacements):
    with zipfile.ZipFile(source) as zin, zipfile.ZipFile(target, "w", zipfile.ZIP_DEFLATED) as zout:
        for entry in zin.infolist():
            if entry.filename in replacements:
                zout.writestr(entry.filename, replacements[entry.filename])
            else:
                zout.writestr(entry.filename, zin.read(entry.filename))


def render_preview(meshes, hub_length, out):
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt
    from matplotlib.collections import LineCollection
    sys.path.insert(0, str(ROOT.parent.parent))
    from cad_helpers import view3d

    fig = plt.figure(figsize=(15, 8.5), facecolor="white")
    grid = fig.add_gridspec(2, 5, height_ratios=[1, 1.5])
    for i, (w, m) in enumerate(meshes.items()):
        ax = fig.add_subplot(grid[0, i])
        section = m.section(plane_normal=[0, 1, 0], plane_origin=[0, 0, 0])
        lines = [p[:, [0, 2]] for p in section.discrete]
        ax.add_collection(LineCollection(lines, colors="#155e75", linewidths=1.7))
        ax.axhline(0, color="#2a9d68", linestyle="--", linewidth=1)
        ax.plot([-HUB_RADIUS, HUB_RADIUS], [hub_length, hub_length], color="#d97706", linewidth=2)
        ax.set(xlim=(-11, 11), ylim=(-1, 16), title=f"W = {w} мм", xlabel="мм")
        ax.set_aspect("equal")
        ax.spines[["top", "right"]].set_visible(False)
        if i == 0:
            ax.set_ylabel("Наружу от машины →, мм")
    ax = fig.add_subplot(grid[1, :2])
    view3d(ax, [(meshes[6], "#5e8495")], 55, -65)
    ax.set_title("6 мм — вид со стороны гайки")
    ax = fig.add_subplot(grid[1, 2:])
    view3d(ax, [(meshes[14], "#5e8495")], 55, -65)
    ax.set_title("14 мм — гайка остаётся внутри диска")
    fig.suptitle(f"WLtoys K989: постоянная длина втулки {hub_length:g} мм", fontsize=19, y=.98)
    fig.text(.5, .035, "Зелёная линия — внутренний упор; оранжевая — площадка под гайку.\n"
             "Все добавленные миллиметры ширины направлены наружу от машины.",
             ha="center", fontsize=12)
    fig.subplots_adjust(top=.91, bottom=.12, wspace=.35, hspace=.22)
    fig.savefig(out / "geometry_preview.png", dpi=160)
    plt.close(fig)


def build(hub_length, output, dimension_source, preview=True):
    if not SPOKE_HEIGHT < hub_length < min(WIDTHS):
        raise ValueError("Hub length must be >1.5 and <6 mm for this source topology. "
                         "A length outside this range requires rebuilding the spokes.")
    output.mkdir(parents=True, exist_ok=True)
    tag = f"H{hub_length:g}".replace(".", "p")
    ET.register_namespace("", NS)
    ET.register_namespace("p", PROD)
    with zipfile.ZipFile(SOURCE) as z:
        root = ET.fromstring(z.read("3D/3dmodel.model"))
        settings = ET.fromstring(z.read("Metadata/model_settings.config"))
        project_settings, compatibility_changes = compatible_project_settings(
            z.read("Metadata/project_settings.config"))
    meshes, reports = {}, []
    names = {}
    hub_cores = []
    for obj in root.find(Q("resources")).findall(Q("object")):
        width = int(re.search(r"_W(\d+)", obj.get("name")).group(1))
        original = mesh_from_object(obj)
        fixed = shorten_hub(original, width, hub_length)
        report = verify(original, fixed, width, hub_length)
        name = f"{obj.get('name')}_FIXED_{tag}"
        obj.set("name", name)
        names[obj.get("id")] = name
        verts = obj.find(f"{Q('mesh')}/{Q('vertices')}")
        for vertex, xyz in zip(verts, fixed.vertices):
            for key, value in zip(("x", "y", "z"), xyz):
                vertex.set(key, f"{value:.6f}")
        if width not in meshes:
            meshes[width] = fixed
            reports.append(report)
            fixed.export(output / f"K989_D20_W{width:02d}_FIXED_{tag}.stl")
            core = fixed.vertices[np.linalg.norm(fixed.vertices[:, :2], axis=1) <= HUB_RADIUS + .001]
            hub_cores.append(np.unique(core.round(5), axis=0))
    assert len(names) == 20 and set(meshes) == set(WIDTHS)
    for core in hub_cores[1:]:
        np.testing.assert_array_equal(core, hub_cores[0])
    for item in root.find(Q("build")):
        item.set("partnumber", names[item.get("objectid")])
    for obj in settings.findall("object"):
        for meta in obj.findall("metadata"):
            if meta.get("key") == "name":
                meta.set("value", names[obj.get("id")])
    meta = ET.SubElement(root, Q("metadata"), {"name": "Description"})
    meta.text = (f"Constant hub axial length {hub_length:g} mm, source: {dimension_source}. "
                 "z=0 faces chassis; nut seat at z=H; increased width grows outboard. "
                 "Hub OD 5 mm from compatible reference models; original bore 3.1 x 2.1 mm retained.")
    result_path = output / f"WLtoys_K989_P1S_PLA_FIXED_{tag}_W6-14_20pcs.3mf"
    save_archive(SOURCE, result_path, {
        "3D/3dmodel.model": ET.tostring(root, encoding="utf-8", xml_declaration=True),
        "Metadata/model_settings.config": ET.tostring(settings, encoding="utf-8", xml_declaration=True),
        "Metadata/project_settings.config": json.dumps(project_settings, indent=2).encode("utf-8"),
    })
    # Verify the final archive, its unchanged settings/placements, and STL roundtrip.
    with zipfile.ZipFile(result_path) as z, zipfile.ZipFile(SOURCE) as old:
        assert z.testzip() is None
        expected_settings, _ = compatible_project_settings(old.read("Metadata/project_settings.config"))
        assert json.loads(z.read("Metadata/project_settings.config")) == expected_settings
        saved = ET.fromstring(z.read("3D/3dmodel.model"))
        before = ET.fromstring(old.read("3D/3dmodel.model"))
        assert [x.get("transform") for x in saved.find(Q("build"))] == [x.get("transform") for x in before.find(Q("build"))]
        for obj in saved.find(Q("resources")).findall(Q("object")):
            m = mesh_from_object(obj)
            assert m.is_volume and m.is_watertight
    for w in WIDTHS:
        m = trimesh.load(output / f"K989_D20_W{w:02d}_FIXED_{tag}.stl")
        assert m.is_watertight and m.is_volume
    (output / "validation.json").write_text(json.dumps({
        "source_sha256": hashlib.sha256(SOURCE.read_bytes()).hexdigest(),
        "dimension_source": dimension_source,
        "stock_hub_length_independently_verified": False,
        "hub_od_source": "5 mm measured in Printables models 723463 and 1320028; not OEM drawing",
        "hub_identical_across_widths": True,
        "object_count": len(names),
        "printer_settings_preserved_except_compatibility_changes": True,
        "profile_compatibility_changes": compatibility_changes,
        "build_placements_preserved": True,
        "physical_fit_tested": False,
        "wheels": reports,
    }, ensure_ascii=False, indent=2) + "\n")
    if preview:
        render_preview(meshes, hub_length, output)
    return result_path


if __name__ == "__main__":
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--hub-length", type=float, required=True,
                   help="Measured axial distance from inboard hub face to nut seat, mm")
    p.add_argument("--dimension-source", required=True, help="Where the axial dimension came from")
    p.add_argument("--output", type=Path, required=True)
    p.add_argument("--no-preview", action="store_true")
    args = p.parse_args()
    print(build(args.hub_length, args.output, args.dimension_source, not args.no_preview))
