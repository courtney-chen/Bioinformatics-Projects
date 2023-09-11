#!/usr/bin/env Python3
# get_subsample_data.sh

curl -sL \
  "https://data.qiime2.org/2021.2/tutorials/atacama-soils/10p/forward.fastq.gz" > \
  "emp-paired-end-sequences/forward.fastq.gz"
