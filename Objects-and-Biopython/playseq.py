#!/usr/bin/env python3
# playseq.py

from Bio.Seq import Seq
from Bio.Alphabet import generic_dna
from Bio.Alphabet import generic_rna

my_dna = Seq("AGTACACTGGT", generic_dna)
print(my_dna)
print(generic_dna)
# the sequence printed out is DNAAlphabet()

print(my_dna.complement())
# print out the complementary strand

print(my_dna.reverse_complement())
# print the reverse complementary strand

print(my_dna.transcribe())
# RNAAlphabet() is printed out

messenger_rna = Seq("AUGGCCAUUGUAAUGGGCCGCUGAAAGGGUGCCCGAUAG", generic_rna)
print(messenger_rna.translate())
