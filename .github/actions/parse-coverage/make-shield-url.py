from argparse import ArgumentParser
from urllib.parse import quote

CRITICAL = 2
WARNING = 1
OK = 0

COLORS = [ '43ad43', 'd68f0c', 'ff5252' ]

BASE_URL = 'https://img.shields.io/badge'

def get_status_from_percent(percent: int, warning_thresh: int, critical_thresh: int) -> int:
  if percent < critical_thresh:
    return CRITICAL
  elif percent < warning_thresh:
    return WARNING
  else:
    return OK

parser = ArgumentParser()
parser.add_argument('percents')
parser.add_argument('critical')
parser.add_argument('warning')
args = parser.parse_args()

percents = args.percents.split()
percents_label = 'L: {} F: {} B: {}'.format(*percents)

# color is based on worst of the percents
color_idx = max([ get_status_from_percent(int(p), int(args.warning), int(args.critical)) for p in percents ])

print(BASE_URL + '/' + quote(f'Coverage-{percents_label}-{COLORS[color_idx]}'))