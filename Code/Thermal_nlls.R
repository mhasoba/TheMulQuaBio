# Code to analyze intraspecific thermal response curves of metabolic traits

library(ggplot2)
library(minpack.lm)
require(graphics)

# require(nlme) #for nonlinear mixed effects model -- to do later

rm(list = ls())  # clear objects
graphics.off()  #close all open figures and graphics objects

IDir <- "../Data/"
ODir <- "../Results/"
dir.create(paste(ODir,'Figs',sep = ""),showWarnings = FALSE) #Create a directory for figures 

FileName <- "ThermRespData.csv"

Data <- as.data.frame(read.table(paste(IDir, FileName, sep = ""), 
header = TRUE, sep = ",", strip.white = TRUE))
# The relevant Columns: ID, OriginalTraitValue, ConTemp
                               
Data[, "ConTemp"] <- Data[, "ConTemp"] + 273.15  #convert to Kelvins

assign("k", 8.617 * 10^-5, envir = .GlobalEnv)  # assign Boltzmann constant (units of eV * K^???1) as a global 

########## Models to fit to the data ##########

# Schoolfield's model (approximation that ignores low-temp inactivation)
SchoolF <- function(const, E, E_D, T_pk, temp){
  # Parameters
  # const  : Normalisation constant (log transformed)
  # E      : Activation energy
  # E_D    : De-Activation energy 
  # T_pk   : T at which peak trait value is achieved
  # T_Ref  : Standardization (reference) temperature   
  T_Ref <- 5 + 273.15
  
  #~    return(const + log(exp((-E/k) * ((1/temp) - (1/T_Ref)))/(1 + exp((E_D/k) * (1/T_H - 1/temp))))) #Schoolfied model in original form (not with T_pk as an explicit parameter)
  
  return(const + log(exp((-E/k) * ((1/temp) - (1/T_Ref)))/(1 + (E/(E_D - E)) * exp(E_D/k * (1/T_pk - 1/temp)))))
}

# Schoolfield's model (approximation that ignores low-temp inactivation)
Boltz <- function(const, E, temp){
  # Parameters
  # const  : Normalisation constant (log transformed)
  # E      : Activation energy

  T_Ref <- 5 + 273.15
 
  return(const + log(exp((-E/k) * ((1/temp) - (1/T_Ref)))))
  
}

Briere <- function(const, Tm, T0, temp){
  
  return(const * temp *(temp - T0)*sqrt(Tm - temp)*(temp <= Tm)*(temp >= T0))
}
########## End Models to fit to the data ##########

GetStartVals <- function(tmpData){ #Generates starting values for the NLLS algorithm
  
	T_pk_strt <- max(tmpData[which(tmpData[, "OriginalTraitValue"] == 
	mean(max(tmpData[, "OriginalTraitValue"]), na.rm = TRUE)), 
	"ConTemp"],na.rm=TRUE)  # Use temperature of peak trait value (flux) as start value for fitted T_pk
  
  tmpData_L <- subset(tmpData, tmpData[, "ConTemp"] <= T_pk_strt)  #extract data upto peak value
  tmpData_H <- subset(tmpData, tmpData[, "ConTemp"] >= T_pk_strt)  #extract data after peak value
  
  const_strt <- log(min(tmpData$OriginalTraitValue))  #Take rate at min temp as starting values of constant
  
  if (length(unique(tmpData_L$ConTemp)) > 1 ) { #if there are enough temperature points
    x <- 1/(k * tmpData_L$ConTemp)
    y <- log(tmpData_L$OriginalTraitValue)
    fit <- summary(lm(y ~ x))
    E_strt <- abs(fit$coefficients[2]) #Take estimated from Arrhenius plot as start value of E_A
  } else{ E_strt <- 0.7}
  
  if (length(unique(tmpData_H$ConTemp)) > 1 ) { #if there are enough temperature points
    x <- 1/(k * tmpData_H$ConTemp)
    y <- log(tmpData_H$OriginalTraitValue)
    fit <- summary(lm(y ~ x))
    E_D_strt <- abs(fit$coefficients[2]) #Take estimated from Arrhenius plot as start value of E_A
  } else{ E_D_strt <- E_strt*1.1}
  
  #~    E_D_strt <- E_strt * 10
  
  return(list(const_strt = const_strt, E_strt = E_strt, E_D_strt = E_D_strt, T_pk_strt = T_pk_strt))
}

##### Nonlinear Least Squares fitting - MAIN CODE ######

OutRows <- length(unique(Data[, "ID"]))

IDs <- unique(Data$ID)

for (i in 1:length(IDs)){   # loop to run analysis for each thermal response separately
  
  tmpData <- subset(Data, ID == IDs[i])
   
  # If there are negative values, add the lowest value to each of the others, then remove that row
  AddedVal <- NA
  if(any(tmpData$OriginalTraitValue <= 0)){
    AddedVal <- min(tmpData$OriginalTraitValue)
    tmpData$OriginalTraitValue <- (tmpData$OriginalTraitValue - min(tmpData$OriginalTraitValue))
    tmpData <- tmpData[-which(tmpData$OriginalTraitValue == min(tmpData$OriginalTraitValue)),]
  }   

  StartVals <- GetStartVals(tmpData)
  
#~  plot(tmpData[,'ConTemp']- 273.15,tmpData[,'OriginalTraitValue']) #have look at this particular dataset
  
	NLSfit <- NULL
	NLSfit <- nlsLM(log(OriginalTraitValue) ~ SchoolF(const,E,E_D,T_pk,ConTemp), tmpData,
                        start = list(const=StartVals$const_strt, E = StartVals$E_strt, E_D = StartVals$E_D_strt, T_pk = StartVals$T_pk_strt), 
                        control = nls.lm.control(maxiter = 1000,ftol = .Machine$double.eps, ptol = .Machine$double.eps,maxfev = 1000),
                        lower = c(-Inf, 0, 0, 0), upper = c(Inf, Inf, Inf, 273.15 + 150))
  
  ###### PLOTTING ######
  
#   DataToPlot <- data.frame(Temperature = tmpData[, "ConTemp"] - 273.15, OriginalTraitValue = tmpData[, "OriginalTraitValue"])
  
#   p <- ggplot() + #Plot just the raw data
#     geom_point(data = DataToPlot, aes(x = Temperature, y = OriginalTraitValue), size = I(3), colour = "blue", alpha = 0.7) + 
#     xlab(expression(paste("Temperature (", degree, C, ")"))) + 
#     ylab(paste(tmpData[1, "StandardisedTraitName"], sep = "")) 
  
#   if (!is.null(NLSfit)){ # only if the nlls fitting converged
#     ########Plot fitted model/curve#########
#     temps <- 273.15 + seq(min(floor(tmpData$ConTemp - 273.15)), ceiling(max(tmpData$ConTemp - 273.15)), length = 200)
#     model <- exp(SchoolF(coef(NLSfit)["const"], coef(NLSfit)["E"], coef(NLSfit)["E_D"], coef(NLSfit)["T_pk"], temps))
#     ModelToPlot <- data.frame(Temperature = temps - 273.15, OriginalTraitValue = model)
#     #~ calculate R^2 in linear scale         
#     mod <- exp(SchoolF(coef(NLSfit)["const"], coef(NLSfit)["E"], coef(NLSfit)["E_D"], coef(NLSfit)["T_pk"], tmpData$ConTemp))
#     RSS <- sum((tmpData$OriginalTraitValue - mod)^2)
#     Results[i,"R^2"] <- 1 - (RSS / sum((tmpData$OriginalTraitValue - mean(tmpData$OriginalTraitValue))^2))
#     #~        Results[i,"R^2"] <- 1 - ( sum(SumStat$residuals^2) / sum((log(tmpData$OriginalTraitValue) - mean(log(tmpData$OriginalTraitValue)))^2)) #log scale R^2

#     p <- p +  annotate("text", x = mean(DataToPlot[, "Temperature"]), y = mean(DataToPlot[, "OriginalTraitValue"]), 
#              label = paste("E =", format(coef(NLSfit)["E"], digits = 2), "eV", ",\nT_pk =", format(coef(NLSfit)["T_pk"] - 273.15, digits = 2), "C", ",\nE_D =", format(coef(NLSfit)["E_D"], digits = 2), "eV", ",\nB0 =", format(exp(coef(NLSfit)["const"]), digits = 2), tmpData[1, "OriginalTraitUnit"], ",\nR^2 =", format(as.numeric(Results[i,"R^2"]), digits = 3))) 
             
#     if (as.numeric(Results[i, "R^2"]) > 0 ){ # add the curve only if R^2 is positive
#       p <- p + geom_line(data = ModelToPlot, aes(x = Temperature, y = OriginalTraitValue), colour = "red") 
#     }            
    
#   }
  
#   ggsave(filename = paste(ODir,'../Results/Figs/', IDs[i], ".svg", sep = ""), plot = p, height = 4, width = 4.2)
  
}

return
