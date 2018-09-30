rm(list=ls())

d<-read.csv('../ReferencesAndDataFiles/Nagyetal1999.csv')
head(d)

#dataframes behave like lists
d$Species
d$Species[200:203]
d[[1]]

#data also behave like matrices
d[3,2]
d[20:25,]
d[20:25,1:2]