#!/usr/bin/env bash
# indexAll.sh

bamPath="bam/"
bamSuffix=".sorted.bam"

function indexAll {
    for sortedFile in $bamPath*$bamSuffix
    do
        removePath="${sortedFile/$bamPath/}"
        sampleName="${removePath/$bamSuffix/}"
        nice -19 samtools index \
        $bamPath$sampleName$bamSuffix
    done
}
indexAll 1>indexAll.log 2>indexAll.err
