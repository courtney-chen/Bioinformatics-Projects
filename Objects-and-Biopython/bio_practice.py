#!/usr/bin/env python3
# bio_practice.py

from Bio.Seq import Seq
from Bio.Alphabet import IUPAC

my_seq1 = Seq("AGTACACTGGT")
print(my_seq1)

my_seq = Seq("GATCG")
for index, letter in enumerate(my_seq):
    print(index, letter)
# iterate over seq, count the number of each nucleotide

# Seq could be variety of "alphabets"
# some in bio.alphabet, some in IUPAC in bio,alphabet
# dna is unambiguous_dna kind

my_seq2 = Seq("AGTACACTGGT", IUPAC.unambiguous_dna)
print(my_seq2)
print(IUPAC.unambiguous_dna)
#Seq2('AGTACACTGGT', IUPACUnambiguousDNA())
print(my_seq2.alphabet)

