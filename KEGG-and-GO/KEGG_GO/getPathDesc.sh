#!/usr/bin/env bash
# getPathDesc.sh

curl http://rest.kegg.jp/list/pathway/ko >ko 2>ko.err

# get the KEGG pathway descriptions for all KO pathways
