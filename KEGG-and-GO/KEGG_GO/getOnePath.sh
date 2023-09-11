#!/usr/bin/env bash
# getOnePath.sh

# After getting the KEGG Orthology database ID, we're looking into the pathway database at KEGG. 

# This script get the KEGG pathways associated with a KEGG orthology

# retrive pathways from the KEGG AIP and append result to path.txt

curl http://rest.kegg.jp/link/pathway/ko:K04524 1>path.txt 2>path.err

# used the returned KEGG Orthology ID ko: KO454 and "linked" that wieh link and called the KEGG pathway database path
