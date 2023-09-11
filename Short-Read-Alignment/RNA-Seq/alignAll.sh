#!/usr/bin/env bash
# alignAll.sh

inputPath="Paired/"
leftSuffix=".R1.fastq"
rightSuffix=".R2.fastq"
samOutPath="sam/"
samSuffix=".sam"
# important to make sure the output path exists
mkdir -p $samOutPath

#alingnAll function:

function alignAll {
    for trimmedFile in $inputPath*$leftSuffix
    # everything in front of "leftSuffix"
    do # remove everything so only the name is left
        removePath="${trimmedFile/$inputPath/}"
        sampleName="${removePath/$leftSuffix/}"
        nice -n19 gsnap \
        -A sam \
        -D . \
        -d AiptasiaGmapDb \
        -s AiptasiaGmapIIT.iit \
        $inputPath$sampleName$leftSuffix \
        $inputPath$sampleName$rightSuffix \
        1>$samOutPath$sampleName$samSuffix
done
}
alignAll 1>alignAll.log 2>alignAll.err
