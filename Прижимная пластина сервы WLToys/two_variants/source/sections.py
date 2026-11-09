from pathlib import Path
import json
import trimesh
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
R=Path(__file__).resolve().parents[1]
v=json.loads((R/'geometry_validation.json').read_text())
fig,axs=plt.subplots(1,2,figsize=(13,5),sharey=True)
for ax,(name,p) in zip(axs,v['parts'].items()):
    m=trimesh.load_mesh(R/(name+'.stl'))
    y=p['pilot_centers_print_xy_mm'][0][1]
    section=m.section(plane_origin=[0,y,0],plane_normal=[0,1,0])
    for c in section.discrete:ax.plot(c[:,0],c[:,2],color='#176074')
    H=p['extents_mm'][2]
    ax.text(15,5,f'Под пластиной\n{H-2:g} мм',ha='center')
    ax.text(15,12,f'Каналы Ø1,2 × 8\nДно: {H-8:g} мм',ha='center')
    ax.set(title=f'{name} • H={H:g} мм',xlim=(-1,32),ylim=(-1,18),aspect='equal',xlabel='X, мм',ylabel='Z печати, мм')
    ax.grid(alpha=.2)
fig.suptitle('Разрезы через передние стойки A–B • плоская сторона на столе')
fig.tight_layout();fig.savefig(R/'sections.png',dpi=160)
