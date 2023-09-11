#!/usr/bin/env python3
# sliding_window_fasta.py

import re
import sys
from Bio import SeqIO
'''
There are two major chunks for calculatin the GC content: one is to generate kmers, and the one to calculate GC content. Opening the file is another big part at the end.
'''

def get_kmers(k, string):
    '''
    This is for yeilding kmers. To get kmers, we need to variables, k -- the length of each kmers, and the whole chunk of sequence for execution -- string. 
    '''
    kmers = []
    # for storing the kmers in the future
    end = len(string) - k + 1
    # figure out the end of cutting the last kmer
    for start in range (0, end):
        kmers.append(string[start:start + k ])
    return kmers
    # collect all kmers that meet the k length requirement in string, the input 

def gc_content(kmers):
    '''
    for calculating GC content, we need kmers to know their GC contents.
    '''
    # object called lower, a method 
    kmers = kmers.lower()
    # turn all sequence to lower case to capture gc
    gc = 0
    for nucleotide in kmers:
       # count the gc in the kmers, add value when meets gc
        if nucleotide in ['c','g']:
            gc += 1
    return (float(gc)/float(len(kmers))) 
# change the type of len(kmers) to float to do the math

if __name__ == "__main__": # python will run this
    arg_count = len(sys.argv) - 1
    if arg_count < 2:
       raise Exception("This script requires 2 arguments: a kmer size and then a string")
    k = int (sys.argv[1]) 
    # the first argument is the length of the kmer that we desire
    filename = sys.argv[2]  
    # the sequence input is the second argumetn, in this case, the fast file is the second argument

    for dengue in SeqIO.parse(filename,"fasta"):
        print(dengue.description)
        # this is for printing out the title
        dengue_seq = dengue.seq
        kmers = get_kmers(k, dengue_seq)
        # we go back to get_kmers and let it know that in our case, k=k, string, the dna sequence = dengue_seq
        for i in kmers:
            result = gc_content(i)
            # we go back to gc_content to use this function to calculate the gc content in all kmers
            print ("{} \t{:.2f}".format(i,result))
