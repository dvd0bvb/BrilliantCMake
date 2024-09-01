from argparse import ArgumentParser
from lcovparse import lcovparse
import json
import sys
from stats import stats

parser = ArgumentParser()
parser.add_argument('in_file')
args = parser.parse_args()

with open(args.in_file) as file:
  result = lcovparse(file.read())

lines = stats(0, 0)
functions = stats(0, 0)
branches = stats(0, 0)
for item in result:
  stats_obj = item['stats']
  lines.hit += int(stats_obj['hit'])
  lines.found += int(stats_obj['lines'])
  functions.hit += int(stats_obj['fn_hit'])
  functions.found += int(stats_obj['fn_found'])
  branches.hit += int(stats_obj['br_hit'])
  branches.found += int(stats_obj['br_found'])

json.dump({
  'lines': int(lines.hit / lines.found * 100),
  'functions': int(functions.hit / functions.found * 100),
  'branches': int(branches.hit / branches.found * 100)
}, sys.stdout)