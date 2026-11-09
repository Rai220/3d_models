"""Derive a seven-part mechanical trial from the validated full project."""
from pathlib import Path
import copy,hashlib,json,re,subprocess,zipfile
import xml.etree.ElementTree as ET
import numpy as np
import trimesh
R=Path(__file__).resolve().parent
CLI='/Applications/BambuStudio.app/Contents/MacOS/BambuStudio'
N={'m':'http://schemas.microsoft.com/3dmanufacturing/core/2015/02'}
ET.register_namespace('',N['m'])
ET.register_namespace('p','http://schemas.microsoft.com/3dmanufacturing/production/2015/06')
ET.register_namespace('BambuStudio','http://schemas.bambulab.com/package/2021')
full=json.loads((R/'validation.json').read_text())
assert hashlib.sha256((R/full['project_file']).read_bytes()).hexdigest()==full['project_sha256']
selected={'crossrail_2','axle_saddle_2','fit_rail_1','fit_slider_1','wheel_unit_3','bearing_washer_3','foot_3'}
with zipfile.ZipFile(R/full['project_file']) as z:files={n:z.read(n) for n in z.namelist()}
model=ET.fromstring(files['Metadata/model_settings.config']);core=ET.fromstring(files['3D/3dmodel.model'])
get=lambda o,k:o.find(f"metadata[@key='{k}']").get('value')
ids={o.get('id') for o in model.findall('object') if get(o,'name') in selected}
for o in list(model.findall('object')):
    if o.get('id') not in ids:model.remove(o)
build=core.find('m:build',N)
for item in list(build):
    if item.get('objectid') not in ids:build.remove(item);continue
    t=list(map(float,item.get('transform').split()));t[9]-=307.2;item.set('transform',' '.join(map(str,t)))
plate=copy.deepcopy(model.findall('plate')[1])
for p in model.findall('plate'):model.remove(p)
for inst in list(plate.findall('model_instance')):
    if get(inst,'object_id') not in ids:plate.remove(inst)
plate.find("metadata[@key='plater_id']").set('value','1')
plate.find("metadata[@key='plater_name']").set('value','Mechanical trial / M3x10 M3x16')
for k in ('gcode_file','thumbnail_file','thumbnail_no_light_file','top_file','pick_file'):
    el=plate.find(f"metadata[@key='{k}']")
    if el is not None:el.set('value','')
model.append(plate)
# Assembly metadata is regenerated from the build placements by Bambu export.
for a in model.findall('assemble'):model.remove(a)
files['Metadata/model_settings.config']=ET.tostring(model,encoding='utf-8',xml_declaration=True)
files['3D/3dmodel.model']=ET.tostring(core,encoding='utf-8',xml_declaration=True)
source=R/'trial_input.3mf'
with zipfile.ZipFile(source,'w',zipfile.ZIP_DEFLATED) as z:
    for n,d in files.items():
        if not n.endswith('.png'):z.writestr(n,d)

def run(args,log):
    with (R/log).open('w') as f:p=subprocess.run([CLI,'--debug','2']+args,cwd=R,stdout=f,stderr=subprocess.STDOUT)
    assert p.returncode==0 and '[error]' not in (R/log).read_text().lower(),(p.returncode,log)
project=R/'P1S_mechanical_trial.3mf';sliced=R/'trial_checked.gcode.3mf'
run(['--orient','0','--arrange','0','--outputdir',str(R),'--export-3mf',project.name,str(source)],'trial_export.log')
with zipfile.ZipFile(project) as z:
    assert z.testzip() is None
    m=ET.fromstring(z.read('Metadata/model_settings.config'));c=ET.fromstring(z.read('3D/3dmodel.model'))
    assert len(m.findall('plate'))==1 and len(m.findall('plate/model_instance'))==7
    assert len(c.findall('m:build/m:item',N))==7
    settings=json.loads(z.read('Metadata/project_settings.config'))
    for k,val in full['saved_settings'].items():assert settings[k]==val
scene=trimesh.load_scene(project);assert len(scene.graph.nodes_geometry)==7
for node in scene.graph.nodes_geometry:
    T,key=scene.graph[node];m=scene.geometry[key].copy();m.apply_transform(T)
    assert m.bounds[0,:2].min()>=30 and m.bounds[1,:2].max()<=226 and abs(m.bounds[0,2])<.001
    assert any(np.allclose(m.bounds,full['layout'][n]['actual_bounds_mm'],atol=.001) for n in selected)
run(['--slice','0','--orient','0','--arrange','0','--outputdir',str(R),'--export-3mf',sliced.name,str(project)],'trial_slice.log')
result=json.loads((R/'result.json').read_text());assert result['return_code']==0 and len(result['sliced_plates'])==1
p=result['sliced_plates'][0];assert not p['warning_message'] and {o['name'] for o in p['objects']}==selected
for o in p['objects']:
    b=o['bbox'];bounds=[[b['x'],b['y'],b['z']],[b['x']+b['width'],b['y']+b['depth'],b['z']+b['height']]]
    assert np.allclose(bounds,full['layout'][o['name']]['actual_bounds_mm'],atol=.05)
with zipfile.ZipFile(sliced) as z:
    assert z.testzip() is None
    codes=[n for n in z.namelist() if n.endswith('.gcode')];assert len(codes)==1
    g=z.read(codes[0]).decode();assert len(g)>10000 and 'G28' in g
    assert not any('support' in s.lower() for s in re.findall('^; FEATURE: (.+)$',g,re.M))
report={'project_file':project.name,'project_sha256':hashlib.sha256(project.read_bytes()).hexdigest(),
 'sliced_file':sliced.name,'sliced_sha256':hashlib.sha256(sliced.read_bytes()).hexdigest(),
 'reopened_and_sliced':True,'return_code':result['return_code'],'warning_message':p['warning_message'],
 'objects':sorted(selected),'saved_settings':full['saved_settings'],
 'estimated_filament_g':round(sum(f['total_used_g'] for f in p['filaments']),2),
 'estimated_seconds':round(p['total_predication']),'physical_fit_verified':False}
(R/'trial_validation.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
(R/'result.json').replace(R/'trial_slice_result.json')
for n in ('trial_input.3mf','plate_1.gcode'):(R/n).unlink(missing_ok=True)
print(json.dumps(report,ensure_ascii=False,indent=2))
