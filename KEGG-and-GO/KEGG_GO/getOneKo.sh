#!/usr/bin/env bash
# getOneKo.sh

# get the KEGG ortholog for one KEGG protein ID

# Retrieve from KEGG API and append result to kegg.txt

curl http://rest.kegg.jp/link/ko/hsa:348 1>ko.txt 2>ko.err

# how the parameters changed 

# instead of using the uniprot id like earlier, we used the returned KEGG ID from the first AIP, from the output our the previous script, called has:348, and we "linked" that with link and called teh KEGG Orthoogy database (ko.

# we have the KEGG Orthology data base ID with this script
