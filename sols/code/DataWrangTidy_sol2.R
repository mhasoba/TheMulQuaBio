#!/usr/bin/env Rscript

# DOCSTR: Perform data wrangling techniques on the Pound Hill Dataset using tidyverse functionality
# AUTHOR: Francis Windram (francis.windram@imperial.ac.uk)

################################################################
################## Wrangling the Pound Hill Dataset ############
################################################################

require(tidyr)
require(dplyr)

############# Load the dataset ###############
# header = false because the raw data don't have real headers
MyData <- as.matrix(read.csv("../Data/PoundHillData.csv",header = F)) 

# header = true because we do have metadata headers
MyMetaData <- read.csv("../Data/PoundHillMetaData.csv",header = T, sep=";", stringsAsFactors = F)

############# Inspect the dataset ###############
tbl_df(MyData)  # Tidyr head eqv
dim(MyData)
glimpse(MyData) # Tidyr str eqv
fix(MyData) #you can also do this
fix(MyMetaData)

############# Transpose ###############
# To get those species into columns and treatments into rows 
MyData <- t(MyData) 
tbl_df(MyData)
dim(MyData)

############# Replace species absences with zeros ###############
MyData[MyData == ""] = 0

############# Convert raw matrix to data frame ###############

TempData <- as.data.frame(MyData[-1,],stringsAsFactors = F) #stringsAsFactors = F is important!
colnames(TempData) <- MyData[1,] # assign column names from original data

############# Convert from wide to long format  ###############

MyWrangledData <- TempData %>% gather(., Species, Count, -Cultivation, -Block, -Plot, -Quadrat) %>%
    mutate(Cultivation = as.factor(Cultivation), Block = as.factor(Block), Plot = as.factor(Plot), Quadrat = as.factor(Quadrat), Count = as.numeric(Count))

glimpse(MyWrangledData)
tbl_df(MyWrangledData)
dim(MyWrangledData)

############# Start exploring the data (extend the script below) ###############

summary(MyWrangledData)
require(ggplot2)

p <- ggplot(MyWrangledData, aes(x = MyWrangledData$Block , y = MyWrangledData$Count, colour = MyWrangledData$Cultivation))
p <- p + geom_point(size=I(2))
p <- p + geom_jitter()
print(p)