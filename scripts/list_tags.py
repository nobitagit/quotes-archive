#!/usr/bin/python
# cat demoFiles/archive.json | python thisfile.py > output.txt
import json
import sys;

try: jsonFile = json.load(sys.stdin)
except:
	sys.stderr.write('error parsing target JSON \n')
	sys.exit(2)

output = {}
output['data'] = []

for item in jsonFile:
	for tag in item['tags']:
		# print tag
		output['data'].append(tag)

print json.dumps(output)
