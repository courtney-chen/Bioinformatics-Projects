#!/usr/bin/env Python3
# get_metadata.sh

curl -sL \
  "https://data.qiime2.org/2021.2/tutorials/atacama-soils/sample_metadata.tsv" > \
  "sample-metadata.tsv"
