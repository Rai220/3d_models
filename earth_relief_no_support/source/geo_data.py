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

