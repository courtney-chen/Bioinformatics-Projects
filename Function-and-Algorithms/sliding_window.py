#!/usr/bin/env python
# slidng.py

import re
import sys

def sliding_window(k, string):
    # k and string are going to be the two argument that we input when running the file, k = length of the k-mer, string = nucleotide sequence input
    # for storing the kmers in the future
    """
    returns kmers from given string, chops off kmers in given number
    """
    kmers = []
    end = len(string) - k + 1
    # figure out the end of cutting the last kmer
    for start in range (0, end):
        kmers.append(string[start:start + k ])
    return kmers
    # collect all kmers that meet the k length requirement in string, the input 

def gc_content(kmers):
    """
    calculate the GC content
    """
    # we take out the kmers again, and figure out the gc content of each kmer
    #kmers = lower.kmers()
    # object called lower, a method 
    kmers = kmers.lower()
    gc = 0
    for nucleotide in kmers:
       # print (nucleotide)
        if nucleotide in ['c','g']:
            gc += 1
           # print(gc)
    # int - integer 
    # float - has digit 
   # print (float(gc)/float(len(kmers)))
    return (float(gc)/float(len(kmers))) # exit so check print before this point 
# print gc/len((kmers)

if __name__ == "__main__":
# check to make sure there are at least two arguements
    arg_count = len(sys.argv) - 1
    if arg_count < 2:
       raise Exception("This script requires 2 arguments: a kmer size and then a string")
       # a good habit 
    k = int (sys.argv[1])
    string = sys.argv[2] # this will be the file 
    # store the id, header 
    # use seqIO 
    # or skip the first line
    # still need the name for printing out 
    kmers = sliding_window (k, string)
    #result = gc_content(kmers)
    for i in range (len(kmers)):
        result = gc_content(kmers[i])
        print ("{}\t{:.2f}".format(kmers[i],result))
