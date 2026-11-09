"""3MF export and true-depth mesh preview; no model generation at import."""
import zipfile
import xml.etree.ElementTree as ET
import numpy as np
import matplotlib
def write_3mf(m, name, path, plate_parts=None):
    # Portable geometry-only 3MF; intentional absence of printer/G-code settings.
    ns = 'http://schemas.microsoft.com/3dmanufacturing/core/2015/02'
    ET.register_namespace('', ns)
    q = lambda t: '{'+ns+'}'+t
    root = ET.Element(q('model'), {'unit':'millimeter','{http://www.w3.org/XML/1998/namespace}lang':'en-US'})
    ET.SubElement(root,q('metadata'),{'name':'Title'}).text=name
    res = ET.SubElement(root,q('resources'))
    entries = plate_parts or [(m,name,(0,0,0))]
    build=ET.SubElement(root,q('build'))
    for i,(part,part_name,offset) in enumerate(entries,1):
        obj = ET.SubElement(res,q('object'),{'id':str(i),'type':'model','name':part_name})
        me = ET.SubElement(obj,q('mesh'))
        vs,ts = ET.SubElement(me,q('vertices')), ET.SubElement(me,q('triangles'))
        for v in part.vertices-part.bounds[0]+np.array(offset):
            ET.SubElement(vs,q('vertex'),dict(zip(['x','y','z'],[f'{x:.6f}' for x in v])))
        for f in part.faces:
            ET.SubElement(ts,q('triangle'),dict(zip(['v1','v2','v3'],map(str,f))))
        ET.SubElement(build,q('item'),{'objectid':str(i)})
    with zipfile.ZipFile(path,'w',zipfile.ZIP_DEFLATED) as z:
        z.writestr('[Content_Types].xml','<?xml version="1.0" encoding="UTF-8"?><Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types"><Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/><Default Extension="model" ContentType="application/vnd.ms-package.3dmanufacturing-3dmodel+xml"/></Types>')
        z.writestr('_rels/.rels','<?xml version="1.0" encoding="UTF-8"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Target="/3D/3dmodel.model" Id="rel0" Type="http://schemas.microsoft.com/3dmanufacturing/2013/01/3dmodel"/></Relationships>')
        z.writestr('3D/3dmodel.model',ET.tostring(root,encoding='utf-8',xml_declaration=True))

def view3d(ax, meshes, elev, azim):
    # Orthographic CPU z-buffer avoids painter-sort artifacts on CAD triangles.
    e,a=np.deg2rad([elev,azim]); eye=np.array([np.cos(e)*np.cos(a),np.cos(e)*np.sin(a),np.sin(e)])
    right=np.array([-np.sin(a),np.cos(a),0]); up=np.cross(eye,right)
    basis=np.vstack([right,up,eye])
    project=lambda v: np.sum(v[:,None,:]*basis[None,:,:],axis=2)
    vv=project(np.vstack([m.vertices for m,c in meshes]))
    lo,hi=vv.min(0),vv.max(0)
    w,h=1000,700; factor=min((w-70)/(hi[0]-lo[0]),(h-70)/(hi[1]-lo[1]))
    center=(lo+hi)/2
    canvas=np.full((h,w,3),matplotlib.colors.to_rgb('#f3f0e9'))
    depth=np.full((h,w),-np.inf)
    light=.25*right+.45*up+.86*eye; light/=np.linalg.norm(light)
    for m,color in meshes:
        verts=project(m.vertices)
        verts[:,0]=(verts[:,0]-center[0])*factor+w/2
        verts[:,1]=h/2-(verts[:,1]-center[1])*factor
        brightness=.65+.35*np.clip(np.sum(m.face_normals*light,axis=1),0,1)
        colors=np.array(matplotlib.colors.to_rgb(color))[None,:]*brightness[:,None]
        visible=np.sum(m.face_normals*eye,axis=1)>1e-8
        for tri,c in zip(verts[m.faces[visible]],colors[visible]):
            x0,y0,z0=tri[0]; x1,y1,z1=tri[1]; x2,y2,z2=tri[2]
            xmin=max(0,int(np.floor(tri[:,0].min()))); xmax=min(w-1,int(np.ceil(tri[:,0].max())))
            ymin=max(0,int(np.floor(tri[:,1].min()))); ymax=min(h-1,int(np.ceil(tri[:,1].max())))
            denom=(y1-y2)*(x0-x2)+(x2-x1)*(y0-y2)
            if abs(denom)<1e-9 or xmin>xmax or ymin>ymax: continue
            xx,yy=np.meshgrid(np.arange(xmin,xmax+1)+.5,np.arange(ymin,ymax+1)+.5)
            u=((y1-y2)*(xx-x2)+(x2-x1)*(yy-y2))/denom
            v=((y2-y0)*(xx-x2)+(x0-x2)*(yy-y2))/denom
            t=1-u-v; zz=u*z0+v*z1+t*z2
            patch=depth[ymin:ymax+1,xmin:xmax+1]
            use=(u>=-1e-8)&(v>=-1e-8)&(t>=-1e-8)&(zz>patch)
            patch[use]=zz[use]; canvas[ymin:ymax+1,xmin:xmax+1][use]=c
    ax.imshow(canvas); ax.set_axis_off()
