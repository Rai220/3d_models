"""Engineering sections from generated profiles, in assembly coordinates."""
from pathlib import Path
import json
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
ROOT=Path(__file__).resolve().parents[1]
a=json.loads((ROOT/'geometry_validation.json').read_text())['actual'];p=np.load(ROOT/'surface_profiles.npz')
seat=a['globe_bottom_in_assembly_mm'];center=seat+a['sphere_center_above_globe_bottom_mm']
fig,axes=plt.subplots(1,2,figsize=(14,9))
ax=axes[0]
for sign,idx in [(1,600),(-1,0)]:
    outer=p['outer'][:,idx];z=p['z']+seat
    iz=p['inner_z']+seat;ir=p['inner_r']
    x=np.r_[outer,0,ir[::-1]]*sign;y=np.r_[z,iz[-1],iz[::-1]]
    ax.fill(x,y,color='#c3cbd2',edgecolor='#4d6573',lw=.8)
    ax.fill(np.r_[0,48,48,p['cap_r'][:,idx],0]*sign,
            np.r_[0,0,3.99,p['cap_z'],seat],color='#879dac',alpha=.85)
# Section of base cavities and peg, consistent with x-axis cable position.
ax.fill([-24,24,24,-24],[a['led_pocket_floor_z_mm']]*2+[seat]*2,color='white')
ax.fill([-48,-24,-24,-48],[a['led_pocket_floor_z_mm']]*2+[seat]*2,color='white')
for s in [-1,1]:ax.fill(np.array([36,39.65,39.65,36])*s,[seat,seat,seat+4.4,seat+4.4],color='#879dac')
ax.annotate('Свод: плавное сужение\nи заключительный мост 8 мм',xy=(4,seat+a['inner_ceiling_height_mm']),xytext=(-73,164),arrowprops={'arrowstyle':'->'},fontsize=10)
ax.annotate('Океан: стенка 1,2 мм',xy=(72,center),xytext=(-67,91),arrowprops={'arrowstyle':'->'},fontsize=10)
ax.annotate('Проём Ø80 мм',xy=(40,seat+2),xytext=(-66,42),arrowprops={'arrowstyle':'->'},fontsize=10)
ax.set_title('Разрез сборки по меридианам 0° / 180°')
ax.set_xlim(-85,85);ax.set_ylim(-4,181);ax.set_aspect('equal');ax.set_xlabel('мм');ax.set_ylabel('мм')
ax=axes[1]
ax.plot(p['z'],p['outer'][:,600],label='Внешний радиус, меридиан 0°',color='#226c89')
ax.plot(p['inner_z'],p['inner_r'],label='Внутренний радиус',color='#ba682a')
ax.axvline(a['inner_ceiling_height_mm'],color='#ba682a',ls=':')
ax.set_xlabel('Высота от низа оболочки, мм');ax.set_ylabel('Радиус, мм');ax.set_title('Как оболочка постепенно закрывается');ax.legend(loc='upper right',fontsize=9)
ax.text(.04,.32,'Слой 0,08 мм\n\nВыступ наружу: ≤0,12 мм / слой\nСужение свода: ≤0,20 мм / слой\nШирина линий: 0,45 / 0,50 мм\n\nПечать отверстием вниз.\nБрим 5 мм отделяется после печати.\n\nПодставка: Ø96 мм\nПосадочный поясок: Ø79,3 мм\nЗазор: 0,35 мм на сторону\nУстановка и снятие — вертикально.',transform=ax.transAxes,fontsize=11,va='top',bbox={'facecolor':'#f4f3ed','edgecolor':'none','pad':12})
for ax in axes:ax.grid(alpha=.15)
fig.suptitle('Земля без поддержек · проверка конструкции, а не физическая проба',fontsize=15)
fig.tight_layout();fig.savefig(ROOT/'assembly_sections.png',dpi=170)
