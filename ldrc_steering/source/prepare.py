"""Retessellate original STEP models and prepare/reload P1S print projects."""
from pathlib import Path
import json, sys, hashlib, zipfile, shutil
import numpy as np
import trimesh
from OCP.STEPControl import STEPControl_Reader
from OCP.BRepCheck import BRepCheck_Analyzer
from OCP.BRepMesh import BRepMesh_IncrementalMesh
from OCP.StlAPI import StlAPI_Writer
from OCP.GProp import GProp_GProps
from OCP.BRepGProp import BRepGProp
from OCP.TopAbs import TopAbs_SOLID
from OCP.TopExp import TopExp_Explorer
import xml.etree.ElementTree as ET

R=Path(__file__).resolve().parents[1]
from bambu_profiles import resolved, run

def main():
    reports={}
    for name,pattern in [('tie_rod','Рулевая*'),('knuckle','Поворот*')]:
        step=next((R/'original').glob(pattern))
        reader=STEPControl_Reader();assert int(reader.ReadFile(str(step)))==1
        reader.TransferRoots();shape=reader.OneShape()
        assert BRepCheck_Analyzer(shape).IsValid()
        solids=TopExp_Explorer(shape,TopAbs_SOLID);count=0
        while solids.More():count+=1;solids.Next()
        assert count==1
        props=GProp_GProps();BRepGProp.VolumeProperties_s(shape,props)
        raw=R/'stl'/f'{name}_cad.stl'
        mesher=BRepMesh_IncrementalMesh(shape,.008,False,.06,True);mesher.Perform()
        writer=StlAPI_Writer();writer.ASCIIMode=False;assert writer.Write(shape,str(raw))
        mesh=trimesh.load_mesh(raw)
        if name=='tie_rod':mesh.apply_transform(trimesh.transformations.rotation_matrix(-np.pi/2,[1,0,0]))
        shift=-mesh.bounds[0];mesh.apply_translation(shift)
        path=R/'stl'/f'{name}_print.stl';mesh.export(path)
        mesh=trimesh.load_mesh(path)
        assert mesh.is_watertight and mesh.is_winding_consistent and mesh.volume>0
        assert len(mesh.split())==1 and mesh.nondegenerate_faces().all()
        assert np.allclose(mesh.bounds[0],0,atol=1e-5)
        reports[name]={'step':step.name,'step_volume_mm3':props.Mass(),
            'stl_volume_mm3':mesh.volume,'bounds_mm':mesh.bounds.tolist(),
            'faces':len(mesh.faces),'watertight':True,'consistent_normals':True,
            'connected_components':1,'degenerate_faces':0,'shift_after_rotation':shift.tolist(),
            'stl_sha256':hashlib.sha256(path.read_bytes()).hexdigest()}
    (R/'geometry_validation.json').write_text(json.dumps(reports,indent=2,ensure_ascii=False))
    machine=resolved('machine','Bambu Lab P1S 0.4 nozzle')
    machine.update(printer_settings_id=machine['name'],curr_bed_type='Textured PEI Plate')
    process=resolved('process','0.12mm Fine @BBL X1C')
    process.update({'name':'0.12mm LDRC steering @P1S','print_settings_id':'0.12mm LDRC steering @P1S',
        'from':'user','wall_loops':'4','top_shell_layers':'6','bottom_shell_layers':'6',
        'sparse_infill_density':'30%','sparse_infill_pattern':'gyroid','wall_generator':'arachne',
        'support_type':'normal(auto)','support_threshold_angle':'30','support_on_build_plate_only':'1',
        'support_top_z_distance':'0.2','support_bottom_z_distance':'0.2','support_object_xy_distance':'0.35',
        'support_interface_top_layers':'3','brim_type':'outer_only','brim_width':'3','brim_object_gap':'0.1',
        'outer_wall_speed':['30','30'],'inner_wall_speed':['60','60'],'bridge_speed':['20','20'],
        'top_surface_speed':['30','30'],'initial_layer_speed':['20','20'],
        'initial_layer_infill_speed':['30','30'],'elefant_foot_compensation':'0.15',
        'curr_bed_type':'Textured PEI Plate','print_sequence':'by layer'})
    for k in ('sparse_infill_pattern','internal_solid_infill_pattern'):
        if process.get(k)=='rectilinear':process[k]='zig-zag'
    filament=resolved('filament','Generic PLA')
    filament.update(filament_settings_id=['Generic PLA'],filament_colour=['#F0A040'])
    presets=R/'presets'
    for name,data in [('p1s_04',machine),('generic_pla',filament)]:
        (presets/f'{name}.json').write_text(json.dumps(data,indent=2))
    results={}
    for name in reports:
        check=R/f'check_{name}';check.mkdir(exist_ok=True)
        process['enable_support']='1' if name=='knuckle' else '0'
        process['initial_layer_print_height']='0.32' if name=='knuckle' else '0.2'
        pf=presets/f'{name}_012.json';pf.write_text(json.dumps(process,indent=2))
        project=R/f'P1S_LDRC_{name}.3mf'
        print('Preparing',name,flush=True)
        run(['--load-settings',f'{presets}/p1s_04.json;{pf}',
             '--load-filaments',str(presets/'generic_pla.json'),'--orient','0','--arrange','1',
             '--outputdir',str(R),'--export-3mf',project.name,str(R/'stl'/f'{name}_print.stl')],check,check/'prepare.log')
        with zipfile.ZipFile(project) as z:
            assert z.testzip() is None
            cfg=json.loads(z.read('Metadata/project_settings.config'))
            ms=ET.fromstring(z.read('Metadata/model_settings.config'))
            assert len(ms.findall('.//plate/model_instance'))==1
            model=ET.fromstring(z.read('3D/3dmodel.model'))
            assert len(model.findall('{*}build/{*}item'))==1
            for k,v in {'printer_model':'Bambu Lab P1S','printer_settings_id':'Bambu Lab P1S 0.4 nozzle',
                'nozzle_diameter':['0.4'],'filament_type':['PLA'],'filament_settings_id':['Generic PLA'],
                'curr_bed_type':'Textured PEI Plate','enable_support':process['enable_support']}.items():
                assert cfg[k]==v,(k,cfg[k],v)
        print('Reload and slice',name,flush=True)
        run(['--orient','0','--arrange','0','--slice','0','--outputdir',str(check),
             '--export-3mf',f'P1S_LDRC_{name}.gcode.3mf',str(project)],check,check/'slice.log')
        result=json.loads((check/'result.json').read_text())
        assert result['return_code']==0 and len(result['sliced_plates'])==1
        plate=result['sliced_plates'][0];assert len(plate['objects'])==1
        b=plate['objects'][0]['bbox'];assert b['x']>20 and b['y']>20 and b['x']+b['width']<236 and b['y']+b['depth']<236
        assert abs(b['z'])<.001 and b['height']<256
        with zipfile.ZipFile(check/f'P1S_LDRC_{name}.gcode.3mf') as z:
            g=[n for n in z.namelist() if n.endswith('.gcode')];assert len(g)==1
            assert z.getinfo(g[0]).file_size>10000
            (check/'plate_1.gcode').write_bytes(z.read(g[0]))
        result['project_sha256']=hashlib.sha256(project.read_bytes()).hexdigest()
        results[name]=result
        (R/'slicing_validation.json').write_text(json.dumps(results,indent=2))
        print(name,'DONE',plate,flush=True)

if __name__=='__main__':main()
