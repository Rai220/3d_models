"""Resolve installed Bambu profiles, export project, reload exactly it and slice."""
from pathlib import Path
import json, subprocess, zipfile, hashlib
import xml.etree.ElementTree as ET
import numpy as np
import trimesh
from shapely.geometry import Polygon, MultiPoint

R=Path(__file__).resolve().parents[1]
P=R/'presets'; C=R/'slicing_check'
P.mkdir(exist_ok=True); C.mkdir(exist_ok=True)
BBL=Path('/Applications/BambuStudio.app/Contents/Resources/profiles/BBL')
APP='/Applications/BambuStudio.app/Contents/MacOS/BambuStudio'
def resolved(category,name,trail=()):
    assert name not in trail
    paths=list((BBL/category).rglob(name+'.json'));assert len(paths)==1
    raw=json.loads(paths[0].read_text())
    out=resolved(category,raw['inherits'],trail+(name,)) if raw.get('inherits') else {}
    for inc in raw.get('include',[]):out.update(resolved(category,inc,trail+(name,)))
    out.update(raw);out.pop('include',None);out['inherits']=''
    return out

machine=resolved('machine','Bambu Lab P1S 0.4 nozzle')
machine.update(printer_settings_id=machine['name'],curr_bed_type='Textured PEI Plate')
process=resolved('process','0.12mm Fine @BBL X1C')
process.update({'name':'0.12mm WLToys servo clamp trial @P1S','print_settings_id':'0.12mm WLToys servo clamp trial @P1S',
    'from':'user','wall_loops':'5','top_shell_layers':'6','bottom_shell_layers':'6',
    'sparse_infill_density':'40%','sparse_infill_pattern':'gyroid','enable_support':'0',
    'brim_type':'no_brim','brim_width':'0','seam_position':'back',
    'outer_wall_speed':['30','30'],'inner_wall_speed':['50','50'],
    'initial_layer_speed':['20','20'],'initial_layer_infill_speed':['30','30'],
    'initial_layer_print_height':'0.2','top_surface_speed':['30','30'],
    'elefant_foot_compensation':'0.1','xy_hole_compensation':'0',
    'print_sequence':'by layer','curr_bed_type':'Textured PEI Plate','enable_arc_fitting':'0'})
for k in ('sparse_infill_pattern','internal_solid_infill_pattern'):
    if process.get(k)=='rectilinear':process[k]='zig-zag'
filament=resolved('filament','Generic PLA')
filament.update(filament_settings_id=['Generic PLA'],filament_colour=['#21879A'])
for name,cfg in [('p1s_04',machine),('servo_012',process),('generic_pla',filament)]:
    (P/(name+'.json')).write_text(json.dumps(cfg,ensure_ascii=False,indent=2)+'\n')

def run(args,cwd,log):
    with log.open('w') as f:
        proc=subprocess.run([APP,'--debug','2',*args],cwd=cwd,stdout=f,stderr=subprocess.STDOUT)
    assert proc.returncode==0,(proc.returncode,log.read_text()[-5000:])
    return proc.returncode

project=R/'P1S_servo_clamp_trial.3mf'
prepare_code=run(['--load-settings',str(P/'p1s_04.json')+';'+str(P/'servo_012.json'),
    '--load-filaments',str(P/'generic_pla.json'),'--orient','0','--arrange','1',
    '--outputdir',str(R),'--export-3mf',project.name,str(R/'geometry_only.3mf')],R,R/'prepare.log')
with zipfile.ZipFile(project) as z:
    assert z.testzip() is None
    cfg=json.loads(z.read('Metadata/project_settings.config'))
    assert cfg['printer_model']=='Bambu Lab P1S'
    assert cfg['printer_settings_id']=='Bambu Lab P1S 0.4 nozzle'
    assert cfg['nozzle_diameter']==['0.4'] and cfg['filament_type']==['PLA']
    assert cfg['filament_settings_id']==['Generic PLA']
    assert cfg['curr_bed_type']=='Textured PEI Plate'
    assert cfg['wall_loops']=='5' and cfg['enable_support']=='0'
    assert cfg['sparse_infill_density']=='40%' and cfg['sparse_infill_pattern']=='gyroid'
    assert abs(float(cfg['layer_height'])-.12)<1e-7
    settings=ET.fromstring(z.read('Metadata/model_settings.config'))
    assert len(settings.findall('plate/model_instance'))==1
    core=ET.fromstring(z.read('3D/3dmodel.model'))
    ns={'m':'http://schemas.microsoft.com/3dmanufacturing/core/2015/02'}
    assert len(core.findall('m:build/m:item',ns))==1
    assert any(b'<vertices>' in z.read(n) for n in z.namelist() if n.endswith('.model'))
    for stat in settings.findall('.//mesh_stat'):
        assert all(int(stat.get(k,'0'))==0 for k in ['edges_fixed','degenerate_facets','facets_removed','facets_reversed','backwards_edges'])

slice_code=run(['--slice','1','--orient','0','--arrange','0','--outputdir',str(C),
    '--export-3mf','checked_servo_clamp.gcode.3mf',str(project)],C,C/'slice.log')
result=json.loads((C/'result.json').read_text())
assert result['return_code']==0 and len(result['sliced_plates'])==1
plate=result['sliced_plates'][0]
assert not plate['warning_message'] and len(plate['objects'])==1
v=json.loads((R/'geometry_validation.json').read_text())
b=plate['objects'][0]['bbox']
assert np.allclose([b['width'],b['depth'],b['height']],v['extents_mm'],atol=.001)
assert abs(b['z'])<.001 and b['height']<=256
scene=trimesh.load_scene(project)
assert len(scene.graph.nodes_geometry)==1
node=next(iter(scene.graph.nodes_geometry));transform,key=scene.graph[node]
mesh=scene.geometry[key].copy();mesh.apply_transform(transform)
footprint=MultiPoint(mesh.vertices[:,:2]).convex_hull
bed=Polygon([tuple(map(float,s.split('x'))) for s in cfg['printable_area']])
assert bed.contains(footprint)
excluded=cfg.get('bed_exclude_area',[])
if excluded:
    exclusion=Polygon([tuple(map(float,s.split('x'))) for s in excluded])
    assert footprint.disjoint(exclusion)
with zipfile.ZipFile(C/'checked_servo_clamp.gcode.3mf') as z:
    assert z.testzip() is None
    names=[n for n in z.namelist() if n.endswith('.gcode')];assert len(names)==1
    code=z.read(names[0]);assert len(code)>10000
    (C/'plate_1.gcode').write_bytes(code)
    if 'Metadata/plate_1.png' in z.namelist():(C/'slicer_preview.png').write_bytes(z.read('Metadata/plate_1.png'))
log_lines=(R/'prepare.log').read_text().splitlines()+(C/'slice.log').read_text().splitlines()
messages=[s for s in log_lines if any(w in s.lower() for w in ('warning','error','failed'))]
report={'project_sha256':hashlib.sha256(project.read_bytes()).hexdigest(),
        'stl_sha256':v['stl_sha256'],'slicer_version':'02.08.02.61',
        'prepare_exit_code':prepare_code,'slice_exit_code':slice_code,'return_code':result['return_code'],
        'sliced_plates':result['sliced_plates'],'model_instances':1,'bed_and_excluded_zones_checked':True,
        'settings':{k:cfg[k] for k in ['printer_model','printer_settings_id','nozzle_diameter','filament_type',
        'filament_settings_id','curr_bed_type','layer_height','wall_loops','sparse_infill_pattern','sparse_infill_density','enable_support']},
        'project_contains_gcode':False,'check_file_contains_gcode':True,
        'print_seconds_estimate':plate['total_predication'],
        'filament_g_estimate':sum(f['total_used_g'] for f in plate['filaments']),
        'gcode_bytes':len(code),'gcode_sha256':hashlib.sha256(code).hexdigest(),
        'log_messages_to_review':messages,'physical_fit_verified':False}
(R/'slicing_validation.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({k:report[k] for k in ['print_seconds_estimate','filament_g_estimate','log_messages_to_review']},ensure_ascii=False,indent=2))
