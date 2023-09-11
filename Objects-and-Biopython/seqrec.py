#!/usr/bin/env python3
# seqrec.py

from Bio.Seq import Seq
simple_seq = Seq("GATC")

from Bio.SeqRecord import SeqRecord
simple_seq_r = SeqRecord(simple_seq, id = "My simple seq")
print (simple_seq_r)
print (simple_seq_r.id)
