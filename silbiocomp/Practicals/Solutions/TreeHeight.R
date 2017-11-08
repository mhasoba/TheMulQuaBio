# Calculates the height of trees from the angle of elevation and
#       the distance from the base using the trigonometric formula
# Arguments: degrees (the angle of elevation), distances (the distance from the base)
#			       height = distance * tan(radians)

# Assign the functions in TreeHeight as degrees and distance 
TreeHeight <- function(degrees, distance)
{
	radians <- degrees * pi / 180 # convert degrees into radians
	height <- distance * tan (radians) # trig
	print (paste("Tree height is:", height)) 
	return (height) # only inputting height into column
	}
TreeHeight(37,40)

# import csv
MyData <- read.csv("../Data/trees.csv", header=TRUE)

MyData["Tree.Height.m"] <- 0 # create new empty column

# output of function TreeHeight to be put in Tree.Height.m column
MyData$Tree.Height.m <-TreeHeight(MyData$Angle.degrees, MyData$Distance.m)

# write results to .csv file
write.csv(MyData, "../Results/TreeHeight.csv", row.names=FALSE) 
