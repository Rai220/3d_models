#!/usr/bin/env python3
"""Reproduce axial hub measurements from the downloaded, unmodified STL files."""
from pathlib import Path
import hashlib
import json

import numpy as np
import trimesh

ROOT = Path(__file__).resolve().parent
REFERENCES = [
    ("HamsterRC_mini-z-k969-wheel-v2.stl", 1,
     "https://www.printables.com/model/723463-mini-zwltoys-k969k989-wheels-and-tires",
     "Hamster RC", "Creative Commons — Attribution"),
    ("Lay10000_rim.stl", 1000,
     "https://www.printables.com/model/1320028-wltoys-k969-k989-284131-wheel-rims",
     "Lay10000", "Creative Commons — Attribution — Noncommercial — Share Alike"),
]


def measure():
    measurements = []
    for filename, scale, url, author, license_name in REFERENCES:
        path = ROOT / "references" / filename
        mesh = trimesh.load(path)
        mesh.apply_scale(scale)
        # The Lay10000 file is exported in metre-sized coordinates. STL has no
        # units; x1000 yields the same 21 mm rim and 2 x 3.4 mm bore as Hamster RC.
        vertices = mesh.vertices
        radius = np.linalg.norm(vertices[:, :2], axis=1)
        bore_vertices = vertices[radius < 2]
        hub_z = [float(x) for x in (bore_vertices[:, 2].min(), bore_vertices[:, 2].max())]
        faces = mesh.triangles_center
        horizontal = np.abs(mesh.face_normals[:, 2]) > .99999
        central = np.linalg.norm(faces[:, :2], axis=1) < 2.5
        measured_faces = []
        for z in hub_z:
            selected = horizontal & central & np.isclose(faces[:, 2], z, atol=1e-5)
            points = mesh.triangles[selected].reshape(-1, 3)
            measured_faces.append({
                "z_mm": z,
                "area_mm2": float(mesh.area_faces[selected].sum()),
                "outer_diameter_mm": float(2 * np.linalg.norm(points[:, :2], axis=1).max()),
            })
        assert abs(hub_z[1] - hub_z[0] - 2) < 1e-5
        assert all(abs(f["outer_diameter_mm"] - 5) < 1e-5 for f in measured_faces)
        measurements.append({
            "file": filename, "author": author, "model_url": url,
            "license_from_model_api": license_name,
            "download_date": "2026-10-10",
            "sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
            "coordinate_to_mm_scale": scale,
            "wheel_bounds_mm": mesh.bounds.tolist(),
            "hub_axial_length_mm": hub_z[1] - hub_z[0],
            "hub_end_faces": measured_faces,
            "reference_bore_xy_mm": np.ptp(bore_vertices[:, :2], axis=0).tolist(),
            "note": "Compatible community wheel model; not a factory drawing or measurement of an OEM wheel. "
                    "Only axial hub length and outside diameter are used; the user's axle hole is retained.",
        })
    out = ROOT / "references" / "hub_measurements.json"
    out.write_text(json.dumps(measurements, ensure_ascii=False, indent=2) + "\n")
    print(out)


if __name__ == "__main__":
    measure()
