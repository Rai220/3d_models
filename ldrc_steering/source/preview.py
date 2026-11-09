"""Render the delivered print meshes in their actual print orientations."""
from pathlib import Path
import numpy as np
import trimesh
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d.art3d import Poly3DCollection
R=Path(__file__).resolve().parents[1]
fig=plt.figure(figsize=(13,6),facecolor='white')
for i,(name,title) in enumerate([('tie_rod','Тяга: широкой стороной на стол'),('knuckle','Кулак: осевое отверстие вверх')]):
    mesh=trimesh.load_mesh(R/f'stl/{name}_print.stl')
    ax=fig.add_subplot(1,2,i+1,projection='3d')
    light=np.array([.3,-.5,.8]);light/=np.linalg.norm(light)
    shades=.5+.5*np.maximum(0,mesh.face_normals@light)
    color=np.array([.18,.54,.68])
    ax.add_collection3d(Poly3DCollection(mesh.triangles,facecolors=shades[:,None]*color,edgecolors='none'))
    for axis,extent in zip((ax.set_xlim,ax.set_ylim,ax.set_zlim),mesh.extents):axis(-1,extent+1)
    ax.set_box_aspect(mesh.extents+2);ax.view_init(28,-58)
    ax.set(xlabel='X, мм',ylabel='Y, мм',zlabel='Z, мм',title=title)
fig.tight_layout();fig.savefig(R/'analysis/print_orientation.png',dpi=180)
