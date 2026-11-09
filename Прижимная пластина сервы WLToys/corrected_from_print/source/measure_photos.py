"""Auditable manual landmark comparison, not a calibrated 3D scan."""
from pathlib import Path
import json, hashlib
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from PIL import Image

R=Path(__file__).resolve().parents[1]
# Approximate centimetre intersections around both parts. Compare RATIOS,
# not absolute floor coordinates: the holes are above the calibration plane.
pixels=np.array([[300,415],[380,410],[462,404],[543,398],
 [304,499],[385,491],[467,484],[550,477],
 [313,658],[398,650],[482,642],[567,634],
 [323,821],[410,813],[497,804],[585,795],
 [329,902],[417,894],[504,885],[594,876]],float)
grid=np.array([[x,y] for y in [0,10,30,50,60] for x in [0,10,20,30]],float)
aa=[];bb=[]
for (u,v),(x,y) in zip(pixels,grid):
    aa.extend([[u,v,1,0,0,0,-x*u,-x*v],[0,0,0,u,v,1,-y*u,-y*v]])
    bb.extend([x,y])
hom=np.r_[np.linalg.lstsq(aa,bb,rcond=None)[0],1].reshape(3,3)
def rectified(points):
    q=np.c_[points,np.ones(len(points))]@hom.T
    return q[:,:2]/q[:,2,None]
original=np.array([[399,634],[601,625],[417,461]],float)
printed=np.array([[620,694],[402,717],[614,889]],float)
def coordinates(points):
    a,b,c=rectified(points)
    dx=b-a;ex=dx/np.linalg.norm(dx);ey=np.array([-ex[1],ex[0]])
    return np.array([np.linalg.norm(dx),(c-a)@ex,abs((c-a)@ey)])
o,n=coordinates(original),coordinates(printed)
ratios=o/n
raw=ratios*np.array([25.3,3.5,22])
# Near post faces are at almost the same depth (floor endpoints at y~645).
# Compare the front edge of the top face and its corresponding floor edge.
side_o=np.array([[730,572],[730,645]])
side_n=np.array([[780,556],[780,646]])
height_ratio=(side_o[1,1]-side_o[0,1])/(side_n[1,1]-side_n[0,1])
height_estimate=16*height_ratio
report={'method':'Manual original-versus-known-print landmark ratios with approximate floor homography',
 'known_reference_model_mm':{'width':30.3,'depth':28.4988,'height':16,'AB':25.3,'C_x':3.5,'C_y':22},
 'assumption':'Printed reference was made at 100% scale; actual printed dimensions not measured.',
 'top_landmarks_original_ABC_px':original.tolist(),'top_landmarks_printed_ABC_px':printed.tolist(),
 'grid_landmarks_px':pixels.tolist(),'grid_landmarks_mm':grid.tolist(),'homography':hom.tolist(),
 'floor_grid_fit_rms_mm':float(np.sqrt(np.mean((rectified(pixels)-grid)**2))),
 'raw_ratios_AB_Cx_Cy':ratios.tolist(),'raw_estimated_AB_Cx_Cy_mm':raw.tolist(),
 'side_original_post_px':side_o.tolist(),'side_printed_post_px':side_n.tolist(),
 'height_ratio':height_ratio,'raw_height_estimate_mm':height_estimate,
 'adopted_mm':{'AB':23.5,'C_x':3.0,'C_y':20.3,'height':13,'post_width':4.5,'plate_thickness':2},
 'practical_estimation_uncertainty_mm':{'plan':.7,'height':1.0},
 'uncertainty_is_statistical_confidence_interval':False,
 'limitations':'Manual points, occlusion, perspective and different elevated hole planes remain. Grid residual is not part accuracy. Section thicknesses are approximate; useful printable wall and plate thickness preserved.',
 'withdrawn_data':'All previously supplied servo dimensions withdrawn by user; no servo box fit assertion is reused.',
 'physical_fit_verified':False,
 'source_sha256':{p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted((R/'references').glob('*.jpg'))}}
(R/'photo_comparison.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
fig,axs=plt.subplots(1,2,figsize=(13,8))
ax=axs[0];ax.imshow(Image.open(R/'references/top_comparison.jpg'))
for points,color,label in [(original,'#00ddff','Оригинал'),(printed,'#ffbf46','Напечатанный 16 мм')]:
    ax.plot(*points[[0,1,2,0]].T,color=color,lw=1)
    for name,(x,y) in zip('ABC',points):ax.text(x+6,y-8,name,color=color,fontsize=12,weight='bold')
    ax.scatter(*points.T,color=color,s=25,label=label)
ax.set(xlim=(330,670),ylim=(940,410));ax.legend(loc='lower left',fontsize=9)
ax.set_title('Сопоставление центров отверстий');ax.set_axis_off()
ax=axs[1];ax.imshow(Image.open(R/'references/side_comparison.jpg'))
for points,color,label in [(side_o,'#00ddff','73 px'),(side_n,'#ffbf46','90 px')]:
    ax.annotate('',xy=points[0],xytext=points[1],arrowprops={'arrowstyle':'|-|','color':color,'lw':2})
    ax.text(points[0,0]+5,points[:,1].mean(),label,color=color,fontsize=11,weight='bold')
ax.set(xlim=(590,930),ylim=(660,510));ax.set_axis_off()
ax.set_title('Сравнение высоты ближних стоек')
fig.suptitle('Коррекция по новым фото: план ≈ −7…8%; высота ≈ −19%',fontsize=15)
fig.text(.5,.03,'Принято: A–B 23,5 мм; C=(3; 20,3) мм; H=13 мм. Размеры оценочные.',ha='center',fontsize=11)
fig.tight_layout(rect=(0,.07,1,.94));fig.savefig(R/'photo_measurements.png',dpi=160)
print(json.dumps({'raw_plan_mm':raw.tolist(),'raw_height_mm':height_estimate},indent=2))
