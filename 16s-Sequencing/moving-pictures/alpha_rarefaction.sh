#!/usr/bin/env python3
#alpha_rarefaction.sh

# qiime diversity alpha-rarefaction is used as the sampling depth visulizer

qiime diversity alpha-rarefaction \
  --i-table table.qza \
  --i-phylogeny rooted-tree.qza \
  --p-max-depth 4000 \
  --m-metadata-file sample-metadata.tsv \
  --o-visualization alpha-rarefaction.qzv
