#!/usr/bin/env Python3
# get_metadata.sh

# get metadata from teh web 

curl -sL \
  "https://data.qiime2.org/2021.2/tutorials/fmt/sample_metadata.tsv" > \
  "sample-metadata.tsv"

