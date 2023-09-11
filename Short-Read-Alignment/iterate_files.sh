#!/usr/bin/env bash
# iterate_files.sh

# Specify the input path as an absolute path.
fastqPath="/scratch/AiptasiaMiSeq/fastq/"

# Specify the desired file suffix
leftSuffix="*R1.fastq"

for fastqFile in $fastqPath$leftSuffix
do
    echo $fastqFile
done
