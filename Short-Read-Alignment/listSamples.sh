#!/usr/bin/env bash
# listSamples.sh

# delete the echo in previous findSampleName.sh
# rename the variable that is name

fastqpath="/scratch/AiptasiaMiSeq/fastq/"
leftSuffix=".R1.fastq"

for leftInFile in $fastqpath*$leftSuffix
do
    pathRemoved="${leftInFile/$fastqpath/}"
    sampleName="${pathRemoved/$leftSuffix/}"
    echo $sampleName
done
