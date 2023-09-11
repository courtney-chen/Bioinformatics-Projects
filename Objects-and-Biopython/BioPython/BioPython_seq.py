#!/usr/bin/env python3
# BioPython_seq.py

from Bio.Seq import Seq
# .Seq is the class under Bio.Seq object
from Bio.SeqRecord import SeqRecord
# Bio.SeqRecord contains more detailed information about a sequence
from Bio.Alphabet import generic_dna
# Bio,Alphabet specifies the type of the sequence
from Bio import SeqIO
# read and write FASTA files with SeqIO

my_seq = Seq("aaaatgggggggggggccccgtt", generic_dna)
# the class Seq stores sequence objet, alphabet is generic_dna
my_seqrecord = SeqRecord(my_seq, id = "#12345", description = "example 1")
# use SeqRecord to create a SeqRecord object contains a Seq from the line above, as well as attributes id and description
SeqIO.write(my_seqrecord, "BioPython_seq.gb", "genbank")
# use SeqIO -- SeqIO to write the file in GenBank format
print(my_seqrecord)
