#!/usr/bin/env bash
# alignReads.sh

# this script align the sample Aip02 reads against the GMAP database
# -A tells gsnap what alignment format to produce (sam format)
# gsnap write the sam alignment info directly to STDOUT (>1)
function alignReads {
    nice -n19 gsnap \
    -A sam \
    -D . \
    -d AiptasiaGmapDb \
    -s AiptasiaGmapIIT.iit \
    Aip02.R1.paired.fastq \
    Aip02.R2.paired.fastq \
    1>Aip02.sam
}
alignReads 1>alignReads.log 2>alignReads.err
