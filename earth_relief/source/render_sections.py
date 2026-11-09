from pathlib import Path
import json
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import trimesh
ROOT=Path(__file__).resolve().parents[1]
r=json.loads((ROOT/'geometry_validation.json').read_text())
seat=r['actual']['globe_bottom_in_assembly_mm']
shell=trimesh.load_mesh(ROOT/'earth_globe.stl');shell.apply_translation([0,0,seat])
base=trimesh.load_mesh(ROOT/'earth_base.stl')
fig,axes=plt.subplots(1,2,figsize=(13,8),gridspec_kw={'width_ratios':[1,1.2]})
for obj,color,label in [(shell,'#267c95','Оболочка'),(base,'#b66d30','Крышка-подставка')]:
    section=obj.section(plane_normal=[0,1,0],plane_origin=[0,0,0])
    for ax in axes:
        for i,path in enumerate(section.discrete):
            ax.plot(path[:,0],path[:,2],color=color,lw=1.5,label=label if i==0 else None)
for ax in axes:
    ax.set_aspect('equal');ax.grid(alpha=.18);ax.set_xlabel('мм');ax.set_ylabel('мм')
axes[0].set_title('Разрез готовой сборки через ось');axes[0].legend(loc='upper right')
axes[0].annotate('Полость для LED',xy=(0,80),xytext=(-60,100),arrowprops={'arrowstyle':'->'},fontsize=10)
axes[0].annotate('Гладкая внутренняя поверхность',xy=(65,117),xytext=(-48,123),arrowprops={'arrowstyle':'->'},fontsize=9)
axes[1].set_xlim(-46,46);axes[1].set_ylim(-2,43);axes[1].set_title('Посадка крышки и канал провода')
axes[1].annotate('Радиальный зазор 0,35 мм',xy=(29.8,seat+3),xytext=(-10,40),arrowprops={'arrowstyle':'->'},fontsize=10)
axes[1].annotate('Ключ ориентации',xy=(30.5,seat+2),xytext=(12,35),arrowprops={'arrowstyle':'->'},fontsize=10)
axes[1].annotate('Канал 7 × 3 мм',xy=(-32,seat-1.5),xytext=(-45,34),arrowprops={'arrowstyle':'->'},fontsize=10)
axes[1].annotate('Место под LED Ø48 мм',xy=(0,seat-3),xytext=(-20,11),arrowprops={'arrowstyle':'->'},fontsize=10)
axes[1].text(0,1,'Основание Ø86 мм',ha='center',fontsize=9)
fig.suptitle('Земля 150 мм: оболочка и съёмная полярная крышка\nРазрезы построены по выдаваемым STL',fontsize=16)
fig.tight_layout();fig.savefig(ROOT/'assembly_sections.png',dpi=170)
