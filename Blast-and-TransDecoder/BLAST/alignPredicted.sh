#!/usr/bin/env bash
# alignPredicted.sh

blastp -query Trinity.fasta.transdecoder.pep \
    -db /blastDB/swissprot \
    -num_threads 4 \
    -evalue 1e-10 \
    -outfmt "6 qseqid sacc qlen slen length nident pident evalue stitle" \
    1>alignPredicted.txt 2>alignPredicted.err
