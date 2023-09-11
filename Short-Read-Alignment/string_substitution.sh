#!/usr/bin/env bash
# string_substitution.sh

leftInFile="/scratch/AiptasiaMiSeq/fastq/Aip02.R1.fastq"
fastqPath="/scratch/AiptasiaMiSeq/fastq/"
fastqSuffix=".fastq"

# do string substitution in bash to remove or replace strings
# useful for deriving an output filename from an input filename

# Show the variable before substitution
echo "before: "$leftInFile
# characters within "" will be printed out as string
# things after the $ will be printed out as what it represents

# Replace $fastqPath with nothing
pathRemoved="${leftInFile/$fastqPath/}"
# leftInFile - fastqPath
echo "pathRemoved: "$pathRemoved
# remove the fastqPath content from leftInFile
# leftInFile - fastqPath

# Replace $fastqSuffix with nothing
suffixRemoved="${pathRemoved/$fastqSuffix/}"
echo "suffixRemoved: "$suffixRemoved
# pathRemoved - fastqSuffix = leftInFile - fastqPath - fastqSuffix

