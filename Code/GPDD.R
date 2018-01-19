
rm(list=ls())

load('../ReferencesAndDataFiles/GPDDFiltered.RData')

require(maps)

map()
points(gpdd$long,gpdd$lat,type='p',col='red')

