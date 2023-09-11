#!/usr/bin/env Python3
# taxanomic_analysis.sh

# taxonomic analysis using the classifier to sequences 
# generates a visualization of the resulting mapping from sequence to taxonomy

qiime feature-classifier classify-sklearn \
  --i-classifier gg-13-8-99-515-806-nb-classifier.qza \
  --i-reads rep-seqs.qza \
  --o-classification taxonomy.qza

qiime metadata tabulate \
  --m-input-file taxonomy.qza \
  --o-visualization taxonomy.qzv
