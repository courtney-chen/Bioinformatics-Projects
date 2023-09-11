#!/usr/bin/env bash
# trim.sh

# put the echo to show the commant rather than execute it
# what Nice do here is cut and paste the command to make sure I've implemented this correcty 
# after we run the script with echo, when everything is right
# delete echo and run the actual script 
# 1> standard output; 2> error output, sometimes program send informational messages to 2>, doesn't necessarily mean program failed

# nice -n19: shell command tellign the server to give this a lower priority than critical server functions
# to make sure we don't cause problems with the server when teh whole class is running resource-intensive processes at the same time
# trimmomatic is a java program
# simliar to python command to run .py, we run java jar command to run java jar files /usr/local/programs/Trimmomatic-0.36/trimmomatic-0.36.jar
# PE = we have paired-end reads
# -threads = how many server threads to use for this job, speficy 1 here
# generally it's more than 1 to devide teh execution over multiple threads to get the job done faster
# -phred33 = the quality encoding method used for the reads


function trim {
    nice -n19 java -jar /usr/local/programs/Trimmomatic-0.36/trimmomatic-0.36.jar PE \
    -threads 1 -phred33 \
    /scratch/AiptasiaMiSeq/fastq/Aip02.R1.fastq \
    /scratch/AiptasiaMiSeq/fastq/Aip02.R2.fastq \
    Aip02.R1.paired.fastq \
    Aip02.R1.unpaired.fastq \
    Aip02.R2.paired.fastq \
    Aip02.R2.unpaired.fastq \
    HEADCROP:0 \
    ILLUMINACLIP:/usr/local/programs/Trimmomatic-0.36/adapters/TruSeq3-PE.fa:2:30:10 \
    LEADING:20 TRAILING:20 SLIDINGWINDOW:4:30 MINLEN:36
}
trim 1>trim.log 2>trim.err 
