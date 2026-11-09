"""Package only verified outputs, preserving the older supported version."""
from pathlib import Path
from datetime import datetime,timezone
import json,hashlib,zipfile
ROOT=Path(__file__).resolve().parents[1]
names=['globe','base','lower_trial','roof_trial','light_test']
g=json.loads((ROOT/'geometry_validation.json').read_text())
s=json.loads((ROOT/'slicing_validation.json').read_text())
t=json.loads((ROOT/'toolpath_validation.json').read_text())
assert set(s)==set(t)==set(names)
for name in names:
    f=g['files'][f'earth_{name}.stl']
    assert f['watertight'] and f['consistent_normals'] and f['components']==1 and f['volume_mm3']>0 and f['degenerate_faces']==0
    assert s[name]['return_code']==0 and len(s[name]['sliced_plates'])==1
    assert s[name]['sliced_plates'][0]['warning_message']==''
    assert t[name]['intrusions']==0 and t[name]['support_extrusion_moves']==0
    with zipfile.ZipFile(ROOT/f'P1S_Earth_no_support_{name}.3mf') as z:assert z.testzip() is None
assert 7<t['globe']['maximum_roof_free_span_mm']<9.5
assert 7<t['roof_trial']['maximum_roof_free_span_mm']<9.5
report={'checked_at_utc':datetime.now(timezone.utc).isoformat(),'printer':'Bambu Lab P1S',
        'assumed_nozzle_mm':.4,'assumed_material':'white PLA','slicer':'BambuStudio 02.08.02.61',
        'all_exported_stl_checks_passed':True,'assembly_geometry_checks_passed':True,
        'exact_delivery_projects_reloaded_and_sliced':True,'support_extrusion_moves':0,
        'cavity_and_functional_openings_checks_passed':True,'physical_print_tested':False,
        'physical_fit_tested':False,'actual_illumination_tested':False,
        'unsupported_roof_chord_mm':t['globe']['maximum_roof_free_span_mm'],
        'main_parts_estimate_seconds':sum(s[n]['sliced_plates'][0]['total_predication'] for n in ['globe','base']),
        'main_parts_estimate_grams':sum(s[n]['sliced_plates'][0]['filaments'][0]['total_used_g'] for n in ['globe','base']),
        'reports':['geometry_validation.json','slicing_validation.json','toolpath_validation.json']}
(ROOT/'validation.json').write_text(json.dumps(report,indent=2)+'\n')
files=[ROOT/'README_RU.md',ROOT/'surface_profiles.npz']
files+=list(ROOT.glob('earth_*.stl'))+list(ROOT.glob('P1S_*.3mf'))+list(ROOT.glob('*validation.json'))+list(ROOT.glob('*.png'))
files += [p for folder in ['source','data','presets'] for p in (ROOT/folder).iterdir()
          if p.is_file() and p.suffix not in ['.dylib','.pyc'] and p.name!='diagnose_paths.py']
files += [ROOT/f'check_{n}/{f}' for n in names for f in ['result.json','prepare.log','slice.log']]
files=sorted(set(files))
sums=''.join(hashlib.sha256(f.read_bytes()).hexdigest()+'  '+str(f.relative_to(ROOT))+'\n' for f in files)
(ROOT/'SHA256SUMS').write_text(sums);files.append(ROOT/'SHA256SUMS')
output=ROOT.parent/'Earth_150mm_P1S_NO_SUPPORTS.zip'
with zipfile.ZipFile(output,'w',compression=zipfile.ZIP_DEFLATED,compresslevel=6) as z:
    for f in files:z.write(f,Path(ROOT.name)/f.relative_to(ROOT))
with zipfile.ZipFile(output) as z:
    assert z.testzip() is None
    assert len(z.namelist())==len(files)
    for f in files:
        data=z.read(str(Path(ROOT.name)/f.relative_to(ROOT)))
        assert hashlib.sha256(data).digest()==hashlib.sha256(f.read_bytes()).digest()
print(json.dumps({'archive':str(output),'bytes':output.stat().st_size,'files':len(files),
                  'sha256':hashlib.sha256(output.read_bytes()).hexdigest(),'validation':report},indent=2))
