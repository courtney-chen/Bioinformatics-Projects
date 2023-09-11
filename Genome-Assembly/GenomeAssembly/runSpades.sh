#!/usr/bin/env bash
# runSpades.sh

/usr/local/programs/SPAdes-3.14.1-Linux/bin/spades.py \
-1 /home/chen.zhibi/BINF6308/module10-courtney-chen/GenomeAssembly/Paired/_1.fastq -2 /home/chen.zhibi/BINF6308/module10-courtney-chen/GenomeAssembly/Paired/_2.fastq \
-t 4 \
-o Rhodo \
1>runSpades.log 2>runSpades.err &
