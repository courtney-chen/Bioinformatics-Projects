#!/usr/bin/env python3
#build_composition_artifacts.sh

# This is the script for building the composition artifact which must be provided to add-pseudocount that will produce the FeatureTable[Composition] artifact.

qiime composition add-pseudocount \
  --i-table gut-table.qza \
  --o-composition-table comp-gut-table.qza
