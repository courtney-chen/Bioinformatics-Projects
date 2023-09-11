#!/usr/bin/env python3
# BioPython_genbank.py

from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord
from Bio import SeqIO
from Bio import Entrez
Entrez.email = "chen.zhibi@northeastern.edu"
from Bio.SeqFeature import SeqFeature, FeatureLocation 

with Entrez.efetch(db="nucleotide", rettype = "gb", retmode = "txt", id = "515056") as handle1: 
    # use Entrez.efetch to get the file from from GenBank, and store it in "handle1", it is a SeqRecord object 
    seq_record1 = SeqIO.read(handle1,"gb")
    # read the handle1 with SeqIO.read
print(seq_record1.seq)
# print out only the seqeucne with .seq
print(seq_record1.features[0].type, seq_record1.features[0].location, seq_record1.features[0].strand)
# the features attributes has subfeatures, it a list of SeqFeature object. In this case, there are 5 items in features. We get the first general one out, and use its attribute .type, .location and .strand to print out their corresponding information.

# the code below does the same thing as the code above
print(seq_record1.seq)
with Entrez.efetch(db="nucleotide", rettype = "gb", retmode = "txt", id = "J01673.1") as handle2:
    seq_record2 = SeqIO.read(handle2,"gb")
print(seq_record2.seq)
print(seq_record2.features[0].type, seq_record2.features[0].location, seq_record2.features[0].strand)
