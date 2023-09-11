#!/usr/bin/env python3
# bicycle.py

class bicycle():
    def __init__(self, color, diameter):
        self.color = color
        self.diameter = diameter 
    
    def area(self):
        return 3.14 * (self.diameter / 2) ** 2
    
    def paint(self, new_color):
        self.color = new_color
# like the first function, it has argument
# self is not anargument
# so we need to feed this function argument in order to run it
# after feeding the argument by doing paint("pink") 
# we run self.color to see the result 

bicycle1 = bicycle("red", 622)
print (bicycle1.area(), bicycle1.color)
# for area, it's the second function, and it's (self), so we do area()
# for color, we already have the self = bicycle1, color "red", 
# so we can directly do bicycle1.color

bicycle1.paint("pink")
print (bicycle1.color)
# we feed the paint new color "pink"
# then we just run bicycle1.color as we typed below the function
