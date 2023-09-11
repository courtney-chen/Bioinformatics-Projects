#!/usr/bin/env python3
# get_ko.py

import subprocess

# Open the KEGG to KO mappings

kegg = open ('kegg.txt')
kegg_ids = {} # store KEGG IDs so we only query KEGG once

# Open files for stdout and stderr
out = open ('ko.txt','w') 
err = open ('ko.err','w')

# Iterate over lines of KEGG IDs
for kegg_line in kegg:
	# Remove line terminator
	kegg_line = kegg_line.rstrip()
	
	# split line on whitespace, turning into a list
	fields = kegg_line.split()
	
	if len(fields) >1:  
	# this will ignore the empty lines
		kegg = fields[1]
		kegg_ids[kegg] = 1 # store here so we only query KEGG once
print(f"found {len(kegg_ids)} keys")

for kegg_ids in kegg_ids:
	# print(keggg_id)
	cmd = f"curl http://rest.kegg.jp/link/ko/{kegg_ids}"
	# print(cmd) # good to test, before you actually run subprocess.call 
	result = subprocess.call(cmd, stdout=out, stderr=err, shell=True)

out.close()
err.close()
