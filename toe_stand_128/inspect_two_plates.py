"""Inspect both actual final sliced plates and all four scale engravings."""
from pathlib import Path
import json, re, zipfile, hashlib, math
import numpy as np
import trimesh
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.collections import LineCollection
from matplotlib.patches import Rectangle
from shapely.geometry import LineString, Point
from shapely.ops import unary_union
from gcode_paths import extrusion_paths, layer_paths

ROOT=Path(__file__).resolve().parent
OUT=ROOT;WORK=ROOT
project=OUT/'P1S_toe_M3x10_M3x16.3mf'
sliced=WORK/'checked_2plates.gcode.3mf'
report=json.loads((OUT/'validation.json').read_text())
assert report['bambu_studio_slicing_verified']
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert sha(project)==report['project_sha256'] and sha(sliced)==report['gcode_3mf_sha256']
with zipfile.ZipFile(project) as z:settings=json.loads(z.read('Metadata/project_settings.config'))
offset=np.array([float(v) for v in settings['extruder_offset'][0].split('x')])
scene=trimesh.load_scene(project)
source=trimesh.load_mesh(ROOT/'wheel_carriage_right.stl')
all_records=[];layer_records={}
fig,axes=plt.subplots(1,2,figsize=(13,7),facecolor='#f3f0e9')
sf,saxes=plt.subplots(2,2,figsize=(12,9),facecolor='white')
with zipfile.ZipFile(sliced) as z:
    for plate in (1,2):
        n=next(n for n in z.namelist() if n.endswith(f'plate_{plate}.gcode'))
        g=z.read(n).decode()
        cuts=list(re.finditer(r'^; CHANGE_LAYER\s*\n; Z_HEIGHT: ([0-9.]+)',g,re.M))
        chunk=g[cuts[0].start():cuts[1].start()]
        paths=extrusion_paths(chunk)+offset
        segments,palette,_=layer_paths(chunk)
        segments=np.array(segments)+offset
        # Check actual model extrusion centers, excluding startup purge paths.
        assert segments.min()>=30 and segments.max()<=226
        ax=axes[plate-1]
        ax.add_collection(LineCollection(segments,colors='#087f8c',linewidths=.28))
        ax.add_patch(Rectangle((0,0),256,256,fill=False,lw=2,color='#243d47'))
        ax.add_patch(Rectangle((30,30),196,196,fill=False,lw=1.1,ls='--',color='#a3712c'))
        ax.set(xlim=(-4,260),ylim=(-4,260),aspect='equal',xlabel='X, мм',ylabel='Y, мм')
        data=report['plates'][str(plate)];minutes=round(data['estimated_seconds']/60)
        ax.set_title(f"Пластина {plate} · {data['objects']} деталей\n{data['estimated_filament_g']:.1f} г · {minutes//60} ч {minutes%60:02d} мин",fontsize=14)
        # Return plate-local extrusion to the global 3MF workspace before
        # applying each object's inverse placement transform.
        global_paths=paths+np.array([(plate-1)*307.2,0])
        for node in scene.graph.nodes_geometry:
            T,key=scene.graph[node];m=scene.geometry[key]
            if not np.allclose(m.extents,source.extents,atol=.001):continue
            if (1 if T[0,3]<256 else 2)!=plate:continue
            vertices=np.column_stack([global_paths.reshape(-1,2),np.full(global_paths.size//2,.2)])
            vertices=trimesh.transform_points(vertices,np.linalg.inv(T))-(m.bounds[0]-source.bounds[0])
            local=vertices[:,:2].reshape(-1,2,2)
            keep=(local[:,:,0].min(1)>45)&(local[:,:,0].max(1)<66)&(np.abs(local[:,:,1]).max(1)<11)
            lines=local[keep];assert len(lines)>50
            network=unary_union([LineString(line) for line in lines]);distances=[]
            for theta in range(-5,6):
                a=math.radians(theta);p=Point(51.5*math.cos(a),-51.5*math.sin(a))
                d=network.distance(p);assert .30<d<.85,(plate,node,theta,d)
                distances.append(round(d,4))
            sa=saxes.flat[len(all_records)];sa.add_collection(LineCollection(lines,colors='#087482',linewidths=1.05))
            sa.set(xlim=(45,66),ylim=(-11,11),aspect='equal',xlabel='X детали, мм',ylabel='Y детали, мм')
            sa.set_title(f'Пластина {plate} · шкала {len(all_records)+1}')
            all_records.append({'plate':plate,'model_node':node,'all_11_tick_channels_preserved':True,
                                'tick_center_to_extrusion_centerline_mm':distances})
        lf,laxes=plt.subplots(1,3,figsize=(13,6),facecolor='white');records=[]
        for la,target in zip(laxes,(.2,4,7.4)):
            i=min(range(len(cuts)),key=lambda i:abs(float(cuts[i].group(1))-target))
            chunk=g[cuts[i].start():cuts[i+1].start() if i+1<len(cuts) else len(g)]
            lines,colors,lengths=layer_paths(chunk);lines=np.asarray(lines)+offset
            la.add_collection(LineCollection(lines,colors=colors,linewidths=.35))
            la.set(xlim=(0,256),ylim=(0,256),aspect='equal',xlabel='X, мм',ylabel='Y, мм')
            la.set_title('Z = '+cuts[i].group(1)+' мм')
            records.append({'z_mm':float(cuts[i].group(1)),'path_segments':len(lines),
                            'extrusion_path_length_mm_by_feature':lengths})
        lf.suptitle(f'Пластина {plate} · траектории итоговой нарезки',fontsize=18)
        lf.tight_layout(rect=(0,0,1,.9));lf.savefig(WORK/f'plate_{plate}_toolpaths.png',dpi=160);plt.close(lf)
        layer_records[plate]=records
assert len(all_records)==4
fig.suptitle('Комплект и пробник на двух пластинах P1S',fontsize=20)
fig.text(.5,.05,'От края до деталей — минимум 31 мм. Между деталями — минимум 5 мм.',ha='center',fontsize=12)
fig.tight_layout(rect=(0,.12,1,.93));fig.savefig(OUT/'layout.png',dpi=170);plt.close(fig)
sf.suptitle('Все 44 риски сохранились в итоговой нарезке двух пластин',fontsize=18)
sf.tight_layout(rect=(0,0,1,.94));sf.savefig(WORK/'scale_toolpaths.png',dpi=170);plt.close(sf)
inspection={'project_sha256':sha(project),'gcode_3mf_sha256':sha(sliced),
            'extruder_offset_compensated_mm':offset.tolist(),'scales':all_records,'layers':layer_records,
            'physical_print_verified':False}
(WORK/'toolpath_inspection.json').write_text(json.dumps(inspection,ensure_ascii=False,indent=2)+'\n')
report['all_44_degree_ticks_preserved']=True
(OUT/'validation.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
print('Both plates and all 44 tick channels verified in actual G-code.')
