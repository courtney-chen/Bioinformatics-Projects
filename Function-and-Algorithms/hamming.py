#!/usr/bin/env python3
# hamming.py

import sys


def hamming (string1, string2):
    """
    returns the hamming distrance between two given strings
    """
    # we define this hamming function, with 2 arguments string 1 and 2
    distance = 0
    # create this distance to store the number, it will grow as the requirement met
    for i in range(len(string1)):
    # loop over the length of the string
        if string1[i] != string2[i]: # != is not equal
            distance += 1
            # add 1 value to distance, if these the character is not equal
    return distance
    # now the variable distance will have the new number stored after the loop
if __name__ == "__main__":
    arg_count = len(sys.argv) - 1
    if arg_count < 2:
        raise Exception("This script requires at least 2 arguments")
    string1 = sys.argv[1] # both arguments are seq
    string2 = sys.argv[2]
result = hamming(string1, string2)
print("{}\t{}\t{}".format(string1, result, string2))
