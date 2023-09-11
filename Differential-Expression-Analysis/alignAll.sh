#!/usr/bin/env bash
# alignAll.sh

inputPath="/scratch/SampleDataFiles/Paired/"
leftSuffix=".R1*fastq"
rightSuffix=".R2*fastq"
outDir="quant/"


function align {

    for trimmedFile in $inputPath"Aip"*$leftSuffix
    do
        removePath="${trimmedFile/$inputPath/}"
        sampleName="${removePath/$leftSuffix}"

        salmon quant -l IU is \
                -1 /scratch/SampleDataFiles/Paired/$sampleName$leftSuffix \
                -2 /scratch/SampleDataFiles/Paired/$sampleName$rightSuffix \
                -i AipIndex \
                --validateMappings \
                -o $outDir$sampleName
done
}

align 1>align.log 2>align.err &
