# This script calculates heights of trees using a csv file as input 
# The csv file should contain a list tree species name, of distance of 
# each tree from its base and angle to its top.
#
# Heights are calculated using the trigonometric formula 
#
# height = distance * tan(radians)
#
# ARGUMENTS:
# degrees      The angle of elevation in radians
# distance     The distance from base (e.g., meters)
#
# OUTPUT:
# csv file with the heights of the tree in same units as "distance"

TreeHeight <- function(degrees, distance)
  {radians <- degrees * pi / 180
  height <- distance * tan(radians)
  return (height)
}

arg1 <- commandArgs(TRUE) # get file name input-ed from command line 
Trees <- read.csv(arg1[1])

Tree.Height.m <- TreeHeight(distance = Trees[,2], degrees = Trees[,3]) # applies function to column data and saves it as vector
Trees[,"Tree.Height.m"] <- Tree.Height.m # add vector to data frame

#Output new data frame as a csv file.
write.csv(Trees, "../Results/treeheights.csv",row.names=FALSE)
