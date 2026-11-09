"""Narrow the servo slot without scaling the linkage; mirror one knuckle."""
from pathlib import Path
import json,hashlib,zipfile,shutil
import xml.etree.ElementTree as ET
import numpy as np
import trimesh
from OCP.STEPControl import STEPControl_Reader,STEPControl_Writer,STEPControl_AsIs
from OCP.BRepAlgoAPI import BRepAlgoAPI_Fuse,BRepAlgoAPI_Cut
from OCP.BRepPrimAPI import BRepPrimAPI_MakeBox,BRepPrimAPI_MakeCylinder
from OCP.BRepBuilderAPI import BRepBuilderAPI_Transform
from OCP.BRepCheck import BRepCheck_Analyzer
from OCP.BRepGProp import BRepGProp
from OCP.GProp import GProp_GProps
from OCP.gp import gp_Pnt,gp_Dir,gp_Ax2,gp_Trsf
from OCP.BRepMesh import BRepMesh_IncrementalMesh
from OCP.StlAPI import StlAPI_Writer
from OCP.ShapeUpgrade import ShapeUpgrade_UnifySameDomain
from bambu_profiles import run

R=Path(__file__).resolve().parents[1]
P=R.parent
PARAMS={'slot_width_mm':1.95,'original_slot_width_mm':2.8,'slot_center_x_mm':-14.75,
        'slot_closed_end_z_mm':9.,'stem_y_min_mm':-.5,'stem_y_max_mm':2.5}
if (R/'parameters.json').exists():PARAMS.update(json.loads((R/'parameters.json').read_text()))

def read(path):
    r=STEPControl_Reader();assert int(r.ReadFile(str(path)))==1
    r.TransferRoots();s=r.OneShape();assert BRepCheck_Analyzer(s).IsValid();return s

def volume(shape):
    p=GProp_GProps();BRepGProp.VolumeProperties_s(shape,p);return p.Mass()

def box(x,y,z,dx,dy,dz):return BRepPrimAPI_MakeBox(gp_Pnt(x,y,z),dx,dy,dz).Shape()

def main():
    source=R/'original';source.mkdir(exist_ok=True)
    if not list(source.glob('*.stp')):
        for f in (P/'original').glob('*.stp'):shutil.copy2(f,source/f.name)
    rod=read(next(source.glob('Рулевая*')));knuckle=read(next(source.glob('Поворот*')))
    w=PARAMS['slot_width_mm'];cx=PARAMS['slot_center_x_mm'];top=PARAMS['slot_closed_end_z_mm']
    # Fill only the existing opening and overlap the old walls by 0.10 mm.
    filler=box(cx-1.5,-.5,0,3.,3.,9.05)
    filled=BRepAlgoAPI_Fuse(rod,filler).Shape()
    cut_rect=box(cx-w/2,-1,-1,w,4.,top-w/2+1)
    cut_cap=BRepPrimAPI_MakeCylinder(gp_Ax2(gp_Pnt(cx,-1,top-w/2),gp_Dir(0,1,0)),w/2,4.).Shape()
    narrowed=BRepAlgoAPI_Cut(filled,BRepAlgoAPI_Fuse(cut_rect,cut_cap).Shape()).Shape()
    unify=ShapeUpgrade_UnifySameDomain(narrowed,True,True,True);unify.Build();narrowed=unify.Shape()
    assert BRepCheck_Analyzer(narrowed).IsValid()
    lost=volume(BRepAlgoAPI_Cut(rod,narrowed).Shape());assert abs(lost)<1e-5,lost
    tr=gp_Trsf();tr.SetMirror(gp_Ax2(gp_Pnt(0,0,0),gp_Dir(1,0,0)))
    mirrored=BRepBuilderAPI_Transform(knuckle,tr,True).Shape()
    shapes={'tie_rod_slot_1p95':narrowed,'tie_rod_slot_1p1':read(source/'tie_rod_slot_1p1.step'),'knuckle_original':knuckle,'knuckle_mirrored':mirrored}
    report={'parameters':PARAMS,'original_material_removed_mm3':lost,'original_rod_volume_mm3':volume(rod),
        'rod_volume_added_mm3':volume(narrowed)-volume(rod),'parts':{}}
    for name,shape in shapes.items():
        assert BRepCheck_Analyzer(shape).IsValid()
        writer=STEPControl_Writer();writer.Transfer(shape,STEPControl_AsIs);assert int(writer.Write(str(R/'step'/f'{name}.step')))==1
        mesher=BRepMesh_IncrementalMesh(shape,.008,False,.06,True);mesher.Perform()
        raw=R/'stl'/f'{name}_cad.stl';sw=StlAPI_Writer();sw.ASCIIMode=False;assert sw.Write(shape,str(raw))
        mesh=trimesh.load_mesh(raw)
        if name.startswith('tie'):mesh.apply_transform(trimesh.transformations.rotation_matrix(-np.pi/2,[1,0,0]))
        shift=-mesh.bounds[0];mesh.apply_translation(shift)
        path=R/'stl'/f'{name}.stl';mesh.export(path);mesh=trimesh.load_mesh(path)
        assert mesh.is_watertight and mesh.is_winding_consistent and mesh.volume>0 and len(mesh.split())==1
        assert mesh.nondegenerate_faces().all() and np.allclose(mesh.bounds[0],0,atol=1e-5)
        report['parts'][name]={'bounds_mm':mesh.bounds.tolist(),'volume_mm3':mesh.volume,'step_volume_mm3':volume(shape),
            'shift':shift.tolist(),'watertight':True,'consistent_normals':True,'connected_parts':1,'degenerate_faces':0,
            'faces':len(mesh.faces),'sha256':hashlib.sha256(path.read_bytes()).hexdigest()}
    before=trimesh.load_mesh(source/'baseline_tie_rod_print.stl');after=trimesh.load_mesh(R/'stl/tie_rod_slot_1p95.stl')
    assert np.allclose(before.bounds,after.bounds,atol=.001)
    # Measure the slot directly in sections of the final reloaded STL.
    measured=[];sx=report['parts']['tie_rod_slot_1p95']['shift'][0]
    for z in (.4,1.5,2.3):
        section=after.section(plane_origin=[0,0,z],plane_normal=[0,0,1])
        for height in (1.,4.,7.,8.):
            xs=[]
            for poly in section.discrete:
                for a,b in zip(poly,poly[1:]):
                    if min(a[1],b[1])<=height<max(a[1],b[1]):
                        x=a[0]+(b[0]-a[0])*(height-a[1])/(b[1]-a[1])
                        if abs(x-(cx+sx))<1:xs.append(x)
            xs=np.unique(np.round(xs,5));assert len(xs)==2,(z,height,xs)
            width=float(xs[1]-xs[0]);assert abs(width-w)<.001
            measured.append({'print_z_mm':z,'distance_from_slot_mouth_mm':height,'slot_width_mm':width})
    report['slot_section_checks']=measured
    report['rod_length_mm']=float(after.extents[0]);report['eye_center_spacing_mm']=43.5
    assert abs(volume(knuckle)-volume(mirrored))<1e-6
    (R/'geometry_validation.json').write_text(json.dumps(report,indent=2))
    (R/'parameters.json').write_text(json.dumps(PARAMS,indent=2))

    process=json.loads((R/'presets/base_012.json').read_text())
    process.update(name='LDRC slots 1.1 and 1.95 mm + knuckle pair @P1S',print_settings_id='LDRC slots 1.1 and 1.95 mm + knuckle pair @P1S',
        initial_layer_print_height='0.32',enable_support='1')
    pf=R/'presets/steering_012.json';pf.write_text(json.dumps(process,indent=2))
    run(['--load-settings',f'{R}/presets/p1s_04.json;{pf}','--load-filaments',str(R/'presets/generic_pla.json'),
        '--orient','0','--arrange','1','--outputdir',str(R/'check'),'--export-3mf','arranged.3mf',
        *[str(R/'stl'/f'{n}.stl') for n in shapes]],R/'check',R/'check/prepare.log')
    # Object-level support override protects the narrow servo slot from support material.
    with zipfile.ZipFile(R/'check/arranged.3mf') as z:files={n:z.read(n) for n in z.namelist()}
    ms=ET.fromstring(files['Metadata/model_settings.config'])
    for obj in ms.findall('object'):
        name=next(m.get('value') for m in obj.findall('metadata') if m.get('key')=='name')
        ET.SubElement(obj,'metadata',key='enable_support',value='0' if name.startswith('tie_rod') else '1')
        if name.startswith('tie_rod'):
            ET.SubElement(obj,'metadata',key='brim_type',value='no_brim')
            ET.SubElement(obj,'metadata',key='brim_width',value='0')
    files['Metadata/model_settings.config']=ET.tostring(ms,encoding='utf-8',xml_declaration=True)
    # Keep a readable symmetric layout, with clearance for supports and brims.
    core='http://schemas.microsoft.com/3dmanufacturing/core/2015/02'
    ET.register_namespace('',core)
    ET.register_namespace('p','http://schemas.microsoft.com/3dmanufacturing/production/2015/06')
    model=ET.fromstring(files['3D/3dmodel.model'])
    positions=[(103,166),(103,145),(100,108),(136,108)]
    for item,(x,y) in zip(model.findall('{*}build/{*}item'),positions):
        item.set('transform',f'1 0 0 0 1 0 0 0 1 {x} {y} 0')
    files['3D/3dmodel.model']=ET.tostring(model,encoding='utf-8',xml_declaration=True)
    project=R/'P1S_LDRC_slots_1p1_1p95_pair.3mf'
    with zipfile.ZipFile(R/'check/positioned.3mf','w',zipfile.ZIP_DEFLATED) as z:
        for n,data in files.items():
            if not n.endswith('.png'):z.writestr(n,data)
    run(['--orient','0','--arrange','0','--outputdir',str(R),'--export-3mf',project.name,
        str(R/'check/positioned.3mf')],R/'check',R/'check/export.log')
    with zipfile.ZipFile(project) as z:
        assert z.testzip() is None
        cfg=json.loads(z.read('Metadata/project_settings.config'))
        assert cfg['printer_model']=='Bambu Lab P1S' and cfg['nozzle_diameter']==['0.4'] and cfg['filament_type']==['PLA']
        assert cfg['printer_settings_id']=='Bambu Lab P1S 0.4 nozzle' and cfg['filament_settings_id']==['Generic PLA']
        assert cfg['curr_bed_type']=='Textured PEI Plate' and cfg['initial_layer_print_height']=='0.32'
        assert len(ms.findall('plate'))==1 and len(ms.findall('plate/model_instance'))==4
        assert len(ET.fromstring(z.read('3D/3dmodel.model')).findall('{*}build/{*}item'))==4
    run(['--orient','0','--arrange','0','--slice','0','--outputdir',str(R/'check'),
        '--export-3mf','P1S_LDRC_slots_1p1_1p95_pair.gcode.3mf',str(project)],R/'check',R/'check/slice.log')
    result=json.loads((R/'check/result.json').read_text())
    assert result['return_code']==0 and len(result['sliced_plates'])==1
    plate=result['sliced_plates'][0];assert len(plate['objects'])==4 and plate['warning_message']==''
    for obj in plate['objects']:
        b=obj['bbox'];assert b['x']>20 and b['y']>20 and b['x']+b['width']<236 and b['y']+b['depth']<236 and abs(b['z'])<.001
    result['project_sha256']=hashlib.sha256(project.read_bytes()).hexdigest()
    with zipfile.ZipFile(R/'check/P1S_LDRC_slots_1p1_1p95_pair.gcode.3mf') as z:
        assert z.testzip() is None
        g=[n for n in z.namelist() if n.endswith('.gcode')];assert len(g)==1
        (R/'check/plate_1.gcode').write_bytes(z.read(g[0]));assert len(z.read(g[0]))>10000
    (R/'slicing_validation.json').write_text(json.dumps(result,indent=2))
    print(json.dumps(plate,indent=2),flush=True)

if __name__=='__main__':main()
