"""Real-data tactile globe. Units: mm. Run from any working directory.

NOAA ETOPO 2022 surface heights and Natural Earth 5.1.1 land polygons.
No procedural mountains or hand-drawn continent outlines.
"""
from pathlib import Path
import argparse, hashlib, json, struct, zipfile
import numpy as np
import trimesh
from scipy.ndimage import gaussian_filter, map_coordinates
import rasterio.features
from rasterio.transform import from_bounds
import shapefile

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / 'data'

def read_dods(path):
    raw = path.read_bytes()
    header, body = raw.split(b'Data:\n', 1)
    pos = 0
    def array(dtype, count):
        nonlocal pos
        n, n2 = struct.unpack_from('>II', body, pos)
        assert n == n2 == count, (n, n2, count)
        pos += 8
        a = np.frombuffer(body, dtype=dtype, count=count, offset=pos).astype(np.float64)
        pos += a.itemsize * count if dtype == '>f8' else 4 * count
        return a
    z = array('>f4', 1800*3600).reshape(1800, 3600)
    lat = array('>f8', 1800)
    lon = array('>f8', 3600)
    assert pos == len(body), (pos, len(body))
    assert np.isfinite(z).all() and z.min() > -12000 and z.max() < 9000
    if lat[0] < lat[-1]:
        lat, z = lat[::-1], z[::-1]
    return z, lat, lon

def prepare_grid():
    target = DATA / 'derived_grid.npz'
    if target.exists():
        with np.load(target) as d:
            return {k: d[k] for k in d.files}
    z, lat, lon = read_dods(DATA/'etopo_2022_stride6.dods')
    with zipfile.ZipFile(DATA/'ne_10m_land.zip') as f:
        f.extractall(DATA/'land')
    shapes = [s.__geo_interface__ for s in shapefile.Reader(str(DATA/'land/ne_10m_land.shp')).shapes()]
    # Align the raster pixels with the exact decimated ETOPO coordinates.
    transform = from_bounds(lon[0]-.05, lat[-1]-.05, lon[-1]+.05, lat[0]+.05, 3600, 1800)
    land = rasterio.features.rasterize(((s,1) for s in shapes), out_shape=z.shape,
                                     transform=transform, fill=0, dtype='uint8')
    # One slight low-pass operation; no invented peaks or random noise.
    heights = gaussian_filter(np.maximum(z,0), .65, mode=('nearest','wrap'))
    coast = gaussian_filter(land.astype(float), 1.2, mode=('nearest','wrap'))
    result = dict(height_m=heights.astype('float32'), land=coast.astype('float32'), lat=lat, lon=lon)
    np.savez_compressed(target, **result)
    return result

def sample(grid, key, lat, lon):
    row = (grid['lat'][0]-np.asarray(lat))/.1
    col = ((np.asarray(lon)-grid['lon'][0])/.1) % 3600
    # Longitude padded explicitly; latitude must clamp, not wrap at the poles.
    a = np.pad(grid[key], ((0,0),(1,1)), mode='wrap')
    return map_coordinates(a, [np.clip(row,0,1799), col+1], order=1, mode='nearest')

def make_hemisphere(grid, north, radius, land_lift, mm_per_km, step):
    nlon = round(360/step)
    nr = round(90/step)
    lon = np.arange(nlon)*360/nlon - 180
    lat = np.arange(nr)*90/nr * (1 if north else -1)
    lo, la = np.meshgrid(lon,lat)
    coast = sample(grid,'land',la,lo)
    h = sample(grid,'height_m',la,lo)
    r = radius + coast*(land_lift + h*mm_per_km/1000)
    lr, pr = np.deg2rad(lo), np.deg2rad(la)
    vertices = np.stack([r*np.cos(pr)*np.cos(lr), r*np.cos(pr)*np.sin(lr), r*np.sin(pr)],axis=-1).reshape(-1,3)
    # South is rotated 180 degrees about X: both halves print cut-face down.
    if not north:
        vertices[:,1:] *= -1
    polelat = np.array([90 if north else -90.])
    polar_r = radius + sample(grid,'land',polelat,np.array([0.]))[0]*(land_lift+sample(grid,'height_m',polelat,np.array([0.]))[0]*mm_per_km/1000)
    vertices = np.vstack([vertices,[0,0,polar_r],[0,0,0]])
    i = np.arange((nr-1)*nlon).reshape(nr-1,nlon)
    j = np.roll(i,-1,axis=1)
    faces = np.concatenate([np.stack([i,j,i+nlon],-1).reshape(-1,3),
                            np.stack([j,j+nlon,i+nlon],-1).reshape(-1,3)])
    rim = np.arange(nlon)
    top = rim+(nr-1)*nlon
    faces = np.vstack([faces,np.column_stack([top,np.roll(top,-1),np.full(nlon,nr*nlon)]),
                       np.column_stack([np.roll(rim,-1),rim,np.full(nlon,nr*nlon+1)])])
    mesh = trimesh.Trimesh(vertices,faces,process=False)
    if not north:
        mesh.invert()
    assert mesh.is_watertight and mesh.is_winding_consistent and mesh.volume > 0
    return mesh

def check_stl(path):
    mesh = trimesh.load_mesh(path,process=True)
    c = len(trimesh.graph.connected_components(mesh.face_adjacency,min_len=1,nodes=np.arange(len(mesh.faces)) ))
    result = dict(triangles=len(mesh.faces), vertices=len(mesh.vertices), watertight=bool(mesh.is_watertight),
                  consistent_normals=bool(mesh.is_winding_consistent), components=c,
                  volume_mm3=float(mesh.volume), bounds_mm=mesh.bounds.tolist(), size_mm=mesh.extents.tolist(),
                  min_triangle_area_mm2=float(mesh.area_faces.min()), degenerate_faces=int((~mesh.nondegenerate_faces()).sum()))
    assert result['watertight'] and result['consistent_normals'] and c==1 and result['volume_mm3']>0
    assert result['degenerate_faces']==0 and result['min_triangle_area_mm2']>0
    return result

def main():
    p = argparse.ArgumentParser()
    p.add_argument('--diameter',type=float,default=150)
    p.add_argument('--land-lift',type=float,default=1.0)
    p.add_argument('--mm-per-km',type=float,default=1.)
    p.add_argument('--step',type=float,default=.3)
    args=p.parse_args()
    grid=prepare_grid()
    report={'parameters':vars(args),'data_sources':{
        'elevation':'https://www.ncei.noaa.gov/products/etopo-global-relief-model',
        'elevation_download':'https://www.ngdc.noaa.gov/thredds/dodsC/global/ETOPO2022/60s/60s_surface_elev_netcdf/ETOPO_2022_v1_60s_N90W180_surface.nc.dods?z[0:6:10799][0:6:21599]',
        'land':'https://www.naturalearthdata.com/downloads/10m-physical-vectors/10m-land/',
        'land_download':'https://naciscdn.org/naturalearth/10m/physical/ne_10m_land.zip'},
        'vertical_exaggeration':args.mm_per_km/(args.diameter/2/6371),
        'source_sampling_degrees':.1,'mesh_sampling_degrees':args.step,
        'physical_print_tested':False,'files':{}}
    hemis=[]
    for name,north in [('north',True),('south',False)]:
        print('Building',name,flush=True)
        m=make_hemisphere(grid,north,72,args.land_lift,args.mm_per_km,args.step)
        hemis.append(m)
    # Remove flat caps and merge exact shared equatorial vertices.
    shells=[]
    for i,m in enumerate(hemis):
        s=m.copy(); s.update_faces(~np.all(np.isclose(s.triangles[:,:,2],0,atol=1e-9),axis=1)); s.remove_unreferenced_vertices()
        if i: s.apply_transform(trimesh.transformations.rotation_matrix(np.pi,[1,0,0]))
        shells.append(s)
    globe=trimesh.util.concatenate(shells); globe.merge_vertices(); globe.remove_unreferenced_vertices()
    scale=args.diameter/globe.extents.max()
    globe.apply_scale(scale)
    radius=72*scale
    inner_radius=radius-1.2
    # Bottom opening is circular and remains accessible. Southern polar cap is omitted.
    cut_z=-float(np.sqrt(inner_radius**2-30**2))
    floor_z=cut_z
    inner=trimesh.creation.icosphere(subdivisions=6,radius=inner_radius)
    print('Hollowing and cutting access opening',flush=True)
    shell=trimesh.boolean.difference([globe,inner],engine='manifold')
    cutter=trimesh.creation.box(extents=[400,400,400]); cutter.apply_translation([0,0,cut_z+200])
    shell=trimesh.boolean.intersection([shell,cutter],engine='manifold')
    def cylinder(r,h,z):
        c=trimesh.creation.cylinder(radius=r,height=h,sections=256);c.apply_translation([0,0,z+h/2]);return c
    collar=trimesh.boolean.difference([cylinder(32.4,5,floor_z),cylinder(30,6,floor_z-.2)],engine='manifold')
    shell=trimesh.boolean.union([shell,collar],engine='manifold')
    key_slot=trimesh.creation.box(extents=[1.6,3.7,5.4]);key_slot.apply_translation([30.7,0,floor_z+2.5])
    shell=trimesh.boolean.difference([shell,key_slot],engine='manifold')
    shell.apply_translation([0,0,-floor_z])
    # The actual Antarctic polar cap becomes part of the removable stand.
    lower_box=trimesh.creation.box(extents=[400,400,400]);lower_box.apply_translation([0,0,cut_z-200])
    polar_cap=trimesh.boolean.intersection([globe,lower_box],engine='manifold')
    cap_shift=12-globe.bounds[0,2]
    polar_cap.apply_translation([0,0,cap_shift])
    seat_z=cut_z+cap_shift
    pocket_floor=seat_z-3
    # Gravity-seated removable stand: keyed alignment, no hidden hardware.
    base=cylinder(43,5,0)
    stem=cylinder(16,pocket_floor-6,5)
    plug=trimesh.boolean.difference([cylinder(29.65,4.6,seat_z-.2),cylinder(26,5.2,seat_z-.4)],engine='manifold')
    key=trimesh.creation.box(extents=[2,3,3.6]);key.apply_translation([29.85,0,seat_z+2])
    base=trimesh.boolean.union([base,stem,polar_cap,plug,key],engine='manifold')
    pocket=cylinder(24,30,pocket_floor)
    # Cable exits on the opposite side to the alignment key, at longitude 180.
    channel=trimesh.creation.box(extents=[50,7,3]);channel.apply_translation([-25,0,pocket_floor+1.5])
    base=trimesh.boolean.difference([base,pocket,channel],engine='manifold')
    # Representative physical fit test has exactly the globe collar's dimensions.
    trial=trimesh.boolean.difference([cylinder(32.4,5,0),cylinder(30,6,-.5)],engine='manifold')
    trial_slot=key_slot.copy();trial_slot.apply_translation([0,0,-floor_z])
    trial=trimesh.boolean.difference([trial,trial_slot],engine='manifold')
    blocks=[]
    for i,thickness in enumerate([1.2,2.2,4.2,7.2]):
        b=trimesh.creation.box(extents=[12,20,thickness]);b.apply_translation([i*12,0,thickness/2]);blocks.append(b)
    light_test=trimesh.boolean.union(blocks,engine='manifold')
    for name,obj in [('globe',shell),('base',base),('fit_ring',trial),('light_test',light_test)]:
        # Quantize before STL float32 export; eliminate sub-10-micron boolean slivers.
        obj.vertices=np.round(obj.vertices,5);obj.merge_vertices(digits_vertex=5)
        obj.update_faces(obj.nondegenerate_faces(height=1e-7));obj.remove_unreferenced_vertices()
        pieces=obj.split(only_watertight=False)
        if len(pieces)>1:
            pieces=sorted(pieces,key=lambda x:abs(x.volume),reverse=True)
            assert sum(abs(x.volume) for x in pieces[1:])<.01
            obj=pieces[0]
        path=ROOT/f'earth_{name}.stl';obj.export(path)
        report['files'][path.name]=check_stl(path)
        print(name,report['files'][path.name],flush=True)
    report['vertical_exaggeration']=args.mm_per_km*6371/72
    report['actual']={'ocean_radius_mm':radius,'ocean_wall_mm':1.2,'land_lift_mm':args.land_lift*scale,
        'relief_mm_per_km':args.mm_per_km*scale,'inner_radius_mm':inner_radius,
        'sphere_center_above_globe_bottom_mm':-floor_z,'globe_bottom_in_assembly_mm':seat_z,
        'opening_diameter_mm':60,'cap_diameter_mm':86,'plug_diameter_mm':59.3,
        'radial_fit_clearance_mm':.35,'plug_engagement_mm':4.4,'cable_channel_width_mm':7,
        'cable_channel_height_mm':3,'led_pocket_diameter_mm':48,'led_pocket_depth_mm':3,
        'led_pocket_floor_z_mm':pocket_floor,'polar_cap_min_z_mm':12,
        'alignment_key_size_mm':[2,3,3.6],'alignment_slot_size_mm':[1.6,3.7,5.4],
        'south_latitude_cut_inner_deg':float(np.rad2deg(np.arcsin(cut_z/inner_radius))),
        'max_land_elevation_in_sampled_grid_m':float(grid['height_m'].max()),
        'stand_attachment':'gravity seated, deliberately not retained when lifted',
        'max_globe_size_mm':float(shell.extents.max())}
    # Assembly: translate globe down onto the base. The locating collar has
    # 0.35 mm radial clearance and 0.6 mm height margin, no fasteners.
    assembled=shell.copy(); assembled.apply_translation([0,0,seat_z])
    overlap=trimesh.boolean.intersection([assembled,base],engine='manifold')
    report['assembly']={'overlap_volume_mm3':float(overlap.volume) if len(overlap.faces) else 0,
        'insertion_path':'straight vertical insertion; coaxial cylindrical clearance 0.35 mm',
        'hardware_required':False,'base_support_radius_mm':43,
        'internal_support_removal':'through 60 mm opening; break tree branches and remove with long pliers; physical trial required'}
    assert report['assembly']['overlap_volume_mm3']<1e-5
    # Check the complete straight assembly approach, including the keyed collar.
    for lift in [1,2.5,4.5,6,12]:
        test=assembled.copy();test.apply_translation([0,0,lift])
        collision=trimesh.boolean.intersection([test,base],engine='manifold')
        assert not len(collision.faces) or collision.volume<1e-5
    report['assembly']['checked_lift_positions_mm']=[0,1,2.5,4.5,6,12]
    report['assembly']['assembled_size_mm']=trimesh.util.concatenate([assembled,base]).extents.tolist()
    report['sha256']={f.name:hashlib.sha256(f.read_bytes()).hexdigest() for f in DATA.glob('*') if f.is_file() and f.suffix in ('.dods','.zip','.npz')}
    (ROOT/'geometry_validation.json').write_text(json.dumps(report,indent=2)+'\n')
    print('DONE',flush=True)

if __name__=='__main__': main()
