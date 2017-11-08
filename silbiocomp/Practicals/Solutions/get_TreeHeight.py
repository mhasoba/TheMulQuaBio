import math

def tree_height(degrees, distance):
    """ Returns the height of a tree given a distance from its base 
				and a measured angle to its top."""
    radians = degrees * math.pi / 180
    height = distance * math.tan(radians)
    return height

# Data are in the form: ID of individual, distance (m) and angle (degrees)
trees = [ ('A', 31.66, 41.28),
          ('B', 45.98, 44.53),
          ('C', 31.24, 25.14),
          ('D',	34.61, 23.33),
          ('E', 45.46, 38.34),
          ('F', 48.79, 33.59),
          ('H', 30.64, 29.66),
         ]

tree_height(trees)

# For each individual, print its ID and height

