"""Prepare redesigned M3 countersunk 1:28 parts on two inset plates.

Uses the full P1S/PLA profiles already resolved from the installed Bambu version.
Builds plate bindings with --arrange 1, then sets the requested manual layout.
No geometry scaling or reorientation out of the XY plane. All dimensions in mm.
"""
from pathlib import Path
from collections import Counter
import copy, hashlib, json, math, re, subprocess, zipfile
import xml.etree.ElementTree as ET
import numpy as np
import trimesh
from shapely.geometry import Polygon, MultiPoint
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import Polygon as PatchPolygon, Rectangle
from cad_helpers import write_3mf

ROOT=Path(__file__).resolve().parent
OUT=ROOT
WORK=ROOT
CLI='/Applications/BambuStudio.app/Contents/MacOS/BambuStudio'
NS={'m':'http://schemas.microsoft.com/3dmanufacturing/core/2015/02'}
PNS='http://schemas.microsoft.com/3dmanufacturing/production/2015/06'
ET.register_namespace('',NS['m']);ET.register_namespace('p',PNS)
ET.register_namespace('BambuStudio','http://schemas.bambulab.com/package/2021')
BASE=json.loads((ROOT/'geometry_validation.json').read_text())
PRE=ROOT
# Two 256 mm beds separated by the Bambu logical plate gap of 1/5 bed width.
# Source: https://github.com/bambulab/BambuStudio/blob/master/src/slic3r/GUI/PartPlate.cpp
# compute_shape_position(), plate_stride_x(). Final behavior is checked by CLI.
STRIDE=307.2

def run(args,log):
    with (WORK/log).open('w') as f:
        p=subprocess.run([CLI,'--debug','2']+args,cwd=WORK,stdout=f,stderr=subprocess.STDOUT)
    assert p.returncode==0,(p.returncode,log,(WORK/log).read_text()[-2500:])
    assert '[error]' not in (WORK/log).read_text().lower(),(log,(WORK/log).read_text())
    return p.returncode

def hashfile(p):return hashlib.sha256(p.read_bytes()).hexdigest()

def metadata(node,key):return node.find(f"metadata[@key='{key}']").get('value')

def setmeta(node,key,value):
    el=node.find(f"metadata[@key='{key}']")
    if el is None:el=ET.SubElement(node,'metadata',{'key':key})
    el.set('value',str(value))

def polygon(values):return Polygon([tuple(map(float,v.split('x'))) for v in values])

# Manual layout: 12 parts on each plate, >=30 mm bed margin.
layout={}
for j in (1,2):
    common=[(f'crossrail_{j}',48,31,0),
            (f'wheel_carriage_left_{j}',31,90,0),
            (f'wheel_carriage_right_{j}',146,90,0),
            (f'wheel_unit_{2*j-1}',31,130,90),
            (f'wheel_unit_{2*j}',165,130,90),
            (f'foot_{2*j-1}',108,171,0),(f'foot_{2*j}',136,171,0),
            (f'bearing_washer_{2*j-1}',44,201,0),
            (f'bearing_washer_{2*j}',188,201,0),
            (f'axle_saddle_{j}',113,130,0)]
    extras=([('spine_1',38,59,0),('zero_block_1',98,201,0)] if j==1 else
            [('fit_rail_1',40,59,0),('fit_slider_1',104,53,0)])
    for n,x,y,a in common+extras:layout[n]={'plate':j,'min_xy':[x,y],'angle_deg':a}

quantities=dict(BASE['quantities']);quantities.update(fit_rail=1,fit_slider=1)
assert set(layout)=={f'{n}_{i+1}' for n,q in quantities.items() for i in range(q)}
meshes={n:trimesh.load_mesh(ROOT/f'{n}.stl') for n in quantities}
for n,m in meshes.items():
    assert hashfile(ROOT/f'{n}.stl')==BASE['parts'][n]['sha256']
    assert m.is_watertight and m.is_winding_consistent and m.volume>0
    assert len(m.split())==1 and np.all(m.nondegenerate_faces()) and abs(m.bounds[0,2])<1e-5
entries=[]
for i,n in enumerate(layout):
    part=n.rsplit('_',1)[0]
    entries.append((meshes[part],n,(20+42*(i%5),20+42*(i//5),0)))
write_3mf(None,'1:28 countersunk M3x10 M3x16 / two plates',WORK/'input_geometry.3mf',entries)
run(['--load-settings',str(PRE/'printer_profile.json')+';'+str(PRE/'print_profile.json'),
     '--load-filaments',str(PRE/'filament_profile.json'),'--orient','0','--arrange','1',
     '--outputdir',str(WORK),'--export-3mf','bound.3mf',str(WORK/'input_geometry.3mf')],'initialize.log')
with zipfile.ZipFile(WORK/'bound.3mf') as z:files={n:z.read(n) for n in z.namelist()}
core=ET.fromstring(files['3D/3dmodel.model'])
model=ET.fromstring(files['Metadata/model_settings.config'])
names={o.get('id'):metadata(o,'name') for o in model.findall('object')}
objects={o.get('id'):o for o in core.findall('m:resources/m:object',NS)}
template=copy.deepcopy(model.find('plate'))
for plate in model.findall('plate'):model.remove(plate)
plates=[]
for index in (1,2):
    plate=copy.deepcopy(template)
    for obj in plate.findall('model_instance'):plate.remove(obj)
    setmeta(plate,'plater_id',index)
    setmeta(plate,'plater_name',f'1:28 M3 CS / {index} / 30 mm edge clearance')
    for k in ('gcode_file','thumbnail_file','thumbnail_no_light_file','top_file','pick_file'):setmeta(plate,k,'')
    model.append(plate);plates.append(plate)
for index,item in enumerate(core.findall('m:build/m:item',NS)):
    oid=item.get('objectid');name=names[oid];rec=layout[name]
    component=objects[oid].find('m:components/m:component',NS)
    resource=ET.fromstring(files[component.get('{'+PNS+'}path').lstrip('/')])
    verts=np.array([[float(v.get(k)) for k in ('x','y','z')] for v in resource.findall('.//m:vertex',NS)])
    a=math.radians(rec['angle_deg']);c,s=math.cos(a),math.sin(a)
    R=np.array([[c,-s,0],[s,c,0],[0,0,1]])
    vrot=np.einsum('ij,kj->ki',R,verts)
    assert np.isfinite(vrot).all()
    origin=np.array([(rec['plate']-1)*STRIDE,0,0])
    t=np.array(rec['min_xy']+[0])-vrot.min(0)+origin
    T=np.column_stack([R,t]);item.set('transform',' '.join(f'{x:.9f}' for x in T.T.ravel()))
    instance=ET.SubElement(plates[rec['plate']-1],'model_instance')
    for k,value in [('object_id',oid),('instance_id',0),('identify_id',4*(index+1))]:setmeta(instance,k,value)
files['3D/3dmodel.model']=ET.tostring(core,encoding='utf-8',xml_declaration=True)
files['Metadata/model_settings.config']=ET.tostring(model,encoding='utf-8',xml_declaration=True)
with zipfile.ZipFile(WORK/'positioned.3mf','w',zipfile.ZIP_DEFLATED) as z:
    for n,data in files.items():
        if not n.endswith('.png'):z.writestr(n,data)
project=OUT/'P1S_toe_M3x10_M3x16.3mf'
run(['--orient','0','--arrange','0','--outputdir',str(OUT),'--export-3mf',project.name,str(WORK/'positioned.3mf')],'export.log')

# Validate the exact final project before reopening it for slicing.
with zipfile.ZipFile(project) as z:
    assert z.testzip() is None
    s=json.loads(z.read('Metadata/project_settings.config'))
    expected={'printer_model':'Bambu Lab P1S','printer_settings_id':'Bambu Lab P1S 0.4 nozzle',
              'nozzle_diameter':['0.4'],'filament_type':['PLA'],'filament_settings_id':['Generic PLA'],
              'curr_bed_type':'Textured PEI Plate','wall_loops':'4','sparse_infill_density':'20%',
              'sparse_infill_pattern':'gyroid','enable_support':'0','detect_floating_vertical_shell':'0',
              'wall_generator':'classic','detect_thin_wall':'1','initial_layer_line_width':'0.42',
              'elefant_foot_compensation':'0'}
    for k,value in expected.items():assert s[k]==value,(k,s[k],value)
    model=ET.fromstring(z.read('Metadata/model_settings.config'))
    assert len(model.findall('plate'))==2
    assert sorted(len(p.findall('model_instance')) for p in model.findall('plate'))==[12,12]
    assert len(ET.fromstring(z.read('3D/3dmodel.model')).findall('m:build/m:item',NS))==24
    for stat in model.findall('.//mesh_stat'):
        assert all(int(stat.get(k,'0'))==0 for k in ['edges_fixed','degenerate_facets','facets_removed','facets_reversed','backwards_edges'])
scene=trimesh.load_scene(project)
bed=polygon(s['printable_area']);excluded=polygon(s['bed_exclude_area'])
groups={1:[],2:[]};boxes={1:[],2:[]};raw_dims=[]
fig,axes=plt.subplots(1,2,figsize=(13,7),facecolor='#f3f0e9')
for node in scene.graph.nodes_geometry:
    T,key=scene.graph[node];m=scene.geometry[key].copy();raw_dims.append(sorted(m.extents))
    assert np.allclose(T[:3,:3].T@T[:3,:3],np.eye(3),atol=1e-6) and np.linalg.det(T[:3,:3])>.99999
    m.apply_transform(T)
    plate=1 if m.bounds.mean(0)[0]<256 else 2
    m.apply_translation([-(plate-1)*STRIDE,0,0])
    fp=MultiPoint(m.vertices[:,:2]).convex_hull
    assert bed.buffer(-30).covers(fp),(plate,node,m.bounds)
    assert fp.intersection(excluded).area<1e-6
    assert abs(m.bounds[0,2])<.001 and m.bounds[1,2]<float(s['printable_height'])
    groups[plate].append(fp);boxes[plate].append(m.bounds)
    axes[plate-1].add_patch(PatchPolygon(np.asarray(fp.exterior.coords),facecolor='#087f8c',edgecolor='#274550',alpha=.8))
    rawname=next((n for n,r in layout.items() if r['plate']==plate and np.allclose(m.bounds[0,:2],r['min_xy'],atol=.001)),None)
    assert rawname,(plate,node,m.bounds)
    layout[rawname]['actual_bounds_mm']=m.bounds.round(5).tolist()
for a,e in zip(sorted(raw_dims),sorted(sorted(meshes[n].extents) for n,q in quantities.items() for _ in range(q))):assert np.allclose(a,e,atol=.001)
report={'project_file':project.name,'project_sha256':hashfile(project),'geometry_changed':True,'revision':'M3x10/M3x16 countersunk; 1:28',
        'included_fit_coupon':True,'minimum_requested_edge_clearance_mm':30,'saved_settings':expected,
        'layout':layout,'plates':{},'bambu_studio_slicing_verified':False}
for plate,fp in groups.items():
    assert len(fp)==12
    gap=min(a.distance(b) for i,a in enumerate(fp) for b in fp[i+1:])
    assert gap>=4.99,(plate,gap)
    edge=min(p.distance(bed.boundary) for p in fp)
    b=np.array(boxes[plate]);bb=[b[:,0,:].min(0).tolist(),b[:,1,:].max(0).tolist()]
    report['plates'][plate]={'objects':len(fp),'minimum_part_spacing_mm':gap,
                            'minimum_edge_clearance_mm':edge,'bounds_mm':bb}
    ax=axes[plate-1];ax.add_patch(Rectangle((0,0),256,256,fill=False,lw=2,color='#243d47'))
    ax.add_patch(Rectangle((30,30),196,196,fill=False,lw=1.2,ls='--',color='#a3712c'))
    ax.set(xlim=(-4,260),ylim=(-4,260),aspect='equal',xlabel='X, мм',ylabel='Y, мм')
    ax.set_title(f'Пластина {plate} · {len(fp)} деталей\nМинимальный отступ {edge:.0f} мм',fontsize=14)
fig.suptitle('Комплект и пробник на двух пластинах P1S',fontsize=20)
fig.text(.5,.035,'Пунктир: зона с отступом 30 мм. Цветом показаны габариты деталей в сохранённом 3MF.',ha='center',fontsize=11)
fig.tight_layout(rect=(0,.12,1,.93));fig.savefig(OUT/'layout_envelopes.png',dpi=165);plt.close(fig)
(OUT/'validation.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')

print('Reopening and slicing final TWO-PLATE project',flush=True)
code=run(['--slice','0','--orient','0','--arrange','0','--outputdir',str(WORK),
          '--export-3mf','checked_2plates.gcode.3mf',str(project)],'slice.log')
result=json.loads((WORK/'result.json').read_text())
assert result['return_code']==0 and len(result['sliced_plates'])==2,result
with zipfile.ZipFile(WORK/'checked_2plates.gcode.3mf') as z:
    assert z.testzip() is None
    gcodes=[n for n in z.namelist() if n.endswith('.gcode')];assert len(gcodes)==2
    for r in result['sliced_plates']:
        names={o['name'] for o in r['objects']}
        plate=next(i for i in (1,2) if names=={n for n,v in layout.items() if v['plate']==i})
        assert not r['warning_message'],r['warning_message']
        for obj in r['objects']:
            b=obj['bbox'];wanted=np.array(layout[obj['name']]['actual_bounds_mm'])
            measured=np.array([[b['x'],b['y'],b['z']],[b['x']+b['width'],b['y']+b['depth'],b['z']+b['height']]])
            # CLI object boxes remain in the global multi-plate workspace.
            measured[:,0]-=(plate-1)*STRIDE
            assert np.allclose(measured,wanted,atol=.05),(obj['name'],measured,wanted)
        name=next(n for n in gcodes if n.endswith(f'plate_{plate}.gcode'))
        g=z.read(name).decode();assert len(g)>10000 and 'G28' in g
        features=Counter(re.findall(r'^; FEATURE: (.+)$',g,re.M))
        assert features['Outer wall'] and features['Top surface']
        assert not any('support' in f.lower() for f in features)
        detail={'return_code':result['return_code'],'slice_process_exit_code':code,
                'warning_message':r['warning_message'],'gcode_bytes':len(g.encode()),
                'gcode_features':dict(features),'estimated_seconds':round(r['total_predication']),
                'estimated_filament_g':round(sum(f['total_used_g'] for f in r['filaments']),2),
                'object_names':sorted(names)}
        report['plates'][plate].update(detail)
        (WORK/f'plate_{plate}_verification.json').write_text(json.dumps(report['plates'][plate],ensure_ascii=False,indent=2)+'\n')
report['bambu_studio_slicing_verified']=True
report['gcode_3mf_sha256']=hashfile(WORK/'checked_2plates.gcode.3mf')
report['cli_warning_lines']=[l for log in WORK.glob('*.log') for l in log.read_text().splitlines() if re.search('warning|error',l,re.I)]
(OUT/'validation.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
print(json.dumps(report['plates'],ensure_ascii=False,indent=2),flush=True)

# Keep this task in one folder and discard only our known scratch exports.
(WORK/'result.json').replace(WORK/'slice_result.json')
for filename in ('input_geometry.3mf','bound.3mf','positioned.3mf','plate_1.gcode','plate_2.gcode'):
    (WORK/filename).unlink(missing_ok=True)
