#!/usr/bin/env Python3
# feature_table.sh

# visualize the data using quiime metadata tabulate as feature table

qiime metadata tabulate \
  --m-input-file stats-dada2.qza \
  --o-visualization stats-dada2.qzv
