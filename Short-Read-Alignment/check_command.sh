#!/usr/bin/env bash
# check_command.sh

# echo is a good way to check what the script is going to do before actually executing the command

# Specify the input path as an absolute path.
fastqPath="/scratch/AiptasiaMiSeq/fastq/"

# Print (echo) the variable
echo ls -lh $fastqPath
