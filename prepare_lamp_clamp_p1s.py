"""Create and re-open/slice a P1S project without altering earlier box files."""
from pathlib import Path
import json
import subprocess
import zipfile
import xml.etree.ElementTree as ET
import trimesh
from shapely.geometry import MultiPoint

ROOT=Path(__file__).resolve().parent
OUT=ROOT/'lamp_clamp'
PRESETS=OUT/'presets'
CHECK=OUT/'slicing_check'
for p in (PRESETS,CHECK): p.mkdir(parents=True,exist_ok=True)
BBL=Path('/Applications/BambuStudio.app/Contents/Resources/profiles/BBL')
CLI='/Applications/BambuStudio.app/Contents/MacOS/BambuStudio'


def profile(category,name,trail=()):
    assert name not in trail
    paths=list((BBL/category).rglob(name+'.json'))
    assert len(paths)==1,(name,paths)
    raw=json.loads(paths[0].read_text())
    out=profile(category,raw['inherits'],trail+(name,)) if raw.get('inherits') else {}
    for include in raw.get('include',[]): out.update(profile(category,include,trail+(name,)))
    out.update(raw);out.pop('include',None);out['inherits']=''
    return out


machine=profile('machine','Bambu Lab P1S 0.4 nozzle')
machine.update(printer_settings_id=machine['name'],curr_bed_type='Textured PEI Plate')
process=profile('process','0.16mm Optimal @BBL X1C')
process.update({'name':'0.16mm Printed lamp clamp @P1S','print_settings_id':'0.16mm Printed lamp clamp @P1S',
                'from':'user','wall_loops':'6','top_shell_layers':'6','bottom_shell_layers':'6',
                'sparse_infill_density':'35%','sparse_infill_pattern':'gyroid','enable_support':'0',
                'brim_type':'no_brim','brim_width':'0','seam_position':'aligned',
                'outer_wall_speed':['60','60'],'inner_wall_speed':['100','100'],
                'initial_layer_speed':['25','25'],'initial_layer_infill_speed':['45','45'],
                'elefant_foot_compensation':'0.15','print_sequence':'by layer',
                'curr_bed_type':'Textured PEI Plate'})
filament=profile('filament','Generic PLA')
filament.update(filament_settings_id=['Generic PLA'],filament_colour=['#468D9A'])
for name,data in [('p1s_04',machine),('clamp_016',process),('generic_pla',filament)]:
    (PRESETS/(name+'.json')).write_text(json.dumps(data,ensure_ascii=False,indent=2)+'\n')


def run(args,cwd,log):
    with open(log,'w') as f:
        completed=subprocess.run([CLI,'--debug','2']+args,cwd=cwd,stdout=f,stderr=subprocess.STDOUT)
    if completed.returncode:
        raise RuntimeError(f'Bambu Studio code {completed.returncode}: {Path(log).read_text()[-5000:]}')


run(['--load-settings',str(PRESETS/'p1s_04.json')+';'+str(PRESETS/'clamp_016.json'),
     '--load-filaments',str(PRESETS/'generic_pla.json'),'--orient','0','--arrange','1',
     '--outputdir',str(OUT),'--export-3mf','P1S_lamp_clamp.3mf',str(OUT/'clamp_geometry.3mf')],
     OUT,OUT/'bambu_prepare.log')
project=OUT/'P1S_lamp_clamp.3mf'
with zipfile.ZipFile(project) as z:
    assert z.testzip() is None
    s=json.loads(z.read('Metadata/project_settings.config'))
    assert s['printer_model']=='Bambu Lab P1S' and s['nozzle_diameter']==['0.4']
    assert s['wall_loops']=='6' and s['sparse_infill_pattern']=='gyroid'
    assert s['sparse_infill_density']=='35%' and s['enable_support']=='0'
    assert abs(float(s['layer_height'])-.16)<.0001
    model=ET.fromstring(z.read('Metadata/model_settings.config'))
    assert len(model.findall('plate'))==1
    assert len(model.findall('plate/model_instance'))==4
    for stat in model.findall('.//mesh_stat'):
        assert all(int(stat.get(k,'0'))==0 for k in
                   ['edges_fixed','degenerate_facets','facets_removed','facets_reversed','backwards_edges'])

run(['--slice','1','--orient','0','--arrange','0','--outputdir',str(CHECK),
     '--export-3mf','checked_clamp.gcode.3mf',str(project)],CHECK,CHECK/'slice.log')
result=json.loads((CHECK/'result.json').read_text())
assert result['return_code']==0 and len(result['sliced_plates'])==1
plate=result['sliced_plates'][0]
assert not plate['warning_message'],plate['warning_message']
assert len(plate['objects'])==4
for obj in plate['objects']:
    b=obj['bbox']
    assert abs(b['z'])<.001 and b['x']>=18 and b['y']>=28
    assert b['x']+b['width']<=256 and b['y']+b['depth']<=256 and b['height']<256
# The CLI reports rotated bounding boxes conservatively. Check the actual
# transformed mesh footprints, not overlapping enclosing rectangles.
scene=trimesh.load_scene(project)
footprints=[]
for node in scene.graph.nodes_geometry:
    transform,key=scene.graph[node]
    part=scene.geometry[key].copy();part.apply_transform(transform)
    footprints.append(MultiPoint(part.vertices[:,:2]).convex_hull)
assert len(footprints)==4
min_spacing=min(a.distance(b) for i,a in enumerate(footprints) for b in footprints[i+1:])
assert min_spacing>1.9,min_spacing
with zipfile.ZipFile(CHECK/'checked_clamp.gcode.3mf') as z:
    gcodes=[n for n in z.namelist() if n.endswith('.gcode')]
    assert len(gcodes)==1 and len(z.read(gcodes[0]))>10000
    (CHECK/'slicer_preview.png').write_bytes(z.read('Metadata/plate_1.png'))
v=json.loads((OUT/'validation.json').read_text())
v['bambu_studio_slicing_verified']=True
v['minimum_plate_spacing_mm']=round(min_spacing,4)
v['slicer_estimate']={'seconds':round(plate['total_predication']),
                      'filament_g':round(sum(f['total_used_g'] for f in plate['filaments']),1),
                      'warnings':plate['warning_message'],'objects_on_plate':4,
                      'layer_height_mm':.16,'supports':False}
(OUT/'validation.json').write_text(json.dumps(v,ensure_ascii=False,indent=2)+'\n')
print(json.dumps(v['slicer_estimate'],ensure_ascii=False,indent=2))
