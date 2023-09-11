#!/usr/bin/env python3
# ancom.sh

# ANCOM assumes that less than 25% of the features are changing between groups
# ANCOM is implemented in the q2-composition plugin

qiime feature-table filter-samples \
  --i-table table.qza \
  --m-metadata-file sample-metadata.tsv \
  --p-where "[body-site]='gut'" \
  --o-filtered-table gut-table.qza

