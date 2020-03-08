################################################################
################## Wrangling the Pound Hill Dataset ############
################################################################

# Wrangling the Pound Hill Dataset using comands from dplyr and tidyr

############# Load the dataset ###############
# header = false because the raw data don't have real headers
MyData <- as.matrix(read.csv("../Data/PoundHillData.csv",header = F)) 

# header = true because we do have metadata headers
MyMetaData <- read.csv("../Data/PoundHillMetaData.csv",header = T, sep=";", stringsAsFactors = F)

# requires
require(dplyr)
require(tidyr)


############# Inspect the dataset ###############
head(MyData)
dim(MyData)
dplyr::glimpse(MyData)
utils::View(MyData) 
utils::View(MyData)

############# Transpose #####m##########
# To get those species into columns and treatments into rows

table = dplyr::tbl_df(MyData) ##get in to tbl form, tidyverse hates dataframes and won't deal with matrices

transposed = table %>%
  gather(variables, values, 2:ncol(table)) %>% #simaltaneously gather and spread
  spread(V1, values)

utils::View(transposed) 

reordered = select(transposed, Cultivation, Plot, Block, Quadrat, 1:46, -variables)
utils::View(reordered) #much better

############# Replace species absences with zeros ###############
reordered[reordered == ""] = 0

############# Convert raw matrix to data frame ###############
#TempData <- as.data.frame(MyData[-1,],stringsAsFactors = F) #stringsAsFactors = F is important!
#colnames(TempData) <- MyData[1,] # assign column names from original data

############# Convert from wide to long format  ###############

longform = gather(reordered, key = "Species", value = "Count", 5:45) #gather species in to a single column

#set the column heads to factors
longform$Block <- factor(longform$Block)
longform$Plot <- factor(longform$Plot)
longform$Species <- factor(longform$Species)
longform$Cultivation <- factor(longform$Cultivation)
longform$Quadrat <- factor(longform$Quadrat)
longform$Count <- as.numeric(longform$Count)


with(longform, levels(Species))

str(longform)
head(longform)
dim(longform)
utils::View(longform)

############# Start exploring the data (extend the script below)!  ###############
