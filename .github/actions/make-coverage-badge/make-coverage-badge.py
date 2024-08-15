from argparse import ArgumentParser
from lcovparse import lcovparse
import requests

parser = ArgumentParser()
parser.add_argument('in_file')
parser.add_argument('out_file')
parser.add_argument('--warning', default=90, required=False)
parser.add_argument('--critical', default=85, required=False)
args = parser.parse_args()

with open(args.in_file) as file:
    result = lcovparse(file.read())

numLines = float(result[0]['stats']['lines'])
numLinesHit = float(result[0]['stats']['hit'])
percent = int(numLinesHit / numLines) * 100

# Might be nice to have some more fine grained info in the badge
# branches = float(result[0]['branches'])

print(args.critical, args.warning)

if percent < int(args.critical):
    color = '9c2c9c'
elif percent < int(args.warning):
    color = 'd68f0c'
else:
    color = '43ad43'

url = f'https://img.shields.io/badge/Coverage-{percent}%25-{color}'

resp = requests.get(url=url)
with open(args.out_file, 'wb') as file:
    file.write(resp.content)