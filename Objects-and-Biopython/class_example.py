#!/usr/bin/env python3
# class_example.py

class bike():
    def __init__ (self, color, diameter):
        self.color = color
        self.diameter = diameter

    def change_color(self, newcol):
        self.color = newcol

    def half_diameter(self):
        return self.diameter / 2

bike1 = bike("red", 6)

print (bike1.color)
print (bike1.diameter)
print (bike1.half_diameter())

bike1.change_color("purple")
print (bike1.color)
