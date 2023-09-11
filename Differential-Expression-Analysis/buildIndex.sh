#!/usr/bin/env bash
# buildIndex.sh

salmon index -t /scratch/SampleDataFiles/Trinity.fasta -i AipIndex k 25
# shell script to build a salmon index
# this is from the de-novo transcriptome in this fasta file
