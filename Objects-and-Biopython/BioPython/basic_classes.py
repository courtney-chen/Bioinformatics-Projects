#!/usr/bin/env python3
# basic_classes.py

# (1) the calss circle 3 methods and their correponding fields 
class circle ():

    def __init__ (self, color, radius):
        # initiate attributes the class -- color and radius 
        self.color = color
        self.radius = radius 

    def diameter (self):
        # the method to calculate the diameter using the attribute radius
        return self.radius * 2

    def circumfrence (self):
        # the method to calculate the circumfrence using diameter 
        return self.diameter() * 3.14

    def isRed (self):
        # to exam if the self.color is color 
        if self.color == "red":
            return True
        else:
            return False

test = circle ("red", 2)
print (test.diameter(),test.circumfrence())
print (test.isRed())


# (2) This is for calculating the year a studnet has been in school
class year_matriculated():
    def __init__ (self, school_year):
        # one attribute in this class, cuz we only input the year
        self.school_year = school_year

    def year(self):
        # this is for calculating the year a studnet has been in school
        return 2021 - self.school_year
    
year2016 = year_matriculated(2016)
print(year2016.year())

