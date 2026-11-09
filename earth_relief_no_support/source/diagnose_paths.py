"""Inspect actual G-code from reloaded delivery projects; all units mm.
Arcs tessellated at <=0.25 mm, transformed back to original STL coordinates.
Checks cavity, seat, LED well, cable, and zero support extrusion.
"""
from pathlib import Path
import json,re,zipfile,math,xml.etree.ElementTree as ET
from collections import Counter
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.collections import LineCollection
ROOT=Path(__file__).resolve().parents[1]
geo=json.loads((ROOT/'geometry_validation.json').read_text());a=geo['actual']
p=np.load(ROOT/'surface_profiles.npz')
pattern=re.compile(r'([XYZEIJ])(-?\d*\.?\d+)')
results={};plots=[]
for name in ['lower_trial']:
    with zipfile.ZipFile(ROOT/f'P1S_Earth_no_support_{name}.3mf') as archive:
        ns={'m':'http://schemas.microsoft.com/3dmanufacturing/core/2015/02'}
        root=ET.fromstring(archive.read('3D/3dmodel.model'))
        t=np.array(list(map(float,root.find('m:build/m:item',ns).attrib['transform'].split()))).reshape(4,3)
        repairs=ET.fromstring(archive.read('Metadata/model_settings.config')).find('.//mesh_stat').attrib
        assert all(int(v)==0 for k,v in repairs.items() if k!='face_count'),repairs
        config=json.loads(archive.read('Metadata/project_settings.config'))
        assert config['enable_support']=='0' and config['layer_height']=='0.08'
        offset=np.array(list(map(float,config['extruder_offset'][0].split('x'))))
    rotation=t[:2,:2];origin=t[3,:2]-offset
    assert np.allclose(t[:3,2],[0,0,1])
    text=(ROOT/f'check_{name}/plate_1.gcode').read_text()
    layers=np.array(list(map(float,re.findall(r'; Z_HEIGHT: ([\d.]+)',text))))
    targets={'globe':[2.44,120.04,128.76,128.92], 'base':[19.48,21.08],
             'lower_trial':[4.84], 'roof_trial':[18.36,18.52], 'light_test':[.28]}[name]
    selected={float(layers[np.abs(layers-h).argmin()]):{'model':[],'bridge':[]} for h in targets}
    pos=np.zeros(2);layer=-1.;layer_height=.08;feature='Custom';relative=True;eprev=0.;features=Counter()
    stats={'support_extrusion_moves':0,'intrusions':0,'checked_layers_mm':list(selected),
           'maximum_bridge_move_mm':0.,'ceiling_bridge_layers_mm':[], 'maximum_roof_free_span_mm':0.}
    for line in text.splitlines():
        if line.startswith('; Z_HEIGHT: '):layer=float(line.split(':')[1]);continue
        if line.startswith('; LAYER_HEIGHT: '):layer_height=float(line.split(':')[1]);continue
        if line.startswith('; FEATURE: '):feature=line[11:];continue
        if line=='M83':relative=True;continue
        if line=='M82':relative=False;continue
        if line.startswith('G92 E'):eprev=float(line[5:].split()[0]);continue
        cmd=line.split(' ',1)[0]
        if cmd not in ['G0','G1','G2','G3']:continue
        d={k:float(v) for k,v in pattern.findall(line.split(';')[0])}
        end=np.array([d.get('X',pos[0]),d.get('Y',pos[1])])
        extrusion=d.get('E',0.) if relative else d.get('E',eprev)-eprev
        if 'E' in d:eprev=d['E'] if not relative else eprev+d['E']
        if extrusion<=0 or not ('X' in d or 'Y' in d) or layer<0 or feature in ['Custom','Brim','Skirt','Flush']:
            pos=end;continue
        if cmd in ['G2','G3'] and ('I' in d or 'J' in d):
            center=pos+np.array([d.get('I',0),d.get('J',0)]);radius=np.linalg.norm(pos-center)
            start=math.atan2(*(pos-center)[::-1]);finish=math.atan2(*(end-center)[::-1])
            sweep=(finish-start)%(2*np.pi) if cmd=='G3' else -((start-finish)%(2*np.pi))
            angles=np.linspace(start,start+sweep,max(2,math.ceil(abs(sweep)*radius/.25)+1))
            pts=center+radius*np.column_stack([np.cos(angles),np.sin(angles)])
        else:pts=np.linspace(pos,end,max(2,math.ceil(np.linalg.norm(end-pos)/.25)+1))
        px=pts[:,0]-origin[0];py=pts[:,1]-origin[1]
        pts=np.column_stack([px*rotation[0,0]+py*rotation[0,1],px*rotation[1,0]+py*rotation[1,1]])
        assert np.isfinite(pts).all()
        features[feature]+=1
        if feature.startswith('Support'):stats['support_extrusion_moves']+=1
        bridge='Bridge' in feature
        if bridge:stats['maximum_bridge_move_mm']=max(stats['maximum_bridge_move_mm'],float(np.linalg.norm(np.diff(pts,axis=0),axis=1).sum()))
        if layer in selected:selected[layer]['bridge' if bridge else 'model'].extend(np.stack([pts[:-1],pts[1:]],axis=1).tolist())
        r=np.linalg.norm(pts,axis=1);intrude=False
        if name in ['globe','lower_trial','roof_trial']:
            # Z_HEIGHT is the TOP of deposited plastic. The slicer intersects
            # the mesh at the layer midpoint, crucial at the neck's inner flare.
            model_z=layer-layer_height/2+(a['roof_trial_start_z_mm'] if name=='roof_trial' else 0)
            if model_z<a['inner_ceiling_height_mm']-.12:
                ri=np.interp(model_z,p['inner_z'],p['inner_r'])
                intrude=bool(np.any(r<ri-.65))
            elif bridge:
                if layer not in stats['ceiling_bridge_layers_mm']:stats['ceiling_bridge_layers_mm'].append(layer)
                # Circle chord within previous layer's remaining opening, excluding anchors.
                prev_z=model_z-.08
                if prev_z<a['inner_ceiling_height_mm']:
                    radius=float(np.interp(prev_z,p['inner_z'],p['inner_r']))
                    aa=pts[0];bb=pts[-1];delta=bb-aa;length=np.linalg.norm(delta)
                    if length>1e-9:
                        unit=delta/length;proj=-float(np.dot(aa,unit));perp2=float(np.dot(aa,aa))-proj**2
                        if perp2<radius**2:
                            half=np.sqrt(radius**2-perp2)
                            free=max(0,min(length,proj+half)-max(0,proj-half))
                            stats['maximum_roof_free_span_mm']=max(stats['maximum_roof_free_span_mm'],float(free))
        if name=='base':
            if a['led_pocket_floor_z_mm']+.3<layer<a['globe_bottom_in_assembly_mm']-.2:
                intrude=bool(np.any(r<23.4)) or bool(np.any((pts[:,0]<-24.5)&(pts[:,0]>-41)&(np.abs(pts[:,1])<2.9)))
            if layer>a['globe_bottom_in_assembly_mm']+.3:intrude=intrude or bool(np.any(r<35.4))
        if intrude:stats['intrusions']+=1
        pos=end
    stats['feature_extrusion_moves']=dict(features);stats['model_extrusion_moves']=sum(features.values())
    results[name]=stats
    for h,paths in selected.items():plots.append((name,h,paths))
    print(name,stats,flush=True)
    pass
