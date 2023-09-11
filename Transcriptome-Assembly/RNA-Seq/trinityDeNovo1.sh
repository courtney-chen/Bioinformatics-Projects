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
