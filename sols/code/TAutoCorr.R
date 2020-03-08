# 	Tests  whether temperature of one year is significantly correlated 
# with the next year, then compares value with corrs distribution of 
# correlation coefficients.

###### Preliminaries ######
rm(list=ls())

KeyWest <- load("../data/KeyWestAnnualMeanTemperature.RData") # Load the data file

####### Functions #########

autocor_test <- function(data){ # function that calculates 1-step auto-correlation in a vector 

  # create two 1-step (e.g., year) shifted vectors:
  a <- data[2:length(data)]
  b <- data[1:length(data)-1]
  
  test_res <- cor.test(a,b, method="spearman")

# Spearman Rank Correlation test (to be conservative,  can also use Pearson's):
  return(test_res$estimate) 
}

Year <- ats$Year
Temp <- ats$Temp

# Plot of temperature over time
plot(Year, Temp, ylab = "Mean Annual Temperature", xlab = "Year")
lines(Year, Temp)

# Plot of 1-lagged temperatures

plot(Temp[1:length(Temp)-1], Temp[2:length(Temp)], ylab = expression(T[t+1]), xlab = expression(T[t]))

obs_rho <- autocor_test(Temp)

########################################################################

# randomly permuted years:

set.seed(3.14159265359) # sets seed so that each run is the same (pi!) 

runs <- 10000 # number of shuffles

ran_rhos <- vector(length = runs) # preallocate an empty vector

progba <- txtProgressBar(min = 0, max = 10000, style = 3) # Create progress bar for loop - just a little tweak (+ sounds like a famous football player)!

for(i in 1:runs) {
  tmp_Temp <- sample(Temp, s = length(Temp), replace=FALSE, prob=NULL)
  
  ran_rhos[i] <- autocor_test(tmp_Temp)

  setTxtProgressBar(progba, i) # add iteration to the progress bar
}

close(progba) # close the progress bar

max_ran_rho <- max(ran_rhos) # get maximum random correlation coefficient

# calculate proportion of random values >= than original coefficient:
j <- sum(ran_rhos >= obs_rho)

p_val <- j/runs

## Plot results and save as a .pdf:

pdf("../results/TAutoCorr_Results.pdf", 10, 10)
t <- density(ran_rhos)
plot(t, xlab = "Correlation Coefficient", main="Distribution of Null Correlation Coefficients", cex.lab=1.5, cex.main=2)
abline(v = obs_rho, col="red")
mylab1 = bquote("Observed Rho" == .(format(obs_rho, digits = 3)))
text(0.36, 1.3, labels=mylab1, srt=90, cex=1.3)
mylab2 = bquote("Approx p-value": .(p_val))
text(-0.3, 2.2, labels=mylab2, cex=1.1)
dev.off()
