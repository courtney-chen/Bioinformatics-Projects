#!/usr/bin/env python3
# molecular_weight.py

from Bio.Seq import Seq
from Bio.Alphabet import generic_dna, generic_rna, generic_protein

print("%0.2f" % molecular_weight(Seq("AGC", generic_dna)))
