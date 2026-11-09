"""Pure G-code path parsers used by the current two-plate verifier."""
from collections import defaultdict
import math, re
import numpy as np

def extrusion_paths(text):
    xy=None;paths=[];feature=''
    for line in text.splitlines():
        if line.startswith('; FEATURE: '):feature=line[11:];continue
        w=line.split(';',1)[0].split()
        if not w or w[0] not in ('G0','G1','G2','G3'):continue
        d={m[0]:float(m[1:]) for m in w[1:] if re.fullmatch(r'[XYZIJEFR][-+]?\d*\.?\d+',m)}
        if 'X' not in d and 'Y' not in d:continue
        if xy is None:
            if 'X' in d and 'Y' in d:xy=np.array([d['X'],d['Y']])
            continue
        end=np.array([d.get('X',xy[0]),d.get('Y',xy[1])]);points=np.array([xy,end])
        if w[0] in ('G2','G3') and ('I' in d or 'J' in d):
            c=xy+np.array([d.get('I',0),d.get('J',0)]);r=np.linalg.norm(xy-c)
            a=math.atan2(*(xy-c)[::-1]);b=math.atan2(*(end-c)[::-1]);s=(b-a)%(2*math.pi)
            if w[0]=='G2':s=-((a-b)%(2*math.pi))
            t=np.linspace(a,a+s,max(3,int(abs(s)*r/.08)))
            points=c+np.column_stack([np.cos(t),np.sin(t)])*r;points[-1]=end
        if d.get('E',0)>0 and feature:paths.extend(np.stack([points[:-1],points[1:]],axis=1))
        xy=end
    return np.asarray(paths)


colors={'Outer wall':'#125366','Inner wall':'#3998ac','Sparse infill':'#c68420',
        'Internal solid infill':'#8b63bb','Gap infill':'#dc6451',
        'Top surface':'#369166','Bottom surface':'#369166','Bridge':'#bd4b9b',
        'Floating vertical shell':'#6b78a1'}

def layer_paths(text):
    xy=None;feature='Unknown';segments=[];palette=[];lengths=defaultdict(float)
    for line in text.splitlines():
        if line.startswith('; FEATURE: '): feature=line[11:];continue
        words=line.split(';',1)[0].strip().split()
        if not words or words[0] not in ('G0','G1','G2','G3'): continue
        d={m[0]:float(m[1:]) for m in words[1:] if re.fullmatch(r'[XYZIJEFR][-+]?\d*\.?\d+',m)}
        if 'X' not in d and 'Y' not in d: continue
        if xy is None:
            if 'X' in d and 'Y' in d: xy=np.array([d['X'],d['Y']])
            continue
        end=np.array([d.get('X',xy[0]),d.get('Y',xy[1])])
        points=np.array([xy,end])
        if words[0] in ('G2','G3') and ('I' in d or 'J' in d):
            center=xy+np.array([d.get('I',0),d.get('J',0)])
            r=np.linalg.norm(xy-center)
            a=math.atan2(*(xy-center)[::-1]);b=math.atan2(*(end-center)[::-1])
            sweep=(b-a)%(2*math.pi)
            if words[0]=='G2': sweep=-((a-b)%(2*math.pi))
            angles=np.linspace(a,a+sweep,max(3,int(abs(sweep)*r/.15)))
            points=center+np.column_stack([np.cos(angles),np.sin(angles)])*r
            points[-1]=end
        if d.get('E',0)>0 and feature in colors:
            segs=np.stack([points[:-1],points[1:]],axis=1)
            segments.extend(segs);palette.extend([colors[feature]]*len(segs))
            lengths[feature]+=sum(np.linalg.norm(points[1:]-points[:-1],axis=1))
        xy=end
    return segments,palette,dict(lengths)

