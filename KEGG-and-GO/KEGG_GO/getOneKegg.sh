#!/usr/bin/env bash
# getOneKegg.sh

# get the SwissProt to KEGG converstion for one protein and write the results to a tabular file

# retrive from KEGGAIP and append result to kegg.txt


# this code uses the uniprot ID uniprot:P02649 to get the KEGG ID
curl http://rest.kegg.jp/conv/genes/uniprot:P02649 1>kegg.txt 2>kegg.err
