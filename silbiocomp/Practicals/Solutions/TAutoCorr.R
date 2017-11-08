# 	Tests  whether temperature of one year is significantly correlated 
# with the next year, then compares value with null distribution of 
# correlation coefficients.

rm(list=ls())

KeyWest <- load("../Data/KeyWestAnnualMeanTemperature.RData") # Load the data file

Year <- ats$Year
Temp <- ats$Temp
# basic plot of temperature over time
plot(Year, Temp, ylab = "Mean Annual Temperature", xlab = "Year")
lines(Year, Temp)

# create two vectors with alternating years
a <- Temp[c(rep(TRUE, 1), FALSE)]
b <- Temp[c(rep(FALSE, 1), TRUE)]

# Alternative method 1: a <- Temp[1:(2)!==(2)] 
#                       b <- Temp[1:(2)==(2)]
# Alternative method 2: a <- Temp[seq(1, length(Temp), 2)]
#                       b <- Temp[seq(0, length(Temp), 2)]

z <- cor.test(a,b, method="spearman") # Spearman Rank Correlation test

########################################################################

# randomly permuted years:

set.seed(3.14159265359) # sets seed so that each run is the same (pi!) 
null<-NULL # create an empty vector
progb <- txtProgressBar(min = 0, max = 10000, style = 3) # create progress bar for loop - just a little tweak!
for(i in 1:10000) {
  p <- sample(Temp, s=100, replace=FALSE, prob=NULL) 
  pa <- p[c(rep(TRUE, 1), FALSE)] # create two separate vectors containing subsequent years
  pb <- p[c(rep(FALSE, 1), TRUE)]
  x1 <- cor.test(pa, pb, method="spearman") # undertake Spearman Rank Correlation Test on each
  null <- c(null,x1$estimate[[1]]) # add the new result to the null vector (repeat 10,000 times)
  setTxtProgressBar(progb, i) # add iteration to the progress bar
}
close(progb) # close the progress bar

mn <- max(null) # define the highest maximum random correlation coefficient
t<-density(null)
# calculate proportion of random values greater than original coefficient:
j <- sum(z$estimate<null)
Result <- j/10000
Result

## Plot results and save as a .pdf:
pdf("../Results/TAutoCorr_Results.pdf", 10, 10)
plot(t, xlab = "Correlation Coefficient", main="Distribution of Null Correlation Coefficients", cex.lab=1.5, cex.main=2)
abline(v=z$estimate,col="red")
# ## to fill in all values to the right (greater than) the original coefficient/ab line
X1<-min(which(t$x >= z$estimate)) # defines minimum area for fill (at abline)
X2<-max(which(t$x < mn)) # fill in all values lower than the max
with(t, polygon(x=c(x[c(X1,X1:X2,X2)]), y=c(0, y[X1:X2], 0), col="red"))
legend(-0.63,2.75, fill="red", c("Values Greater than Original Rho"), cex=1.1)
mylabel = bquote("Original Rho" == .(format(z$estimate, digits = 3)))
text(0.35, 1.3, labels=mylabel, srt=90, cex=1.3)
mylabel2 = bquote("Values greater than original \n correlation coefficient (Rho)": .(j))
text(-0.43, 2.4, labels=mylabel2, cex=1.1)
mylabel3 = bquote("The proportion of values \n greater to those which are lower is": .(Result))
text(-0.38, 2.2, labels=mylabel3, cex=1.1)
text(-0.38, 2.05, "This means there is autocorrelation in the \n temperatures between subsequent years", cex=1.11)
dev.off()
