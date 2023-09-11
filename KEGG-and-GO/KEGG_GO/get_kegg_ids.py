#!/usr/bin/env python3
# get_kegg_ids.py

import subprocess

# Open the BLAST output

blast_output = open('alignPredicted.txt') 
# this txt from module 08 has to be in the working directory, so scp it to local machine 
sp_ids = {} # store accessions so we only query KEGG one

# open files for stdout and stderr
out = open ('kegg.txt', 'w') # this will be used for input into the next python program
err = open ('kegg.txt','w') 

# iterate over each line of BLAST output, one by one
for blast_line in blast_output:
    # remove new line character
    blast_line = blast_line.rstrip()

    # Split line on whitespace
    fields = blast_line.split()
    sp = fields[1]
    evalue = fields[7]

    # commentd out to make sure if we have the right variables 
    # print (sp + "\t" + evalue)
    # quit ()

    # check for e-value less than 1e-180
    if float(evalue) < float ("1e-180"):
        sp_ids[sp] = 1 # keep writing it over, all we care about is the key itself
print (f"found {len(sp_ids)} keys")

for sp in sp_ids:
    cmd = f"curl http://rest.kegg.jp/conv/genes/uniprot:{sp}"
    # f-string let's variable inside the string
    # print (cmd)
    result = subprocess.call(cmd, stdout=out, stderr=err, shell=True)

out.close()
err.close()
