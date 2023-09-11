#!/usr/bin/env python3
# seqcombo.py

from Bio import SeqIO # to read & write fasta file
from Bio.Seq import Seq # to write the sequence
from Bio.SeqRecord import SeqRecord # write the description/id of seq

simple_seq = Seq("GATC") 
# write the sequence with Seq
simple_seq_r = SeqRecord(simple_seq, id = "my simple seq")
# add detail about this seq, simple_seq is like "self" in the class
SeqIO.write(simple_seq_r, "simple_seq_r.fasta", "fasta")
# compile/write the seq and its detail to a fasta file
