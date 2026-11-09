"""Verify retained nuts, hardware insertion and full slider travel."""
import json
import numpy as np
from hardware_geometry import ROOT, P, load, cyl, nut, bolt

rows=[]
def check(name,tool,solids):
    hits={n:round((tool ^ s).volume(),7) for n,s in solids.items()}
    assert max(hits.values(),default=0)<.005,(name,hits)
    rows.append({'probe':name,'intersections_mm3':hits})

def retained(name,n,part,axis):
    # Both axial directions have solid bearing faces within the 0.4 mm pocket
    # slack. Insertion force cannot eject the nut into a rail or through a roof.
    volumes=[]
    for sign in (-1,1):
        shift=np.array(axis)*sign*.8
        vol=(n.translate(shift) ^ part).volume();assert vol>1,(name,sign,vol)
        volumes.append(round(vol,4))
    return {'nut':name,'blocking_material_in_both_axial_directions_mm3':volumes}

car=load('wheel_carriage_right');unit=load('wheel_unit')
car_top=P['wheel_carriage_top'];unit_z=car_top+P['bearing_thickness']
unit=unit.translate((0,0,unit_z));washer=load('bearing_washer').translate((0,0,car_top))
rail=load('crossrail');spine=load('spine');foot=load('foot');saddle=load('axle_saddle')
cs_inset=(P['countersink_diameter']-6)/2
pivot_top=unit_z+P['platform_thickness']-cs_inset
pivot=bolt(pivot_top,16);pivot_nut=nut(P['pivot_nut_top']-2.4,angle=30)
check('pivot M3x16; complete head, shaft and tip',pivot,{'carriage':car,'wheel_unit':unit,'washer':washer,'rail':rail})
check('pivot nut',pivot_nut,{'carriage':car,'rail':rail})
retention=[retained('pivot',pivot_nut,car,[0,0,1])]
for x in np.linspace(-19,0,20):check(f'pivot nut insertion x={x:.1f}',pivot_nut.translate((x,0,0)),{'carriage':car})
# Entire screwdriver approach from above the wheel pad.
check('pivot screwdriver approach',cyl(2.5,30,pivot_top+.3),{'wheel_unit':unit})

beam=rail.translate((0,0,P['axle_saddle_top']))
rot_saddle=saddle.rotate((0,0,90));rot_spine=spine.rotate((0,0,90))
mount_top=P['axle_saddle_top']+P['rail_height']-cs_inset
mount_hardware={}
for x in (-P['mount_x'],P['mount_x']):
    b=bolt(mount_top,16).translate((x,0,0));n=nut(P['saddle_nut_top']-2.4,angle=30).rotate((0,0,90)).translate((x,0,0))
    check(f'crossrail M3x16 x={x}',b,{'saddle':rot_saddle,'beam':beam,'spine':rot_spine})
    check(f'crossrail nut x={x}',n,{'saddle':rot_saddle,'beam':beam,'spine':rot_spine})
    retention.append(retained(f'crossrail {x}',n,rot_saddle,[0,0,1]))
    for y in np.linspace(-19,0,20):check(f'crossrail nut insertion {x}/{y:.1f}',n.translate((0,y,0)),{'saddle':rot_saddle})
    mount_hardware[f'mount_bolt_{x}']=b.translate((0,0,-P['axle_saddle_top']))
    mount_hardware[f'mount_nut_{x}']=n.translate((0,0,-P['axle_saddle_top']))

foot_top=P['foot_height']+P['rail_height']-cs_inset
foot_bolt=bolt(foot_top,16);foot_nut=nut(P['foot_nut_depth']-2.4)
check('foot through M3x16',foot_bolt,{'foot':foot,'rail':rail.translate((-P['foot_mount_x'],0,P['foot_height']))})
check('foot underside nut',foot_nut,{'foot':foot})
# Nut is intentionally open below: assemble upside down and hold it for first
# thread. Tightening draws it into a 7.4 mm shoulder, not out of the socket.
assert (foot_nut.translate((0,0,.8)) ^ foot).volume()>1
check('foot full through bore',cyl(1.5,P['foot_height']+2,-1),{'foot':foot})
assert foot_top-16>.5

clamp_nut=nut(angle=30).rotate((90,0,0)).translate((P['clamp_x'],P['clamp_nut_outer_y'],P['clamp_z']))
clamp=bolt(0,10).rotate((-90,0,0)).translate((P['clamp_x'],17.1,P['clamp_z']))
for name,part in [('wheel_carriage',car),('axle_saddle',saddle),('fit_slider',load('fit_slider'))]:
    check(name+' M3x10 clamp',clamp,{name:part,'rail':rail})
    check(name+' clamp nut',clamp_nut,{name:part,'rail':rail})
    retention.append(retained(name+' clamp',clamp_nut,part,[0,1,0]))
    for x in np.linspace(10,0,11):check(f'{name} clamp nut insertion {x:.1f}',clamp_nut.translate((x,0,0)),{name:part})
# Contact appears before the countersunk head bottoms out. The solid rail is
# only intersected in this diagnostic contact probe, not a delivered assembly.
assert (clamp.translate((0,-.3,0)) ^ rail).volume()>.001
assert (clamp.translate((0,-.3,0)) ^ car).volume()<.005

# Full travel with installed crossrail bolts, nuts and feet, not merely a bare
# guide segment. Slider sweep extends further than the actual design range.
fixed={'rail':rail,**mount_hardware}
for side in (-1,1):
    x=side*P['foot_mount_x']
    fixed[f'foot_{side}']=foot.translate((x,0,-P['foot_height']))
    fixed[f'foot_bolt_{side}']=foot_bolt.translate((x,0,-P['foot_height']))
    fixed[f'foot_nut_{side}']=foot_nut.translate((x,0,-P['foot_height']))
fixed['saddle']=rot_saddle.translate((0,0,-P['axle_saddle_top']))
moving=car+unit+washer+pivot+pivot_nut+clamp.translate((0,1,0))+clamp_nut
sweep_max=0
for x in np.linspace(-65,65,131):
    obj=moving.translate((x,0,0))
    for name,s in fixed.items():
        v=(obj ^ s).volume();assert v<.005,('sweep',x,name,v)
        sweep_max=max(sweep_max,v)

report={'hardware_assumptions':{'M3_shaft_diameter':3.,'nut_af':5.5,'nut_height':2.4,
        'head_diameter':6.,'head_angle_deg':90,'screw_length_includes_head':True,
        'available_screw_lengths_mm':[10,16]},
        'bill_of_hardware':{'M3x10_countersunk':6,'M3x16_countersunk':12,'M3_nut':18},
        'pivot_tip_clearance_above_rail_mm':round(pivot_top-16-P['rail_height'],3),
        'pivot_tip_clearance_above_guide_roof_mm':round(pivot_top-16-P['rail_height']-P['guide_top_clearance'],3),
        'pivot_nut_floor_thickness_mm':P['pivot_nut_bottom']-P['rail_height']-P['guide_top_clearance'],
        'pivot_nut_roof_thickness_mm':car_top-P['pivot_nut_top'],
        'foot_nut_bearing_shoulder_mm':P['foot_height']-P['foot_nut_depth'],
        'foot_screw_tip_above_table_mm':round(foot_top-16,3),
        'head_recess_below_rail_top_mm':round(cs_inset,3),
        'nut_retention':retention,
        'full_crossrail_sweep':{'range_mm':[-65,65],'positions':131,'maximum_intersection_mm3':sweep_max,
                               'installed_mounting_hardware_included':True,'clamp_released':True},
        'physical_hardware_fit_verified':False,'checks':rows}
(ROOT/'hardware_validation.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
v=json.loads((ROOT/'geometry_validation.json').read_text());v['hardware_validation']=report
(ROOT/'geometry_validation.json').write_text(json.dumps(v,ensure_ascii=False,indent=2)+'\n')
print(f'{len(rows)} hardware/insertion probes; 131 assembled slider positions; axial nut retention passed.')
