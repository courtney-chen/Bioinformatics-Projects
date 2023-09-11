#!/usr/bin/env python3
# seqio.py

from Bio import SeqIO

for seq_record in SeqIO.parse("sample.fasta", "fasta"):
    print(seq_record.id)
    print(seq_record.seq)


