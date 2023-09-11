#!/usr/bin/env bash
# sortAlign.sh

# convert Aip02.sam to a sorted BAM version
# BAM is the binary version of SAM
# conver SAM to a sorted BAM file with samtools utility

samtools sort \
Aip02.sam \
-o Aip02.sorted.bam \
1>Aip02.sort.log 2>Aip02.sort.err

