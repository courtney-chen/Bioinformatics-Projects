#!/usr/bin/env Python3
# feature_table_freq.sh

# generate a summary of the merged FeatureTable[Frequency] artifact

qiime feature-table summarize \
  --i-table table.qza \
  --o-visualization table.qzv \
  --m-sample-metadata-file sample-metadata.tsv

