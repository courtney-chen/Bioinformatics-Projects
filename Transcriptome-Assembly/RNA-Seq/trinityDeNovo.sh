#!/usr/bin/env bash
# trinityDeNovo1.sh

leftReads="$(ls -q Paired/Aip*.R1.fastq)"
leftReads=$(echo $leftReads)
leftReads="${leftReads// /,}"
echo $leftReads

 rightReads="$(ls -q Paired/Aip*.R2.fastq)"
 rightReads=$(echo $rightReads)
 rightReads="${rightReads// /,}"
 echo $rightReads

 nice -n19 /usr/local/programs/trinityrnaseq-Trinity-v2.8.4/Trinity \
 --seqType fq \
 --output trinity_de-novo \
 --max_memory 10G --CPU 4 \
 --left $leftReads \
 --right $rightReads \
 1>trinity_dn.log 2>trinity_dn.err & 
