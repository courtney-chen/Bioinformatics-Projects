#!/usr/bin/env Python3
# summarize.sh

# summary of the merged FeatureTable[Frequency] artiface

qiime demux summarize \
  --i-data fmt-tutorial-demux-1.qza \
  --o-visualization demux-summary-1.qzv
qiime demux summarize \
  --i-data fmt-tutorial-demux-2.qza \
  --o-visualization demux-summary-2.qzv
