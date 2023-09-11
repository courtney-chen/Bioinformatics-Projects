#!/usr/bin/env Python3
# filter_samples.sh

# An initial quality filtering process absed on quality scores is applied
# the implementation of the quality filtering approach

qiime quality-filter q-score \
 --i-demux demux.qza \
 --o-filtered-sequences demux-filtered.qza \
 --o-filter-stats demux-filter-stats.qza
