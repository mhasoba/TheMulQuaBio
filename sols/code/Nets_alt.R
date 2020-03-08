#!/usr/bin/env Rscript

# DOCSTR: Generate network map of QMEE interactions between linked institutions
# AUTHOR: Samraat Pawar

library(igraph) # Load the igraph package

rm(list = ls())

# 	ICL	UoR	CEH	ZSL	CEFAS	Nonacademic/CASE
# ICL	0	0	10	9	5	70
# UoR		0	12	0	2	76
# CEH			0	0	0	6
# ZSL				0# plot(net, edge.arrow.size=1, edge.curved=.1,
#      vertex.color="orange", vertex.frame.color="#555555",
#      vertex.label=V(net)$Type, vertex.label.color="black",
#      vertex.label.cex=.7) 	0	28
# CEFAS					0	0
# Nonacademic/CASE						0

links <- read.csv("../Data/QMEE_Net_Mat_edges.csv", header=T, as.is=T)
nodes <- read.csv("../Data/QMEE_Net_Mat_nodes.csv", header=T, row.names = 1)

#Create graph object
net <- graph.adjacency(as.matrix(links), mode = "directed", weighted=TRUE, diag=F)
        
#Test plot
# plot(net, edge.arrow.size=1, edge.curved=.1,
#      vertex.color="orange", vertex.frame.color="#555555",
#      vertex.label=V(net)$Type, vertex.label.color="black",
#      vertex.label.cex=.7) 

# Generate colors based on partner type:
colrs <- c("green", "red", "blue")
V(net)$color <- colrs[nodes$Type]

# Set node size based on Number of PIs:
# V(net)$size <- V(net)$Pis*0.9

V(net)$size <- 50

# Set edge width based on weight (PhD Students):
E(net)$width <- E(net)$weight

#change arrow size and edge color:
E(net)$arrow.size <- 1
E(net)$edge.color <- "gray80"

E(net)$width <- 1+E(net)$weight/10

graphics.off()

svg("../Results/QMEENet.svg",width=7,height=7)

plot(net, edge.curved=0, vertex.label.color="black") 

legend(x=-1.5, y=-0.1, c("University","Hosting Partner", "Non-hosting Partner"), pch=21,
       col="#777777", pt.bg=colrs, pt.cex=2, cex=.8, bty="n", ncol=1)

dev.off()
