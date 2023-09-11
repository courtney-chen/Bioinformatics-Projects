#!/usr/bin/env python3
# find_dmel_orf.py

from Bio import SeqIO
from Bio.Seq import Seq
import re

infile =  "/scratch/Drosophila/dmel-all-chromosome-r6.17.fasta"

for record in SeqIO.parse(infile, "fasta"):
    if re.match ("^\d{1}\D*$", record.id):
        dna=Seq(str(record.seq))
        rna=dna.transcribe()
        orf = re.search('AUG([AUGC]{3})+?(UAA|UAG|UGA)', str(rna)).group()
        final_orf=Seq(orf)
        protein = final_orf.translate()
        print (protein)
