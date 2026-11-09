"""Prepare Bambu Studio CLI presets from the installed official profiles."""
from pathlib import Path
import json

ROOT = Path(__file__).parent
OUT = ROOT/'lamp_paper_box'/'presets'
OUT.mkdir(parents=True, exist_ok=True)
PROFILES = Path('/Applications/BambuStudio.app/Contents/Resources/profiles/BBL')


def resolved(category, name, trail=()):
    assert name not in trail, (name, trail)
    path = PROFILES/category/(name+'.json')
    if not path.exists():
        candidates = list((PROFILES/category).rglob(name+'.json'))
        assert len(candidates) == 1, (name, candidates)
        path = candidates[0]
    src = json.loads(path.read_text())
    dst = resolved(category, src['inherits'], trail+(name,)) if src.get('inherits') else {}
    for include in src.get('include', []):
        dst.update(resolved(category, include, trail+(name,)))
    dst.update(src)
    dst.pop('include', None)
    dst['inherits'] = ''
    return dst


machine = resolved('machine', 'Bambu Lab P1S 0.4 nozzle')
machine['printer_settings_id'] = machine['name']
machine['curr_bed_type'] = 'Textured PEI Plate'
process = resolved('process', '0.20mm Standard @BBL X1C')
process.update({
    'name': '0.20mm Lamp paper box @P1S',
    'print_settings_id': '0.20mm Lamp paper box @P1S',
    'from': 'user',
    'wall_loops': '4',
    'bottom_shell_layers': '5',
    'top_shell_layers': '5',
    'sparse_infill_density': '15%',
    'sparse_infill_pattern': 'gyroid',
    'enable_support': '0',
    'brim_type': 'no_brim',
    'brim_width': '0',
    'seam_position': 'back',
    'outer_wall_speed': ['100', '100'],
    'inner_wall_speed': ['180', '180'],
    'initial_layer_speed': ['30', '30'],
    'initial_layer_infill_speed': ['60', '60'],
    'elefant_foot_compensation': '0.15',
    'print_sequence': 'by layer',
    'curr_bed_type': 'Textured PEI Plate',
})
filament = resolved('filament', 'Generic PLA')
filament['filament_settings_id'] = ['Generic PLA']
filament['filament_colour'] = ['#468D9A']
for name, data in [('p1s_04', machine), ('paper_box_020', process), ('generic_pla', filament)]:
    (OUT/(name+'.json')).write_text(json.dumps(data, ensure_ascii=False, indent=2)+'\n')
print('Prepared P1S 0.4 / 0.20 mm / Generic PLA presets from Bambu Studio resources.')
