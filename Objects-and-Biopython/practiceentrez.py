#!/usr/bin/env python3
# practiceentrez.py

from Bio import Entrez
Entrez.email = "chen.zhibi@northeastern.edu"
from Bio import SeqIO

with Entrez.efetch(db="nucleotide", rettype="gb", retmode="text", id="6273291") as handle:
    seq_record = SeqIO.read(handle, "gb")
print("%s with %i features" % (seq_record.id, len(seq_record.features)))
print(seq_record.id, len(seq_record.features))
print(seq_record.description)
