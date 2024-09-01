from argparse import ArgumentParser
import json

parser = ArgumentParser()
parser.add_argument('json')
parser.add_argument('field')
args = parser.parse_args()
data = json.loads(args.json)
print(data[args.field])