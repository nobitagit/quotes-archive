#!/usr/bin/python
# cat demoFiles/archive.json | python thisfile.py > output.txt
import json
import sys;

try: jsonFile = json.load(sys.stdin)
except:
  sys.stderr.write('error parsing target JSON \n')
  sys.exit(2)

seen = {}

output = {}
output['data'] = []

for item in jsonFile:
  for tag in item['tags']:
    # print tag
    if tag in seen:
      seen[tag]['len'] += 1
      pos = seen[tag]['pos']
      output['data'][pos]['len'] += 1
    else:
      seen[tag] = {
        'len' : 1,
        'pos' : len(output['data'])
      }
      entry = {
       'name' : tag,
       'len' : 1
      }
      output['data'].append(entry)

print json.dumps(output)
