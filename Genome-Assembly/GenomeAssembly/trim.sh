#!/usr/bin/env bash
# trim.sh

# actually executes trim commands 

# Initialize variable to contain the directory of un-trimmed fastq files 
fastqPath="/home/chen.zhibi/BINF6308/module10-courtney-chen/GenomeAssembly/SRR522244"


# Initialize variable to contain the suffix for the left reads
leftSuffix="_1.fastq"
rightSuffix="_2.fastq"
pairedOutPath="Paired/"
unpairedOutPath="Unpaired/"

# Create the output directories
# -p check if the directory, if it exists, dont make
mkdir -p $pairedOutPath
mkdir -p $unpairedOutPath

# Loop through all the left-read fastq files in $fastqPath
function trim {
    for leftInFile in $fastqPath*$leftSuffix
# * means anything comes before leftSuffix 
    do
        pathRemoved="${leftInFile/$fastqPath/}"
        sampleName="${pathRemoved/$leftSuffix/}"
        echo $sampleName
        nice -n19 java -jar /usr/local/programs/Trimmomatic-0.36/trimmomatic-0.36.jar PE \
        -threads 1 -phred33 \
        $fastqPath$sampleName$leftSuffix \
        $fastqPath$sampleName$rightSuffix \
        $pairedOutPath$sampleName$leftSuffix \
        $unpairedOutPath$sampleName$leftSuffix \
        $pairedOutPath$sampleName$rightSuffix \
        $unpairedOutPath$sampleName$rightSuffix \
        HEADCROP:0 \
        ILLUMINACLIP:/usr/local/programs/Trimmomatic-0.36/adapters/TruSeq3-PE.fa:2:30:10 \
        LEADING:20 TRAILING:20 SLIDINGWINDOW:4:30 MINLEN:36
        # nice the location of the program PE is teh paired end read
        # first two lines are input file, cuz its PE read
        # last four are output
        # paired first, orphan second 
    done
}
trim 1>trim.log 2>trim.err
