"""Render the delivered STL with a small CPU depth buffer; no invented imagery."""
from pathlib import Path
import ctypes, subprocess
import numpy as np
import trimesh
from PIL import Image, ImageDraw, ImageFont
ROOT=Path(__file__).resolve().parents[1]
C=r'''
#include <math.h>
#include <stdint.h>
void render(int nf, float *v, int32_t *f, float *c, int w, int h, float *z, uint8_t *img) {
 for(int k=0;k<nf;k++) {
  float *a=v+3*f[3*k],*b=v+3*f[3*k+1],*d=v+3*f[3*k+2];
  int x0=fmax(0,floor(fmin(a[0],fmin(b[0],d[0])))), x1=fmin(w-1,ceil(fmax(a[0],fmax(b[0],d[0]))));
  int y0=fmax(0,floor(fmin(a[1],fmin(b[1],d[1])))), y1=fmin(h-1,ceil(fmax(a[1],fmax(b[1],d[1]))));
  float den=(b[1]-d[1])*(a[0]-d[0])+(d[0]-b[0])*(a[1]-d[1]);
  if(fabs(den)<1e-10)continue;
  for(int y=y0;y<=y1;y++)for(int x=x0;x<=x1;x++) {
   float u=((b[1]-d[1])*(x+.5-d[0])+(d[0]-b[0])*(y+.5-d[1]))/den;
   float t=((d[1]-a[1])*(x+.5-d[0])+(a[0]-d[0])*(y+.5-d[1]))/den;
   if(u<0||t<0||u+t>1)continue;
   float zz=u*a[2]+t*b[2]+(1-u-t)*d[2]; int p=y*w+x;
   if(zz>z[p]) {z[p]=zz;for(int j=0;j<3;j++)img[3*p+j]=(uint8_t)(255*fmax(0,fmin(1,c[3*k+j])));}
  }
 }
}
'''
def main():
    src=ROOT/'source/raster.c';lib=ROOT/'source/raster.dylib'
    src.write_text(C)
    subprocess.run(['clang','-O3','-shared','-fPIC',str(src),'-o',str(lib)],check=True)
    raster=ctypes.CDLL(str(lib)).render
    fp=np.ctypeslib.ndpointer(dtype=np.float32,flags='C_CONTIGUOUS')
    ip=np.ctypeslib.ndpointer(dtype=np.int32,flags='C_CONTIGUOUS')
    bp=np.ctypeslib.ndpointer(dtype=np.uint8,flags='C_CONTIGUOUS')
    raster.argtypes=[ctypes.c_int,fp,ip,fp,ctypes.c_int,ctypes.c_int,fp,bp]
    m=trimesh.load_mesh(ROOT/'earth_globe.stl')
    report=__import__('json').loads((ROOT/'geometry_validation.json').read_text())
    center=report['actual']['sphere_center_above_globe_bottom_mm']
    seat=report['actual']['globe_bottom_in_assembly_mm']
    m.apply_translation([0,0,seat])
    base=trimesh.load_mesh(ROOT/'earth_base.stl')
    m=trimesh.util.concatenate([m,base])
    v=m.vertices.copy();v[:,2]-=center+seat-6
    normals=m.face_normals
    w=h=1400
    out=Image.new('RGB',(1600,1740),'#f3f0e9')
    draw=ImageDraw.Draw(out)
    font=ImageFont.truetype('/System/Library/Fonts/Supplemental/Arial.ttf',35)
    small=ImageFont.truetype('/System/Library/Fonts/Supplemental/Arial.ttf',24)
    draw.text((55,30),'ЗЕМЛЯ · ВЕРСИЯ БЕЗ ПОДДЕРЖЕК',font=font,fill='#242c31')
    draw.text((55,85),'NOAA ETOPO 2022 + Natural Earth | около 150 мм | цельная полая оболочка',font=small,fill='#59636a')
    for idx,(el,az,title) in enumerate([(18,30,'Европа и Африка'),(18,100,'Азия и Гималаи'),(14,-90,'Северная и Южная Америка'),(-12,150,'Австралия и нижняя крышка')]):
        e,a=np.deg2rad([el,az]);eye=np.array([np.cos(e)*np.cos(a),np.cos(e)*np.sin(a),np.sin(e)])
        right=np.array([-np.sin(a),np.cos(a),0]);up=np.cross(eye,right)
        pv=np.column_stack([(v*d).sum(axis=1) for d in [right,up,eye]])
        pv[:,0]=pv[:,0]*7.6+w/2;pv[:,1]=h/2-pv[:,1]*7.6
        light=-.45*right+.6*up+.75*eye;light/=np.linalg.norm(light)
        diffuse=np.maximum((normals*light).sum(axis=1),0)
        bright=.25+.75*diffuse
        visible=(normals*eye).sum(axis=1)>0
        faces=np.ascontiguousarray(m.faces[visible],dtype=np.int32)
        colors=np.ascontiguousarray(bright[visible,None]*np.array([.96,.96,.94])[None,:],dtype=np.float32)
        canvas=np.empty((h,w,3),dtype=np.uint8);canvas[:]=[243,240,233]
        depth=np.full((h,w),-np.inf,dtype=np.float32)
        raster(len(faces),np.ascontiguousarray(pv,dtype=np.float32),faces,colors,w,h,depth,canvas)
        im=Image.fromarray(canvas).resize((780,780),Image.Resampling.LANCZOS)
        x=10+(idx%2)*800;y=140+(idx//2)*790
        out.paste(im,(x,y));draw.text((x+30,y+750),title,font=small,fill='#242c31')
    out.save(ROOT/'earth_preview.png')
    print('Rendered actual exported STL',flush=True)
if __name__=='__main__':main()
