#!/usr/bin/env python3
# gc.py

from Bio.Seq import Seq
from Bio.Alphabet import IUPAC
from Bio.SeqUtils import GC

my_seq = Seq("GATCGATGGGCCTATATAGGATCGAAAATCGC")#, IUPAC.unambiguous_dna)
print (GC(my_seq))
