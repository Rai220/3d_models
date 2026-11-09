"""Inspect real extrusion paths at functional channels and supporting features."""
from pathlib import Path
import re,json,hashlib,zipfile
import numpy as np
import trimesh
from shapely.geometry import Point,LineString
from shapely.ops import unary_union
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.collections import LineCollection
from gcode_paths import extrusion_paths

R=Path(__file__).resolve().parents[1]
results=json.loads((R/'slicing_validation.json').read_text())
geometry=json.loads((R/'geometry_validation.json').read_text())
checks=[]
fig,axes=plt.subplots(2,4,figsize=(16,8))
for row,name in enumerate(('tie_rod','knuckle')):
    text=(R/f'check_{name}/plate_1.gcode').read_text()
    cuts=list(re.finditer(r'^; CHANGE_LAYER\s*\n; Z_HEIGHT: ([0-9.]+)',text,re.M))
    layers={float(c.group(1)):text[c.start():cuts[i+1].start() if i+1<len(cuts) else len(text)] for i,c in enumerate(cuts)}
    b=results[name]['sliced_plates'][0]['objects'][0]['bbox']
    with zipfile.ZipFile(R/f'P1S_LDRC_{name}.3mf') as archive:
        settings=json.loads(archive.read('Metadata/project_settings.config'))
    offset=np.array([float(v) for v in settings['extruder_offset'][0].split('x')])
    mesh=trimesh.load_mesh(R/f'stl/{name}_print.stl')
    assert np.allclose(mesh.extents,[b['width'],b['depth'],b['height']],atol=.01)
    targets=[.8,2.48,3.68,4.28] if name=='tie_rod' else [.2,4.76,9.56,11.84]
    for col,target in enumerate(targets):
        z=min(layers,key=lambda h:abs(h-target))
        all_lines=extrusion_paths(layers[z])+offset-np.array([b['x'],b['y']])
        model_text=re.sub(r'^; FEATURE: Support[^\n]*','; FEATURE: ',layers[z],flags=re.M)
        lines=extrusion_paths(model_text)+offset-np.array([b['x'],b['y']])
        ax=axes[row,col];ax.add_collection(LineCollection(all_lines,colors='#57a95f',linewidths=.6))
        ax.add_collection(LineCollection(lines,colors='#187a96',linewidths=.6))
        section=mesh.section(plane_origin=[0,0,z-.001],plane_normal=[0,0,1])
        if section:
            for contour in section.discrete:ax.plot(contour[:,0],contour[:,1],color='#db6e25',lw=.65)
        ax.set(xlim=(-4,mesh.extents[0]+4),ylim=(-4,mesh.extents[1]+4),aspect='equal')
        ax.set_title(f'{name}: Z={z:.2f} mm')
        network=unary_union([LineString(l) for l in lines])
        if name=='knuckle':
            center=np.array(geometry[name]['shift_after_rotation'][:2])
            distance=network.distance(Point(center))
            expected_radius=[6.25,6.25,3.75,2.25][col]
            assert distance>expected_radius-.05,(name,z,distance,expected_radius)
            checks.append({'part':name,'z_mm':z,'center_to_nearest_extrusion_mm':distance,'feature':'axial bore'})
            if col==0:
                body_text=re.sub(r'^; FEATURE: (?:Support[^\n]*|Brim)','; FEATURE: ',layers[z],flags=re.M)
                body=extrusion_paths(body_text)+offset-np.array([b['x'],b['y']])
                centers=body.mean(axis=1)
                arm=(centers[:,0]>9.8)&(centers[:,0]<13.7)&(centers[:,1]>15)&(centers[:,1]<19)
                assert arm.sum()>3,'The steering arm must be printed in the first layer.'
                checks.append({'part':name,'feature':'steering arm begins on first layer','z_mm':z,'model_segments_in_arm':int(arm.sum())})
        elif .9<z<3.9:
            for x in (3.,46.5):
                probe=LineString([(x,.3),(x,3.7)])
                distance=network.distance(probe)
                assert distance>.7,(name,z,x,distance)
                checks.append({'part':name,'z_mm':z,'x_mm':x,'channel_to_nearest_extrusion_mm':distance,'feature':'horizontal eye bore'})
    checks.append({'part':name,'support_feature_blocks':len(re.findall(r'; FEATURE: Support',text)),
        'gcode_sha256':hashlib.sha256(text.encode()).hexdigest()})
fig.suptitle('LDRC: model paths (blue), removable supports (green), CAD sections (orange)')
fig.tight_layout();fig.savefig(R/'analysis/print_paths.png',dpi=160)
(R/'toolpath_validation.json').write_text(json.dumps({'checks':checks,'physical_fit_verified':False,
    'limitation':'Model extrusion centerlines only; supports are excluded and must be removed from the knuckle bore. These are not measured printed surfaces; hardware and mating parts unavailable.'},indent=2))
print(json.dumps(checks,indent=2))
