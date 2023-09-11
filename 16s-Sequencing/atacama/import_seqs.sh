#!/usr/bin/env import_seqs.sh
# import_seqs.sh

curl -sL \
  "https://data.qiime2.org/2021.2/tutorials/atacama-soils/sample_metadata.tsv" > \
  "sample-metadata.tsv"

curl -sL \
  "https://data.qiime2.org/2021.2/tutorials/atacama-soils/10p/forward.fastq.gz" > \
  "emp-paired-end-sequences/forward.fastq.gz"

curl -sL \
  "https://data.qiime2.org/2021.2/tutorials/atacama-soils/10p/reverse.fastq.gz" > \
  "emp-paired-end-sequences/reverse.fastq.gz"

curl -sL \
  "https://data.qiime2.org/2021.2/tutorials/atacama-soils/10p/barcodes.fastq.gz" > \
  "emp-paired-end-sequences/barcodes.fastq.gz"

qiime tools import \
   --type EMPPairedEndSequences \
   --input-path emp-paired-end-sequences \
   --output-path emp-paired-end-sequences.qza
