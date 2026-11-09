"""Final-STL mechanical checks with M3x10/M3x16 countersunk hardware.

Nominal metal dimensions, screw access, nut insertion and retained load paths.
These calculations do not establish real printed fit, stiffness or accuracy.
"""
from pathlib import Path
import json, math
import numpy as np
import trimesh
import manifold3d as mf
ROOT=Path(__file__).resolve().parent
P=json.loads((ROOT/'parameters.json').read_text())

def load(n):
    m=trimesh.load_mesh(ROOT/f'{n}.stl')
    if n.startswith('wheel_carriage') or n in ('axle_saddle','fit_slider'):
        m.apply_transform(trimesh.transformations.rotation_matrix(math.pi,[1,0,0]))
        m.apply_translation([0,0,P['axle_saddle_top'] if n=='axle_saddle' else P['wheel_carriage_top']])
    s=mf.Manifold(mf.Mesh(np.asarray(m.vertices,dtype=np.float32),np.asarray(m.faces,dtype=np.uint32)))
    assert s.status()==mf.Error.NoError
    return s

def cyl(r,h,z=0):return mf.Manifold.cylinder(h,r,r,64).translate((0,0,z))

def nut(z=0,angle=0):
    r=5.5/math.sqrt(3);a=np.radians(np.arange(6)*60+30+angle)
    s=mf.CrossSection([np.column_stack([r*np.cos(a),r*np.sin(a)])]).extrude(2.4)
    return (s-cyl(1.7,2.6,-.1)).translate((0,0,z))

def bolt(top,length):
    return cyl(1.5,length-1.5,top-length)+mf.Manifold.cylinder(1.5,1.5,3,96).translate((0,0,top-1.5))

