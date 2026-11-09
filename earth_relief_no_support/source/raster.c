
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
