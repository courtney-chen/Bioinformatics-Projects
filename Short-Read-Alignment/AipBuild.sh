#!/usr/bin/env bash
# AipBuild.sh

# build a GMAP database from the Aiptasia genome 
# -D indicates the directory in which to build the database
# . means to use the workign directory
# -d indicates the name of the database

# gmap_build is the command to build the index
# -D out put folder
# . corrent working directory
# -d folder to put
# after that is the input
# fna - fasta neucleo file 
# backslash multiple line

nice -n19 gmap_build -D . \
-d AiptasiaGmapDb \
/scratch/AiptasiaMiSeq/GCA_001417965.1_Aiptasia_genome_1.1_genomic.fna \
1>AipBuild.log 2>AipBuild.err &
# & run it in the background 
