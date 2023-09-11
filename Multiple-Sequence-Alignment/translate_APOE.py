#!/usr/bin/env python3
# transcript_APOE.py

from Bio import SeqIO
from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord
import sys

filename = open("APOE_refseq_transcript.fasta","r")

records = []
for record in SeqIO.parse(filename, "fasta"):
        aaseq = record.translate()

        #new_record = SeqRecord(aaseq.seq, id = record.id, description = "aminoacid sequence")
        records.append(aaseq)
SeqIO.write(records, "apoe_aa.fasta", "fasta")
