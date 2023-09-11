#!/usr/bin/env bash
# capture_output.sh


# Specify the input path as an absolute path.
fastqPath="/scratch/AiptasiaMiSeq/fastq/"

# Specify the desired file suffix
leftSuffix="*R1.fastq"

for fastqFile in $fastqPath$lefltSuffix
do
    echo $fastqFile 1>out.log 2>out.err
one
# 1> standard output or STDOUT
# onlt the last file was written to out.log
# because it's happending in a loop
# every pass through the loop empties the file and starts new
# 2> error output or STEERR
# sometimes bioinformatics program send informational messages to STDERR
# so having STDERR output doesnt mean program failed
# always check what is written to the files for STDOUT and STDERR to 
# understand what happened if we didn't get the expected output 

