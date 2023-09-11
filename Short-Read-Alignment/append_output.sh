#!/usr/bin/env bash
# append_output.sh

# Specify the input path as an absolute path.
fastqPath="/scratch/AiptasiaMiSeq/fastq/"

# Specify the desired file suffix
leftSuffix="*R1.fastq"

# empty the log file before starting
echo -n '' >out2.log
# -n removes newline char from the output
# empty the err file before starting
echo -n '' >out2.err

# use >> to append and notice the difference 
for fastqFile in $fastqPath$leftSuffix
do
    echo $fastqFile 1>>out2.log 2>>out2.err
done
# 1> standard output, 2> error output
# >> append
