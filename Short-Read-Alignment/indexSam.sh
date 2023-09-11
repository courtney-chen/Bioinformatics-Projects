#!/usr/bin/env bash
# indexSam

# this is the samtools index command

samtools index \
Aip02.sorted.bam \
1>Aip02.index.log 2>Aip02.index.err
