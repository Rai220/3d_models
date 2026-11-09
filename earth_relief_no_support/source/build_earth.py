"""Support-free Earth lamp: real-data relief with bounded layer offsets.

Changes are manufacturing envelopes, never invented terrain. Millimetres.
The upper interior is a self-supporting conical vault with an 8 mm final bridge.
"""
from pathlib import Path
import json, hashlib, argparse
import numpy as np
import trimesh
from scipy.ndimage import gaussian_filter
from geo_data import prepare_grid, sample, check_stl
ROOT=Path(__file__).resolve().parents[1]

def envelope(zs,rs,levels):
    """Maximum radius of exact intersections with every meridian segment."""
    step=levels[1]-levels[0];nlon=zs.shape[1]
    za=zs[:-1].ravel();zb=zs[1:].ravel()
    ra=rs[:-1].ravel();rb=rs[1:].ravel()
    lon=np.tile(np.arange(nlon),zs.shape[0]-1)
    low=np.minimum(za,zb);high=np.maximum(za,zb)
    start=np.maximum(0,np.ceil((low-levels[0])/step).astype(int))
    end=np.minimum(len(levels)-1,np.floor((high-levels[0])/step).astype(int))
    out=np.zeros((len(levels),nlon))
    for k in range(max(0,int((end-start).max()))+1):
        idx=start+k;use=(idx<=end)&(np.abs(zb-za)>1e-10)
        ix=idx[use];zz=levels[ix]
        radii=ra[use]+(rb[use]-ra[use])*(zz-za[use])/(zb[use]-za[use])
        np.maximum.at(out,(ix,lon[use]),radii)
    return out

def support_envelope(r,z,max_growth):
    out=r.copy()
    # Propagate material down from every upper protrusion. Existing peak
    # positions/heights are retained; only its lower approach is filled.
    for i in range(len(z)-2,-1,-1):
        out[i]=np.maximum(out[i],out[i+1]-max_growth*(z[i+1]-z[i]))
    return out

def ring_surface(z,r,nlon):
    if np.ndim(r)==1:r=np.repeat(r[:,None],nlon,axis=1)
    theta=np.arange(nlon)*2*np.pi/nlon-np.pi
    v=np.stack([r*np.cos(theta),r*np.sin(theta),np.broadcast_to(z[:,None],r.shape)],axis=-1).reshape(-1,3)
    a=np.arange((len(z)-1)*nlon).reshape(-1,nlon);b=np.roll(a,-1,axis=1)
    f=np.concatenate([np.stack([a,b,a+nlon],-1).reshape(-1,3),np.stack([b,b+nlon,a+nlon],-1).reshape(-1,3)])
    return v,f

def solid_profile(z,r,nlon):
    v,f=ring_surface(z,r,nlon);last=(len(z)-1)*nlon+np.arange(nlon);first=np.arange(nlon)
    bottom=len(v);top=bottom+1
    v=np.vstack([v,[0,0,z[0]],[0,0,z[-1]]])
    f=np.vstack([f,np.column_stack([first,np.full(nlon,bottom),np.roll(first,-1)]),
                   np.column_stack([last,np.roll(last,-1),np.full(nlon,top)])])
    m=trimesh.Trimesh(v,f,process=True)
    assert m.is_watertight and m.volume>0
    return m

def hollow_profile(z,r,zi,ri,nlon):
    # Matching inner angular resolution at the open rim allows a direct annulus.
    vo,fo=ring_surface(z[:-1],r[:-1],nlon)
    pole=len(vo);vo=np.vstack([vo,[0,0,z[-1]]])
    last=(len(z)-2)*nlon+np.arange(nlon)
    fo=np.vstack([fo,np.column_stack([last,np.roll(last,-1),np.full(nlon,pole)])])
    # Interior uses coarse vertical intervals wherever the vault is a cone.
    vi,fi=ring_surface(zi,ri,nlon);off=len(vo);fi=fi[:,::-1]+off
    ceiling=len(vo)+len(vi);last_i=off+(len(zi)-1)*nlon+np.arange(nlon)
    cap=np.column_stack([last_i,np.full(nlon,ceiling),np.roll(last_i,-1)])
    a=np.arange(nlon);b=np.roll(a,-1)
    rim=np.vstack([np.column_stack([a,b+off,b]),np.column_stack([a,a+off,b+off])])
    mesh=trimesh.Trimesh(np.vstack([vo,vi,[0,0,zi[-1]]]),np.vstack([fo,fi,cap,rim]),process=True)
    assert mesh.is_watertight and mesh.is_winding_consistent and mesh.volume>0
    return mesh

def cylinder(r,h,z):
    c=trimesh.creation.cylinder(radius=r,height=h,sections=240);c.apply_translation([0,0,z+h/2]);return c

def clean(m):
    m.vertices=np.round(m.vertices,5);m.merge_vertices(digits_vertex=5)
    m.update_faces(m.nondegenerate_faces(height=1e-7));m.remove_unreferenced_vertices()
    parts=m.split(only_watertight=False)
    if len(parts)>1:
        parts=sorted(parts,key=lambda p:abs(p.volume),reverse=True)
        assert sum(abs(p.volume) for p in parts[1:])<.01
        m=parts[0]
    return m

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--radius',type=float,default=72.)
    parser.add_argument('--land-lift',type=float,default=.8)
    parser.add_argument('--mm-per-km',type=float,default=.65)
    args=parser.parse_args();R=args.radius;wall=1.2;Ri=R-wall
    open_r=40.;collar_h=4.8;max_outer_slope=1.5;max_inner_slope=2.5
    cut=-float(np.sqrt(Ri**2-open_r**2));dz=.2;nlon=1200
    grid=prepare_grid();lat=np.linspace(-90,90,1801);lon=np.linspace(-180,180,nlon,endpoint=False)
    lo,la=np.meshgrid(lon,lat)
    coast=sample(grid,'land',la,lo);height=sample(grid,'height_m',la,lo)
    lift=coast*(args.land_lift+args.mm_per_km*height/1000)
    # Fade only the last 15 northern degrees so the Arctic apex stays single.
    # This prevents tiny Greenland peaks creating isolated islands above the pole.
    polar=np.minimum(1,np.maximum(0,(90-la)/15))**2
    lift*=polar
    sine=np.sin(np.deg2rad(la));cosine=np.cos(np.deg2rad(la))
    north=la>75
    lift[north]=np.minimum(lift[north],np.maximum(0,(R-.02)/np.maximum(sine[north],1e-9)-R))
    sr=R+lift;zs=sr*sine;rs=sr*cosine
    z=np.arange(cut,R,dz);z=np.r_[z,R]
    print('Sampling real-data surface sections',flush=True)
    desired=envelope(zs,rs,z[:-1]);desired=np.vstack([desired,np.zeros(nlon)])
    assert np.all(desired[:-1]>0)
    # Broadening below cliffs gives a supported path at every azimuth.
    outer=support_envelope(desired,z,max_outer_slope)
    outer[z<cut+collar_h]=np.maximum(outer[z<cut+collar_h],43.)
    outer=support_envelope(outer,z,max_outer_slope)
    roof_z=R-1.6;bridge_r=4.
    zi=np.unique(np.r_[cut,np.arange(cut+.2,roof_z,.4),cut+collar_h,roof_z])
    inner_sphere=np.sqrt(np.maximum(0,Ri**2-zi**2))
    inner_cone=bridge_r+max_inner_slope*(roof_z-zi)
    inner=np.minimum(inner_sphere,inner_cone)
    inner[zi<=cut+collar_h]=open_r
    print('Building hollow shell',flush=True)
    shell=hollow_profile(z-cut,outer,zi-cut,inner,nlon)
    slot=trimesh.creation.box(extents=[1.,3.6,5.4]);slot.apply_translation([40.4,0,2.5])
    shell=trimesh.boolean.difference([shell,slot],engine='manifold')
    # The polar stand is also profiled by the same real data and slope bound.
    cap_start=float(np.floor(zs.min()/dz)*dz-.4)
    cap_z=np.arange(cap_start,cut,dz);cap_z=np.r_[cap_z,cut]
    cap_desired=envelope(zs,rs,cap_z[:-1]);cap_desired=np.vstack([cap_desired,outer[0]])
    cap_r=support_envelope(cap_desired,cap_z,max_outer_slope)
    cap_r=np.maximum(cap_r,16.)
    base_floor=4.;cap_shift=base_floor-cap_start;seat=cut+cap_shift
    stand_z=np.r_[0,base_floor-.01,cap_z+cap_shift]
    stand_r=np.vstack([np.full(nlon,48.),np.full(nlon,48.),cap_r])
    base=solid_profile(stand_z,stand_r,nlon)
    plug=trimesh.boolean.difference([cylinder(39.65,4.6,seat-.2),cylinder(36,5,seat-.4)],engine='manifold')
    key=trimesh.creation.box(extents=[1.2,3,4]);key.apply_translation([39.8,0,seat+1.8])
    base=trimesh.boolean.union([base,plug,key],engine='manifold')
    pocket_floor=seat-3
    pocket=cylinder(24,20,pocket_floor)
    cable=trimesh.creation.box(extents=[58,7,3]);cable.apply_translation([-29,0,pocket_floor+1.5])
    base=trimesh.boolean.difference([base,pocket,cable],engine='manifold')
    lower_box=trimesh.creation.box(extents=[300,300,12]);lower_box.apply_translation([0,0,6])
    lower_trial=trimesh.boolean.intersection([shell,lower_box],engine='manifold')
    roof_start=R-cut-20
    upper_box=trimesh.creation.box(extents=[300,300,40]);upper_box.apply_translation([0,0,roof_start+20])
    roof_trial=trimesh.boolean.intersection([shell,upper_box],engine='manifold');roof_trial.apply_translation([0,0,-roof_start])
    blocks=[]
    for i,h in enumerate([1.2,2.2,4.2,7.2]):
        b=trimesh.creation.box(extents=[12,20,h]);b.apply_translation([i*12,0,h/2]);blocks.append(b)
    light=trimesh.boolean.union(blocks,engine='manifold')
    models={'globe':shell,'base':base,'lower_trial':lower_trial,'roof_trial':roof_trial,'light_test':light}
    report={'parameters':vars(args),'files':{},'physical_print_tested':False,
        'sources':{'elevation':'NOAA ETOPO 2022 60s surface, stride 6','shoreline':'Natural Earth Land 1:10m 5.1.1',
        'printing_reference':'https://3dmakerbench.com/moon-lamp-generator'},
        'actual':{'sphere_center_above_globe_bottom_mm':-cut,'globe_bottom_in_assembly_mm':seat,
        'ocean_radius_mm':R,'nominal_ocean_wall_mm':wall,'opening_diameter_mm':80,
        'plug_diameter_mm':79.3,'radial_fit_clearance_mm':.35,'plug_engagement_mm':4.4,
        'base_diameter_mm':96,'led_pocket_diameter_mm':48,'led_pocket_floor_z_mm':pocket_floor,
        'cable_channel_mm':[7,3],'inner_ceiling_height_mm':roof_z-cut,'final_ceiling_bridge_mm':8,
        'roof_trial_start_z_mm':roof_start,'max_outer_radial_growth_per_mm':max_outer_slope,
        'max_inner_radial_shrink_per_mm':max_inner_slope,'layer_height_mm':.08,
        'outer_wall_line_width_mm':.45,'inner_wall_line_width_mm':.5}}
    for name,m in models.items():
        m=clean(m);models[name]=m;path=ROOT/f'earth_{name}.stl';m.export(path)
        report['files'][path.name]=check_stl(path)
        print(name,report['files'][path.name],flush=True)
    # Geometric overhang proof, independent from the support checkbox.
    growth=np.diff(outer,axis=0)/np.diff(z)[:,None]
    shrink=-np.diff(inner)/np.diff(zi)
    cap_growth=np.diff(cap_r,axis=0)/np.diff(cap_z)[:,None]
    assert growth.max()<max_outer_slope+1e-6
    assert cap_growth.max()<max_outer_slope+1e-6
    assert shrink.max()<max_inner_slope+1e-6
    radial_wall=np.sqrt((bridge_r+max_inner_slope*(roof_z-zi))**2+zi**2)
    vault=inner_cone<inner_sphere
    report['overhang_geometry']={'outer_max_growth':float(growth.max()),'inner_max_shrink':float(shrink.max()),
        'stand_max_growth':float(cap_growth.max()),'outer_step_at_008_mm':float(growth.max()*.08),
        'inner_step_at_008_mm':float(shrink.max()*.08),'ceiling_bridge_diameter_mm':8,
        'vault_start_latitude_deg':float(np.rad2deg(np.arcsin(zi[vault][0]/Ri))),
        'maximum_vault_radial_ocean_wall_mm':float((R-radial_wall[vault]).max()),
        'max_added_lower_approach_mm':float((outer-desired).max()),
        'changed_surface_fraction':float(((outer-desired)>.05).mean())}
    assembled=models['globe'].copy();assembled.apply_translation([0,0,seat])
    collision=trimesh.boolean.intersection([assembled,models['base']],engine='manifold')
    report['assembly']={'intersection_mm3':float(collision.volume) if len(collision.faces) else 0,
        'size_mm':trimesh.util.concatenate([assembled,models['base']]).extents.tolist(),
        'retention':'gravity fit with orientation key; carry by the base',
        'checked_vertical_lifts_mm':[0,1,2.5,4.5,8]}
    assert report['assembly']['intersection_mm3']<.01
    for lift in [1,2.5,4.5,8]:
        test=assembled.copy();test.apply_translation([0,0,lift])
        overlap=trimesh.boolean.intersection([test,models['base']],engine='manifold')
        assert not len(overlap.faces) or overlap.volume<.01
    report['source_sha256']={f.name:hashlib.sha256(f.read_bytes()).hexdigest() for f in (ROOT/'data').iterdir() if f.is_file()}
    np.savez_compressed(ROOT/'surface_profiles.npz',z=z-cut,outer=outer,inner_z=zi-cut,inner_r=inner,
                        cap_z=cap_z+cap_shift,cap_r=cap_r,desired=desired)
    (ROOT/'geometry_validation.json').write_text(json.dumps(report,indent=2)+'\n')
    print('Geometry and assembly passed',flush=True)

if __name__=='__main__':main()
