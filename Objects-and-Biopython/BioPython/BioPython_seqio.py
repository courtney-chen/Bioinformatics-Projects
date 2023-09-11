#!/usr/bin/env python3
# BioPython_seqio.py

from Bio import SeqIO
import sys
from Bio.SeqRecord import SeqRecord

def write_fasta (original, newname):
    for yeast_seq in SeqIO.parse(original, "fasta"):
    # use SeqIO.parse to parse the file
        newseq = yeast_seq.reverse_complement()
        # store the reverse complementary strand in newseq
        newseq_record = SeqRecord(newseq.seq, id = yeast_seq.id, description = "The reverse complementary sequence of yeast")
        # create the SeqRecord with more descriptive information about the strand, and store it in newseq_record
    return SeqIO.write(newseq_record, newname, "fasta")
    # use SeqIO.write to write the SeqRecord object to a fasta file, the file name is "newname"
if __name__ == "__main__":
# run the program
    original = sys.argv[1] 
    # the first argument is going to be "original", which is the original file name
    newname = sys.argv[2]
    # the second argument will be the new file name
    write_fasta(original, newname)
    # run this 
