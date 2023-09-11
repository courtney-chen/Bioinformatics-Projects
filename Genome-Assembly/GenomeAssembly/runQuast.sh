#!/usr/bin/env bash
# runQuast.sh

quast.py Rhodo/scaffolds.fasta -o quast_output \
-R /data/METHODS/Fall/Module10/GCF_000012905.2_ASM1290v2_genomic.fna \
-t 4 \
-s \
-f \
1>runQuast.log 2>runQuast.err &
