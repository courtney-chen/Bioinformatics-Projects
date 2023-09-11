#!/usr/bin/env bash
# analyzeTrinity.sh

/usr/local/programs/trinityrnaseq-Trinity-v2.8.4/util/TrinityStats.pl \
trinity_out_dir/Trinity-GG.fasta

# line 4 is the path where TrinityStats.pl is located.
# TrinityStats.pl check the status of the trinity_out_dir output
