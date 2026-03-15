#!/usr/bin/env python3
"""Собирает все STL-детали Brotherhood of Steel в один 3MF с цветами."""

import struct
import zipfile
import io
import os

PARTS = [
    ("bos_background.stl", "Background", "#FFFFFF"),      # белый
    ("bos_wings.stl",      "Wings",      "#191970"),      # тёмно-синий
    ("bos_gears.stl",      "Gears",      "#000000"),      # чёрный
    ("bos_sword.stl",      "Sword",      "#C0C0C0"),      # серебристый
    ("bos_frame.stl",      "Frame",      "#696969"),      # тёмно-серый
]

OUTPUT = "bos_panel.3mf"


def read_stl(path):
    """Читает STL (ASCII или binary), возвращает список треугольников."""
    with open(path, "rb") as f:
        head = f.read(80)
        if head[:5] == b"solid" and b"\n" in head:
            # ASCII STL
            f.seek(0)
            text = f.read().decode("ascii", errors="replace")
            return _parse_ascii_stl(text)
        # Binary STL
        n = struct.unpack("<I", f.read(4))[0]
        tris = []
        for _ in range(n):
            data = struct.unpack("<12fH", f.read(50))
            tris.append((data[3:6], data[6:9], data[9:12]))
        return tris


def _parse_ascii_stl(text):
    """Парсит ASCII STL."""
    import re
    tris = []
    verts = []
    for line in text.splitlines():
        line = line.strip()
        if line.startswith("vertex"):
            parts = line.split()
            verts.append((float(parts[1]), float(parts[2]), float(parts[3])))
            if len(verts) == 3:
                tris.append(tuple(verts))
                verts = []
    return tris


def deduplicate(triangles):
    """Дедупликация вершин для 3MF (STL дублирует вершины)."""
    vmap = {}
    verts = []
    idxtris = []
    for v1, v2, v3 in triangles:
        ids = []
        for v in (v1, v2, v3):
            key = (round(v[0], 5), round(v[1], 5), round(v[2], 5))
            if key not in vmap:
                vmap[key] = len(verts)
                verts.append(key)
            ids.append(vmap[key])
        idxtris.append(tuple(ids))
    return verts, idxtris


def build_model_xml(parts_data):
    """Генерирует XML модели 3MF с материалами и компонентами."""
    NS = "http://schemas.microsoft.com/3dmanufacturing/core/2015/02"
    NS_M = "http://schemas.microsoft.com/3dmanufacturing/material/2015/02"

    lines = []
    lines.append('<?xml version="1.0" encoding="UTF-8"?>')
    lines.append(f'<model unit="millimeter" xml:lang="en-US"')
    lines.append(f'  xmlns="{NS}"')
    lines.append(f'  xmlns:m="{NS_M}">')
    lines.append("  <metadata name=\"Title\">Brotherhood of Steel Panel</metadata>")
    lines.append("  <resources>")

    # Материалы (basematerials)
    lines.append('    <basematerials id="1">')
    for _, name, color in PARTS:
        lines.append(f'      <base name="{name}" displaycolor="{color}" />')
    lines.append("    </basematerials>")

    # Отдельный object для каждой детали
    obj_ids = []
    next_id = 2
    for i, (verts, idxtris) in enumerate(parts_data):
        oid = next_id
        next_id += 1
        obj_ids.append(oid)

        lines.append(f'    <object id="{oid}" type="model" pid="1" pindex="{i}">')
        lines.append("      <mesh>")
        lines.append("        <vertices>")
        for x, y, z in verts:
            lines.append(f'          <vertex x="{x}" y="{y}" z="{z}" />')
        lines.append("        </vertices>")
        lines.append("        <triangles>")
        for v1, v2, v3 in idxtris:
            lines.append(f'          <triangle v1="{v1}" v2="{v2}" v3="{v3}" />')
        lines.append("        </triangles>")
        lines.append("      </mesh>")
        lines.append("    </object>")

    # Композитный объект
    comp_id = next_id
    lines.append(f'    <object id="{comp_id}" type="model">')
    lines.append("      <components>")
    for oid in obj_ids:
        lines.append(f'        <component objectid="{oid}" />')
    lines.append("      </components>")
    lines.append("    </object>")

    lines.append("  </resources>")
    lines.append("  <build>")
    lines.append(f'    <item objectid="{comp_id}" />')
    lines.append("  </build>")
    lines.append("</model>")

    return "\n".join(lines)


def main():
    os.chdir(os.path.dirname(os.path.abspath(__file__)))

    print("Читаю STL файлы...")
    parts_data = []
    for stl_file, name, color in PARTS:
        print(f"  {stl_file} ({name}, {color})")
        tris = read_stl(stl_file)
        verts, idxtris = deduplicate(tris)
        parts_data.append((verts, idxtris))
        print(f"    вершин: {len(verts)}, треугольников: {len(idxtris)}")

    print("Генерирую 3MF...")
    model_xml = build_model_xml(parts_data)

    content_types = '<?xml version="1.0" encoding="UTF-8"?>\n'
    content_types += '<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">\n'
    content_types += '  <Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml" />\n'
    content_types += '  <Default Extension="model" ContentType="application/vnd.ms-package.3dmanufacturing-3dmodel+xml" />\n'
    content_types += '</Types>'

    rels = '<?xml version="1.0" encoding="UTF-8"?>\n'
    rels += '<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">\n'
    rels += '  <Relationship Target="/3D/3dmodel.model" Id="rel0" Type="http://schemas.microsoft.com/3dmanufacturing/2013/01/3dmodel" />\n'
    rels += '</Relationships>'

    with zipfile.ZipFile(OUTPUT, "w", zipfile.ZIP_DEFLATED) as zf:
        zf.writestr("[Content_Types].xml", content_types)
        zf.writestr("_rels/.rels", rels)
        zf.writestr("3D/3dmodel.model", model_xml)

    size_mb = os.path.getsize(OUTPUT) / (1024 * 1024)
    print(f"\nГотово: {OUTPUT} ({size_mb:.1f} MB)")
    print("Открывайте в Bambu Studio / OrcaSlicer — цвета и расположение уже настроены.")


if __name__ == "__main__":
    main()
