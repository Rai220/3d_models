"""Check actual sliced model paths, separately from removable supports.
Arcs are expanded to <=0.2 mm chords. Coordinates are recovered from each
plate's bounding box and the independently reloaded STL bounds.
"""
from pathlib import Path
import json, re, zipfile, math, xml.etree.ElementTree as ET
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.collections import LineCollection
ROOT=Path(__file__).resolve().parents[1]
geo=json.loads((ROOT/'geometry_validation.json').read_text())
slicing=json.loads((ROOT/'slicing_validation.json').read_text())
pattern=re.compile(r'([XYZEIJ])(-?\d*\.?\d+)')
results={};plots=[]
for name in ['globe','base','fit_ring','light_test']:
    plate=slicing[name]['sliced_plates'][0]
    box=plate['objects'][0]['bbox']; bounds=np.array(geo['files'][f'earth_{name}.stl']['bounds_mm'])
    # Bambu arrange may rotate about Z and its result.json bbox bounds the
    # rotated source bounding BOX. Read the exact project transform instead.
    with zipfile.ZipFile(ROOT/f'P1S_Earth_{name}.3mf') as z:
        root=ET.fromstring(z.read('3D/3dmodel.model'))
        ns={'m':'http://schemas.microsoft.com/3dmanufacturing/core/2015/02'}
        transform=np.array([float(x) for x in root.find('m:build/m:item',ns).attrib['transform'].split()]).reshape(4,3)
        model_settings=ET.fromstring(z.read('Metadata/model_settings.config'))
        repairs=model_settings.find('.//mesh_stat').attrib
        assert all(int(v)==0 for k,v in repairs.items() if k!='face_count'),repairs
        config=json.loads(z.read('Metadata/project_settings.config'))
        extruder_offset=np.array([float(x) for x in config['extruder_offset'][0].split('x')])
    rotation=transform[:2,:2];origin=transform[3,:2]-extruder_offset
    assert np.max(np.abs(rotation@rotation.T-np.eye(2)))<1e-6
    assert np.allclose(transform[:3,2],[0,0,1])
    archive=ROOT/f'check_{name}/checked_{name}.gcode.3mf'
    with zipfile.ZipFile(archive) as z:
        text=z.read(next(n for n in z.namelist() if n.endswith('.gcode'))).decode()
    targets=([2.44,4.52,70.12,130.12] if name=='globe' else
             [geo['actual']['led_pocket_floor_z_mm']+1.5,26.6] if name=='base' else [2.44])
    layers=np.array([float(s) for s in re.findall(r'; Z_HEIGHT: ([\d.]+)',text)])
    selected={float(layers[np.abs(layers-t).argmin()]):{'model':[],'support':[]} for t in targets}
    pos=np.array([0.,0.]);layer=-1.;feature='Custom'; width=.42;relative=True;eprev=0.
    stats={'model_extrusion_moves':0,'support_extrusion_moves':0,'intrusions':0,
           'support_moves_inside_cavity':0,'support_moves_in_cable_channel':0,'checked_layers_mm':list(selected)}
    for line in text.splitlines():
        if line.startswith('; Z_HEIGHT: '): layer=float(line.split(':')[1]);continue
        if line.startswith('; FEATURE: '): feature=line[11:];continue
        if line.startswith('; LINE_WIDTH: '): width=float(line.split(':')[1]);continue
        if line=='M83': relative=True;continue
        if line=='M82': relative=False;continue
        if line.startswith('G92 E'): eprev=float(line[5:].split()[0]);continue
        cmd=line.split(' ',1)[0]
        if cmd not in ['G0','G1','G2','G3']:continue
        d={k:float(v) for k,v in pattern.findall(line.split(';')[0])}
        end=np.array([d.get('X',pos[0]),d.get('Y',pos[1])])
        extrusion=d.get('E',0.) if relative else d.get('E',eprev)-eprev
        if 'E' in d:eprev=d['E'] if not relative else eprev+d['E']
        if extrusion<=0 or not ('X' in d or 'Y' in d) or layer<0 or feature=='Custom':pos=end;continue
        if cmd in ['G2','G3'] and ('I' in d or 'J' in d):
            center=pos+np.array([d.get('I',0),d.get('J',0)])
            radius=np.linalg.norm(pos-center)
            a=math.atan2(*(pos-center)[::-1]);b=math.atan2(*(end-center)[::-1])
            sweep=(b-a)%(2*np.pi) if cmd=='G3' else -((a-b)%(2*np.pi))
            angles=np.linspace(a,a+sweep,max(2,math.ceil(abs(sweep)*radius/.2)+1))
            pts=center+radius*np.column_stack([np.cos(angles),np.sin(angles)])
        else:
            pts=np.linspace(pos,end,max(2,math.ceil(np.linalg.norm(end-pos)/.2)+1))
        px=pts[:,0]-origin[0];py=pts[:,1]-origin[1]
        pts=np.column_stack([px*rotation[0,0]+py*rotation[0,1],px*rotation[1,0]+py*rotation[1,1]])
        assert np.isfinite(pts).all()
        support=feature.startswith('Support')
        key='support' if support else 'model'
        stats[key+'_extrusion_moves']+=1
        if layer in selected:
            selected[layer][key].extend(np.stack([pts[:-1],pts[1:]],axis=1).tolist())
        intrude=False
        if name in ['globe','fit_ring'] and .4<layer<4.8:
            intrude=bool(np.any(np.linalg.norm(pts,axis=1)<29.5))
        if name=='globe' and layer>5.5:
            dist=np.sqrt(np.sum(pts**2,axis=1)+(layer-geo['actual']['sphere_center_above_globe_bottom_mm'])**2)
            cavity=bool(np.any(dist<geo['actual']['inner_radius_mm']-.6))
            intrude=intrude or cavity
            if support and cavity:stats['support_moves_inside_cavity']+=1
        if name=='base' and geo['actual']['led_pocket_floor_z_mm']+.4<layer<geo['actual']['led_pocket_floor_z_mm']+2.6:
            channel=(pts[:,0]>-32)&(pts[:,0]<-27)&(np.abs(pts[:,1])<2.7)
            intrude=bool(channel.any())
            if support and intrude:stats['support_moves_in_cable_channel']+=1
        if intrude and not support:stats['intrusions']+=1
        pos=end
    results[name]=stats
    for height,paths in selected.items():plots.append((name,height,paths))
    print(name,stats,flush=True)
(ROOT/'toolpath_validation.json').write_text(json.dumps(results,indent=2)+'\n')
fig,axes=plt.subplots(2,4,figsize=(16,8))
for ax,(name,height,paths) in zip(axes.ravel(),plots):
    for key,color in [('support','#bcab91'),('model','#226c89')]:
        if paths[key]:ax.add_collection(LineCollection(paths[key],colors=color,linewidths=.4))
    ax.autoscale();ax.set_aspect('equal');ax.set_title(f'{name}: Z={height:g} мм');ax.grid(alpha=.15)
fig.suptitle('Фактические траектории: модель — синим, удаляемые поддержки — бежевым')
fig.tight_layout();fig.savefig(ROOT/'toolpath_sections.png',dpi=160)
assert all(v['intrusions']==0 for v in results.values()),results
