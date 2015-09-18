#!/usr/bin/python
# cat demoFiles/archive.json | python thisfile.py > output.txt
import json
import sys;

try: archive = json.load(sys.stdin)
except:
	sys.stderr.write('error parsing target JSON \n')
	sys.exit(2)

for index, item in enumerate(archive):
	item['_id'] = index

print json.dumps(archive)
