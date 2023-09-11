#!/usr/bin/env python3
# sliding_window_fasta.py

import re
import sys

def sliding_window(k, string):
    """
    returns the kmers with given length
    """
    kmers = []
    # for storing the kmers in the future
    end = len(string) - k + 1
    # figure out the end of cutting the last kmer
    for start in range (0, end):
        kmers.append(string[start:start + k ])
    return kmers
    # collect all kmers that meet the k length requirement in string, the input 

def gc_content(kmers):
    """
    returns the GC content
    """
    # we take out the kmers again, and figure out the gc content of each kmer
    # object called lower, a method 
    kmers = kmers.lower()
    # turn all sequence to lower case to capture gc
    gc = 0
    for nucleotide in kmers:
       # count the gc in the kmers, add value when meets gc
        if nucleotide in ['c','g']:
            gc += 1
    return (float(gc)/float(len(kmers))) # exit so check print before this point 
# change the type of len(kmers) to float to do the math

if __name__ == "__main__":
    arg_count = len(sys.argv) - 1
    if arg_count < 2:
       raise Exception("This script requires 2 arguments: a kmer size and then a string")
    k = int (sys.argv[1]) # the first argument is the length of the kmer that we desire
    string = sys.argv[2]  # the sequence input is the second argumetn, in this case, the fast file is the second argument
    with open (string,'r') as file: # open the fasta file and read it
        for line in file.readlines():
            line = line.rstrip()
            if line.find('>') == 0:
                print (line) # we extract the header of the fast file by finding > 
            else: # dna sequence is here, the rest of the file except for the header is the sequence that we use as the second argument 
                kmers = sliding_window (k, line)
        #result = gc_content(kmers)
                for i in range (len(kmers)):
                    result = gc_content(kmers[i])
                    # count the gc content in each kmer
                    print ("{}\t{:.2f}".format(kmers[i],result))
                    #print(kmers[i])
