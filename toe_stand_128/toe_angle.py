"""Convert measured widths to small-angle total toe. Positive means toe-in.

Example: python toe_angle.py --front 110 --rear 112.8 --zero-delta 0.1
Angles are NOT per wheel; this tool cannot identify steering center.
"""
import argparse
import math
from pathlib import Path
import json

p=argparse.ArgumentParser(description=__doc__)
p.add_argument('--front',type=float,required=True,help='Width between front noses, mm')
p.add_argument('--rear',type=float,required=True,help='Width between rear noses, mm')
p.add_argument('--zero-delta',type=float,default=0,help='Rear minus front on the parallel check block, mm')
p.add_argument('--span',type=float,default=json.loads((Path(__file__).parent/'parameters.json').read_text())['measurement_span'])
a=p.parse_args()
assert a.span>0 and a.front>0 and a.rear>0
delta=a.rear-a.front-a.zero_delta
equiv=math.degrees(delta/a.span)
print(f'Corrected R-F: {delta:+.3f} mm')
print(f'Total toe, small-angle equivalent: {equiv:+.3f} deg')
print('Positive: toe-in. Negative: toe-out. Not an individual wheel angle.')
if abs(delta/(2*a.span))<=1:
    print(f'If perfectly symmetric: total = {math.degrees(2*math.asin(delta/(2*a.span))):+.3f} deg')
if abs(equiv)>10:
    print('Outside this stand\'s design range; recheck alignment and readings.')
