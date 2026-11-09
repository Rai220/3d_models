"""Render validated printable STLs at placements reported by the final project slice."""
from pathlib import Path
import xml.etree.ElementTree as ET
import zipfile
import trimesh
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from cad_helpers import view3d
R=Path(__file__).resolve().parents[1]
def render():
    import json,hashlib
    report=json.loads((R/'slicing_validation.json').read_text())
    assert hashlib.sha256((R/'P1S_servo_clamp_corrected.3mf').read_bytes()).hexdigest()==report['project_sha256']
    info={'Original_H13':('servo_clamp_corrected.stl','#21879a','stl_sha256'),
          'Thin_DHV56MG':('servo_clamp_thin.stl','#d28b38','thin_stl_sha256')}
    meshes=[]
    for obj in report['sliced_plates'][0]['objects']:
        name,color,key=info[obj['name']]
        assert hashlib.sha256((R/name).read_bytes()).hexdigest()==report[key]
        mesh=trimesh.load_mesh(R/name);b=obj['bbox']
        mesh.apply_translation([b['x']-mesh.bounds[0,0],b['y']-mesh.bounds[0,1],b['z']-mesh.bounds[0,2]])
        meshes.append((mesh,color))
    assert len(meshes)==2
    fig,ax=plt.subplots(figsize=(11,9),facecolor='#f3f0e9')
    view3d(ax,meshes,48,-75)
    ax.set_title('Два кронштейна на одной пластине P1S',fontsize=17)
    fig.text(.5,.04,'Синий — прежний • Оранжевый — под тонкую серву',ha='center',fontsize=10)
    fig.text(.5,.015,'Масштаб 100%. Поддержки и стол на схеме не показаны.',ha='center',fontsize=10)
    fig.tight_layout(rect=(0,.06,1,.97));fig.savefig(R/'plate_preview.png',dpi=150)
if __name__=='__main__':render()
