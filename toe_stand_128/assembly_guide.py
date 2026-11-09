"""Assembly and exact-STL hardware sections for the revised M3 design."""
import json, math
import numpy as np
import trimesh
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.path import Path as MPath
from matplotlib.patches import PathPatch
from shapely.geometry import Polygon
from shapely.geometry.polygon import orient
from hardware_geometry import ROOT,P,load,nut,bolt
from cad_helpers import view3d

def mesh(s):
    raw=s.to_mesh()
    return trimesh.Trimesh(np.asarray(raw.vert_properties)[:,:3],np.asarray(raw.tri_verts),process=True)

def moved(n,offset=(0,0,0),angle=0):return mesh(load(n).rotate((0,0,angle)).translate(offset))

fig,(ax,notes)=plt.subplots(1,2,figsize=(14,10),facecolor='#f3f0e9')
view3d(ax,[(moved('crossrail'),'#627981'),
          (moved('wheel_carriage_right',(15,0,12)),'#c3cfd1'),
          (moved('bearing_washer',(15,0,41)),'#dca24a'),
          (moved('wheel_unit',(15,0,50)),'#168c98'),
          (mesh(bolt(85,16).translate((15,0,0))),'#b17d35'),
          (mesh(nut(21.6,30).translate((-8,0,0))),'#b17d35')],25,-60)
ax.set_title('Правый узел · порядок сборки',fontsize=18)
notes.axis('off')
notes.text(.02,.96,
 '4  Цельная площадка + упор + стрелка\n'
 '    Только один центральный винт М3×16, потай.\n'
 '    Гаек в самой площадке нет; толщина 5 мм.\n\n'
 '3  Опорная шайба Ø22 × 0,8 мм\n'
 '    Задаёт зазор между стрелкой и шкалой.\n\n'
 '2  Каретка со шкалой\n'
 '    Гайку оси вставить с внутреннего торца.\n'
 '    Карман расположен ВЫШЕ канала рельса.\n'
 '    Материал снизу 2,9 мм, сверху 6 мм.\n'
 '    Конец М3×16 выше рельса на 1,5 мм.\n\n'
 '1  Поперечная направляющая\n'
 '    Крепится к ползунку двумя М3×16 сверху.\n'
 '    Головки утоплены в направляющую.\n\n'
 'Боковой фиксатор — М3×10\n'
 'Гайку вставить с торца в боковую щель.\n'
 'Для перемещения ослабить винт на 1–2 оборота.\n\n'
 'Ножка — сквозной М3×16 сверху, гайка снизу.\n'
 'Начать резьбу, удерживая гайку пальцем.\n\n'
 'Первым напечатать пробный колёсный узел.\n'
 'Не смешивать новые каретки со старыми деталями.',
 va='top',fontsize=13,linespacing=1.4,color='#243d47')
fig.suptitle('Стенд 1:28 · только потайные М3×10 и М3×16',fontsize=22,y=.97)
fig.subplots_adjust(left=.01,right=.99,bottom=.03,top=.91,wspace=.03)
fig.savefig(ROOT/'assembly_guide.png',dpi=160);plt.close(fig)

spine_z=P['foot_height']-P['axle_saddle_top'];beam_z=P['foot_height']
car_z=beam_z+P['wheel_carriage_top'];pad_z=car_z+P['bearing_thickness']
display=[(moved('spine',(0,0,spine_z),90),'#627981')]
for y in (-49,49):
    display.extend([(moved('axle_saddle',(0,y,spine_z),90),'#b6c5c9'),(moved('crossrail',(0,y,beam_z)),'#627981')])
    for side in (-1,1):
        x=29*side;a=180 if side<0 else 0
        carrier='wheel_carriage_left' if side<0 else 'wheel_carriage_right'
        display.extend([(moved('foot',(70*side,y,0)),'#627981'),(moved(carrier,(x,y,beam_z),a),'#c3cfd1'),
                        (moved('bearing_washer',(x,y,car_z)),'#dca24a'),(moved('wheel_unit',(x,y,pad_z),a),'#168c98')])
fig,axes=plt.subplots(1,2,figsize=(15,9),facecolor='#f3f0e9')
view3d(axes[0],display,90,-90)
axes[0].set_title('ПЕРЕД МАШИНЫ ↑\nПередняя и задняя оси оснащены одинаково',fontsize=15)
carrier=moved('wheel_carriage_right');region=carrier.triangles_center[:,0]>45
scale=carrier.submesh([np.flatnonzero(region)],append=True)
groove=np.isclose(carrier.triangles_center[:,2],P['wheel_carriage_top']-P['scale_engraving_depth'],atol=.001)&region
ink=carrier.submesh([np.flatnonzero(groove)],append=True);ink.apply_translation([0,0,.01])
pointer=moved('wheel_unit',(0,0,P['wheel_carriage_top']+P['bearing_thickness']),2)
pointer=pointer.submesh([np.flatnonzero(pointer.triangles_center[:,0]>45)],append=True)
view3d(axes[1],[(scale,'#c3cfd1'),(ink,'#253841'),(pointer,'#087482')],90,-90)
axes[1].set_title('Пример: правое колесо +2°\nШаг 1° · «+» — схождение, «−» — расхождение',fontsize=15)
fig.suptitle('Четыре шкалы ±5° · смотреть строго сверху',fontsize=24,y=.98)
fig.text(.25,.15,'База: 70–140 мм\nШирина по колёсам: 50–120 мм, отдельно на каждой оси',ha='center',fontsize=12,linespacing=1.5)
fig.text(.75,.15,'Гравировка на иллюстрации выделена тёмным цветом.\nДля 0° нужна проверка нуля и ориентации шасси.',ha='center',fontsize=12,linespacing=1.5)
fig.text(.5,.055,'Цена деления не является подтверждённой точностью. Исправленная версия физически не напечатана.',ha='center',fontsize=11,color='#5b6970')
fig.subplots_adjust(left=.02,right=.98,bottom=.22,top=.85,wspace=.05)
fig.savefig(ROOT/'measurement_guide.png',dpi=160);plt.close(fig)

# Actual section curves of reloaded STL plus nominal screws/nuts.
def section(ax,s,color,normal=(1,0,0),origin=(0,0,0),coords=(1,2)):
    path=mesh(s).section(plane_normal=normal,plane_origin=origin)
    if path is None:return
    shape=Polygon()
    for curve in path.discrete:
        q=Polygon(curve[:,coords]);shape=shape.symmetric_difference(q)
    for poly in ([shape] if shape.geom_type=='Polygon' else shape.geoms):
        poly=orient(poly,sign=1)
        rings=[np.asarray(poly.exterior.coords)]+[np.asarray(h.coords) for h in poly.interiors]
        paths=[]
        for ring in rings:
            codes=np.full(len(ring),MPath.LINETO);codes[0]=MPath.MOVETO;codes[-1]=MPath.CLOSEPOLY
            paths.append(MPath(ring,codes))
        ax.add_patch(PathPatch(MPath.make_compound_path(*paths),facecolor=color,edgecolor='#34454c',lw=.65))

car=load('wheel_carriage_right');rail=load('crossrail');base=load('axle_saddle')
cs=(P['countersink_diameter']-6)/2
z=P['wheel_carriage_top'];u=z+P['bearing_thickness'];top=u+P['platform_thickness']-cs
panels=[
 ('Ось поворота · М3×16',[(rail,'#627981'),(car,'#c3cfd1'),(load('bearing_washer').translate((0,0,z)),'#dfa343'),
   (load('wheel_unit').translate((0,0,u)),'#168c98'),(nut(9.6,30),'#c48c42'),(bolt(top,16),'#c48c42')],
   (1,0,0),(0,0,0),(1,2),(-18,18,-1,27),'Конец винта выше рельса на 1,5 мм.\nГайка удерживается сверху и снизу.'),
 ('Ножка · сквозной М3×16',[(load('foot'),'#c3cfd1'),(rail.translate((-70,0,11)),'#627981'),
   (nut(1.2),'#c48c42'),(bolt(16.7,16),'#c48c42')],
   (1,0,0),(0,0,0),(1,2),(-13,13,-1,20),'Гайка в нижнем кармане; над ней 7,4 мм.\nКонец винта утоплен на 0,7 мм.'),
 ('Поперечина · два М3×16',[(load('spine').rotate((0,0,90)),'#627981'),(base.rotate((0,0,90)),'#c3cfd1'),
   (rail.translate((0,0,10)),'#627981')]+[(s.translate((x,0,0)),'#c48c42') for x in (-11,11)
     for s in (nut(2.4,30).rotate((0,0,90)),bolt(15.7,16))],
   (0,1,0),(0,0,0),(0,2),(-21,21,-2,19),'Винты проходят по бокам от продольного рельса.\nПотайные головки ниже поверхности поперечины.'),
 ('Боковой зажим · М3×10',[(rail,'#627981'),(car,'#c3cfd1'),
   (nut(angle=30).rotate((90,0,0)).translate((9,13.6,5.4)),'#c48c42'),
   (bolt(0,10).rotate((-90,0,0)).translate((9,17.1,5.4)),'#c48c42')],
   (1,0,0),(9,0,0),(1,2),(-10,22,-1,20),'Гайка загружается с торца и удерживается стенками.\nПеред перемещением винт необходимо ослабить.')]
fig,axs=plt.subplots(2,2,figsize=(14,12),facecolor='#f3f0e9')
for ax,(title,objects,normal,origin,coords,limits,note) in zip(axs.flat,panels):
    for s,col in objects:section(ax,s,col,normal,origin,coords)
    ax.set_xlim(limits[:2]);ax.set_ylim(limits[2:]);ax.set_aspect('equal');ax.grid(alpha=.12)
    ax.set_title(title,fontsize=16,pad=12);ax.set_xlabel('мм');ax.set_ylabel('Z, мм')
    ax.text(.5,-.22,note,transform=ax.transAxes,ha='center',va='top',fontsize=11,linespacing=1.5)
fig.suptitle('Разрезы исправленных узлов · геометрия STL и крепежа',fontsize=22,y=.98)
fig.subplots_adjust(left=.06,right=.97,top=.91,bottom=.11,wspace=.23,hspace=.56)
fig.savefig(ROOT/'fastener_sections.png',dpi=170);plt.close(fig)
print('Assembly, scale and hardware section illustrations saved.')
