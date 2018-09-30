## load the needed libraries
require("ggplot2")

## load the data
myData <- as.data.frame(read.table("EcologicalArchives-E089-51-D1.csv",sep="\t"))

## dimension of the data
dim(myData)

## plotting prey vs predator mass
qplot(myData$Prey.mass,myData$Predator.mass)
