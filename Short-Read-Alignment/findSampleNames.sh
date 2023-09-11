#!/usr/bin/env bash
# findSampleNames2.sh

#Initialize variable to contain the directory of un-trimmed fastq files 
fastqPath="/scratch/AiptasiaMiSeq/fastq/"

#Initialize variable to contain the suffix for the left reads
leftSuffix=".R1.fastq"

#Loop through all the left-read fastq files in $fastqPath
for leftInFile in $fastqPath*$leftSuffix
do
    echo $leftInFile
    #Remove the path from the filename and assign to pathRemoved
    pathRemoved="${leftInFile/$fastqPath/}"
    echo $pathRemoved
    #Remove the left-read suffix from $pathRemoved and assign to suffixRemoved
    suffixRemoved="${pathRemoved/$leftSuffix/}"
    echo $suffixRemoved
done
