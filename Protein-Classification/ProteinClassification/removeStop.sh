#!/usr/bin/env bash
# removeStop.sh

sed \
-e 's/*//' \
-e '1,5000w proteins.fasta' \
/home/chen.zhibi/BINF6308/module11-courtney-chen/ProteinClassification/BLAST/Trinity.fasta.transdecoder.pep
