#!/usr/bin/env python3
# hello_you.py

import sys

def hello_you(name="you"): # the default one is you
    """
    returns hello you if no argumetn is given
    returns hello + the name if the name is given as an argument
    """
    return "Hello, " + name + "!"

if __name__ == "__main__":
    arg_count = len(sys.argv)

    if arg_count<2: # if there is no argument given, only print out hello you
        print(hello_you())
    else: # if first argument is given, the name will be printe dout
        name = sys.argv[1] # the first argumetn is the variable, name
        print(hello_you(name)) # print out the hello_you with the name equals to the first argument 

