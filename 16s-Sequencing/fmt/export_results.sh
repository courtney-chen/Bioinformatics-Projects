#!/usr/bin/env Python3
# export_results.sh

# export the data

qiime tools export \
    --input-path demux-subsample.qzv \
    --output-path ./demux-subsample/

qiime demux filter-samples \
    --i-demux demux-subsample.qza \
    --m-metadata-file ./demux-subsample/per-sample-fastq-counts.tsv \
    --p-where 'CAST([forward sequence count] AS INT) > 100' \
    --o-filtered-demux demux.qza
