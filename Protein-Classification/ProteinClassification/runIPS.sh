#!/usr/bin/env bash
# runIPS.sh

PATH="/usr/local/programs/jdk-11.0.9/bin/:$PATH"
export PATH

function scan {
    interproscan.sh \
    -f TSV \
    -o proteins.tsv \
    -goterms \
    --pathways \
    -dp \
    -cpu 4 \
    -i /home/chen.zhibi/BINF6308/module11-courtney-chen/ProteinClassification/proteins.fasta
}

scan 1>scan.log 2>scan.err
