#!/usr/bin/env python3
# fibonacci.py

import sys

def population(n, k):
    """
    returns the number of C. elegans on culture dish
    """
    # n is number of days
    # k is reproduction rate 
    daypop = [1,1]

    for i in range(2, n + 1):
        # the range has to start at 2 to compliment the formula below
        daypop.append(daypop[i - 1] + daypop[i - 2] * k)
        # this is for calculating the number of worms
        # between day n and day n+1, each animal that was alive on day n-1 produces k offspring 
        # population on day (n-1) + population on day (n-2) * growth rate k
    return daypop[n-1]

if __name__ == "__main__":
    n = int(sys.argv[1])
    k = int(sys.argv[2])
    # the argument input is gonna be integer, so we turn it to integer
    result = population(n,k)
    print(result)
