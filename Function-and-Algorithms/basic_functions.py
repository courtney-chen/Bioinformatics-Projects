#!/usr/bin/env python3
# basic_functions.py

# 1. multiply (5,10)

def multiply(a, b): # define a function
    """
    returns the mutiplication result 
    """
    return a * b # the actual function that will be executed
x = multiply(5, 10) 
print("The value of multiply result is {}".format(x))
# print out the value of the function

# 2. hello_name that takes someone's name (a string) and returns "Hello, [Name]!". If no string is passed, return "Hello, you!".

def hello_name(name="you"): # if there is no name input, you is the  default
    """
    Returns hello you if there is no if no string is passed. Returns hello + the name if the name is passed 
    """
    if name == "you": # the default of the function and its output 
        return "Hello, you!"
    else: 
        return "Hello, " + name + "!"
print(hello_name("Akbar"))
print(hello_name())

# 3. less_than_ten takes in a list of numbers and returns only the number that are less than 10. for example, less_than_ten([1,5,81,10,8,2,102]) should return [1,5,8,2]) 

def less_than_ten(numbers):    
    """
    returns numbers that are smaller than 1o in the list
    """
    smallnumber = []
    for num in numbers:
        if num < 10:
            smallnumber.append(num)
    return smallnumber
print(less_than_ten([1, 5, 81, 10, 8, 2, 102]))
