#!usr/bin/env Rscript

# Displays points from global data on population abundances on a world map

rm(list = ls())

# required packages

require(maps)

########## main code ##########

load("../Data/GPDDFiltered.RData")

pdf("../Results/GPDD_maps.pdf") #save the output in a pdf

map("world", fill=TRUE, col="white", bg="lightblue")
points(x=gpdd$long, y=gpdd$lat, col = gpdd$common.name , pch = 19, cex= 0.5)

dev.off()

########## Interpretation ##########

# The data are biased towards North America and Western Europe. Any analysis based on these data would be biased, especially towards the UK and the North American West Coast. 