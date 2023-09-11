#!/usr/bin/env bash
# get NGS.sh

# retrive the Rhodobacter sepheroides NGS reads

fastq-dump --split-files SRR522244 1>getNGS.log 2>getNGS.err
