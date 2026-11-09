"""Build editable P1S projects, then reload and slice those exact files."""
from pathlib import Path
import json, subprocess, zipfile, xml.etree.ElementTree as ET

ROOT=Path(__file__).resolve().parents[1]
PROFILES=Path('/Applications/BambuStudio.app/Contents/Resources/profiles/BBL')
APP='/Applications/BambuStudio.app/Contents/MacOS/BambuStudio'

def resolved(category,name,trail=()):
    assert name not in trail
    files=list((PROFILES/category).rglob(name+'.json'))
    assert len(files)==1,(name,files)
    src=json.loads(files[0].read_text())
    out=resolved(category,src['inherits'],trail+(name,)) if src.get('inherits') else {}
    for inc in src.get('include',[]): out.update(resolved(category,inc,trail+(name,)))
    out.update(src); out.pop('include',None); out['inherits']=''
    return out

def run(args,cwd,log):
    with log.open('w') as f:
        result=subprocess.run([APP,*args],cwd=cwd,stdout=f,stderr=subprocess.STDOUT)
    assert result.returncode==0, (result.returncode,str(log))

def main():
    presets=ROOT/'presets'; presets.mkdir(exist_ok=True)
    machine=resolved('machine','Bambu Lab P1S 0.4 nozzle')
    machine.update(printer_settings_id=machine['name'],curr_bed_type='Textured PEI Plate')
    process=resolved('process','0.16mm Optimal @BBL X1C')
    process.update({'name':'0.16mm Tactile Earth @P1S','print_settings_id':'0.16mm Tactile Earth @P1S',
        'from':'user','wall_loops':'3','top_shell_layers':'6','bottom_shell_layers':'5',
        'sparse_infill_density':'100%','sparse_infill_pattern':'zig-zag',
        'enable_support':'1','support_type':'tree(auto)','support_threshold_angle':'30',
        'support_on_build_plate_only':'1','support_top_z_distance':'0.2',
        'brim_type':'no_brim','brim_width':'0','seam_position':'back',
        'outer_wall_speed':['60','60'],'inner_wall_speed':['150','150'],
        'initial_layer_speed':['30','30'],'initial_layer_infill_speed':['60','60'],
        'elefant_foot_compensation':'0.15','curr_bed_type':'Textured PEI Plate',
        'print_sequence':'by layer'})
    for k in ['sparse_infill_pattern','internal_solid_infill_pattern']:
        if process.get(k)=='rectilinear':process[k]='zig-zag'
    filament=resolved('filament','Generic PLA')
    filament.update(filament_settings_id=['Generic PLA'],filament_colour=['#FFFFFF'])
    for name,obj in [('p1s_04',machine),('earth_016',process),('generic_pla',filament)]:
        (presets/(name+'.json')).write_text(json.dumps(obj,indent=2)+'\n')
    results={}
    for name in ['globe','base','fit_ring','light_test']:
        process['enable_support']='1' if name in ['globe','base'] else '0'
        process['support_on_build_plate_only']='0' if name=='base' else '1'
        process_file=presets/f'earth_{name}_016.json'
        process_file.write_text(json.dumps(process,indent=2)+'\n')
        check=ROOT/('check_'+name);check.mkdir(exist_ok=True)
        project=ROOT/f'P1S_Earth_{name}.3mf'
        print('Preparing',name,flush=True)
        run(['--load-settings',str(presets/'p1s_04.json')+';'+str(process_file),
             '--load-filaments',str(presets/'generic_pla.json'),'--orient','0','--arrange','1',
             '--outputdir',str(ROOT),'--export-3mf',project.name,str(ROOT/f'earth_{name}.stl')],
             check,check/'prepare.log')
        with zipfile.ZipFile(project) as z:
            assert z.testzip() is None
            config=json.loads(z.read('Metadata/project_settings.config'))
            ms=ET.fromstring(z.read('Metadata/model_settings.config'))
            assert ms.findall('.//plate/model_instance')
            ns={'m':'http://schemas.microsoft.com/3dmanufacturing/core/2015/02'}
            model=ET.fromstring(z.read('3D/3dmodel.model'))
            assert model.findall('m:build/m:item',ns)
            for key,value in {'printer_model':'Bambu Lab P1S','printer_settings_id':'Bambu Lab P1S 0.4 nozzle',
                              'curr_bed_type':'Textured PEI Plate','enable_support':process['enable_support']}.items():
                assert config[key]==value,(key,config[key])
            assert config['nozzle_diameter']==['0.4']
            assert config['filament_type']==['PLA']
            assert config['filament_settings_id']==['Generic PLA']
        print('Reloading and slicing',name,flush=True)
        run(['--orient','0','--arrange','0','--slice','0','--mtcpp','3000000','--outputdir',str(check),
             '--export-3mf',f'checked_{name}.gcode.3mf',str(project)],check,check/'slice.log')
        result=json.loads((check/'result.json').read_text())
        assert result['return_code']==0 and result['sliced_plates']
        plates=result['sliced_plates']; assert len(plates)==1 and len(plates[0]['objects'])==1
        b=plates[0]['objects'][0]['bbox']
        assert b['x']>18 and b['y']>18 and b['x']+b['width']<256 and b['y']+b['depth']<256
        assert abs(b['z'])<.001 and b['height']<256
        with zipfile.ZipFile(check/f'checked_{name}.gcode.3mf') as z:
            g=[n for n in z.namelist() if n.endswith('.gcode')]
            assert g and z.getinfo(g[0]).file_size>10000
        results[name]=result
        (ROOT/'slicing_validation.json').write_text(json.dumps(results,indent=2)+'\n')
        print(name,'DONE',plates[0]['warning_message'],plates[0]['total_predication'],flush=True)

if __name__=='__main__': main()
