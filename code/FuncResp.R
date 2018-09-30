#Analyze data on relationship between consumer-resource body sizes
#consumption rate from functional response data. 

library(ggplot2)
# library(minpack.lm)
require(graphics)

rm(list = ls())  # clear objects
graphics.off()  #close all open figures and graphics objects

IDir <- "../Data/"
ODir <- "../Results/"
dir.create(paste(ODir,'Figs',sep = ""),showWarnings = FALSE) #Create a directory for figures 

Data <- read.csv("../Data/CRat.csv")

# The relevant Columns: ID, N_TraitValue, ResDensity_SI_VALUE

########## Functions ##########

FuncResp <- function(a,h,q_,x_R){
	# The generalized functional response model 
	return(a * x_R^(q_ + 1)/(1+(a * h * x_R^(q_ + 1 ))))
}

GetStartVals <- function(tmpData){ 
	#Generates starting values for the NLLS algorithm
		
	h_Strt = 1
	q_strt = 0  
 
  MaxDen <- max(tmpData$ResDensity_SI_VALUE)
  MinDen <- min(tmpData$ResDensity_SI_VALUE)
  a_Strt = min(tmpData[which(tmpData$ResDensity_SI_VALUE == MinDen),"N_TraitValue"]/MinDen) 
 
  return(list(a_Strt = a_Strt, h_Strt = h_Strt, q_strt = q_strt))
}

########## Main Code ##########

OutRows <- length(unique(Data[, "ID"]))

IDs <- unique(Data$ID)

for (i in 1:length(IDs)){   # loop to run analysis for each data series separately
	tmpData <- subset(Data, ID == IDs[i])

	StartVals <- GetStartVals(tmpData)
	
	NLSfit <- NULL

#   browser()
# 	plot(tmpData$ResDensity_SI_VALUE,tmpData$N_TraitValue)

	NLSfit <- ...
                        
  ###### PLOTTING ######
	
	# Plot all the series

}	
