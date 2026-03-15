#!/usr/bin/env python3
"""Build a multi-color 3MF file from case + inlay STL files."""

import zipfile
import struct
import os
from stl import mesh

def stl_to_3mf_mesh_xml(stl_path, object_id):
    """Convert STL to 3MF XML mesh element."""
    m = mesh.Mesh.from_file(stl_path)

    # Collect unique vertices and build triangle indices
    vert_map = {}
    vertices = []
    triangles = []

    for tri in m.vectors:
        tri_indices = []
        for point in tri:
            key = (round(float(point[0]), 6),
                   round(float(point[1]), 6),
                   round(float(point[2]), 6))
            if key not in vert_map:
                vert_map[key] = len(vertices)
                vertices.append(key)
            tri_indices.append(vert_map[key])
        triangles.append(tuple(tri_indices))

    # Build XML
    lines = []
    lines.append(f'  <object id="{object_id}" type="model">')
    lines.append('   <mesh>')
    lines.append('    <vertices>')
    for v in vertices:
        lines.append(f'     <vertex x="{v[0]}" y="{v[1]}" z="{v[2]}" />')
    lines.append('    </vertices>')
    lines.append('    <triangles>')
    for t in triangles:
        lines.append(f'     <triangle v1="{t[0]}" v2="{t[1]}" v3="{t[2]}" />')
    lines.append('    </triangles>')
    lines.append('   </mesh>')
    lines.append('  </object>')

    return '\n'.join(lines)


def build_3mf(case_stl, inlay_stl, output_3mf):
    """Create a 3MF with two objects for multi-color printing."""

    case_xml = stl_to_3mf_mesh_xml(case_stl, object_id=1)
    inlay_xml = stl_to_3mf_mesh_xml(inlay_stl, object_id=2)

    model_xml = f'''<?xml version="1.0" encoding="UTF-8"?>
<model unit="millimeter" xml:lang="en-US"
  xmlns="http://schemas.microsoft.com/3dmanufacturing/core/2015/02"
  xmlns:p="http://schemas.microsoft.com/3dmanufacturing/production/2015/06">
 <metadata name="Application">OpenSCAD + Python</metadata>
 <resources>
  <basematerials id="3">
   <base name="Case" displaycolor="#4A90D9" />
   <base name="Text Red" displaycolor="#FF0000" />
  </basematerials>
{case_xml}
{inlay_xml}
 </resources>
 <build>
  <item objectid="1" p:UUID="a1b2c3d4-0001-0001-0001-000000000001" />
  <item objectid="2" p:UUID="a1b2c3d4-0002-0002-0002-000000000002" />
 </build>
</model>'''

    content_types = '''<?xml version="1.0" encoding="UTF-8"?>
<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
 <Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml" />
 <Default Extension="model" ContentType="application/vnd.ms-package.3dmanufacturing-3dmodel+xml" />
</Types>'''

    rels = '''<?xml version="1.0" encoding="UTF-8"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
 <Relationship Target="/3D/3dmodel.model" Id="rel0" Type="http://schemas.microsoft.com/3dmanufacturing/2013/01/3dmodel" />
</Relationships>'''

    with zipfile.ZipFile(output_3mf, 'w', zipfile.ZIP_DEFLATED) as zf:
        zf.writestr('[Content_Types].xml', content_types)
        zf.writestr('_rels/.rels', rels)
        zf.writestr('3D/3dmodel.model', model_xml)

    print(f"Created {output_3mf}")
    print(f"  Size: {os.path.getsize(output_3mf)} bytes")


if __name__ == '__main__':
    base = os.path.dirname(os.path.abspath(__file__))
    build_3mf(
        os.path.join(base, "case-engraved.stl"),
        os.path.join(base, "text-red.stl"),
        os.path.join(base, "galaxy-s26-ultra-case-multicolor.3mf")
    )
