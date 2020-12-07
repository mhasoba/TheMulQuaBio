library(repr); options(repr.plot.res = 100, repr.plot.width = 6, repr.plot.height = 6) # Change plot sizes (in cm) - this bit of code is only relevant if you are using a jupyter notebook - ignore otherwise

mammals <- read.csv('../data/MammalData.csv', stringsAsFactors = T)
str(mammals)

summary(mammals)

plot(meanCvalue ~ TrophicLevel, data = mammals)

mammals$logCvalue <- log(mammals$meanCvalue)

seMean <- function(x){ # get standard error of the mean from a set of values (x)
    x <- na.omit(x) # get rid of missing values

    se <- sqrt(var(x)/length(x)) # calculate the standard error

    return(se)  # tell the function to return the standard error
}

trophMeans <- tapply(mammals$logCvalue, mammals$TrophicLevel, FUN = mean, na.rm = TRUE)

print(trophMeans)

trophSE <- tapply(mammals$logCvalue, mammals$TrophicLevel, FUN = seMean)

print(trophSE)

# get the upper and lower limits of the error bars
upperSE <- trophMeans + trophSE
lowerSE <- trophMeans - trophSE

# get a barplot
# - this function can report where the middle of the bars are on the x-axis
# - set the y axis limits to contain the error bars

barMids <- barplot(trophMeans, ylim=c(0, max(upperSE)), ylab = 'log C value (pg)')

# Now use the function to add error bars
# - draws arrows between the points (x0,y0) and (x1,y1)
# - arrow heads at each end (code=3) and at 90 degree angles

arrows(barMids, upperSE, barMids, lowerSE, ang=90, code=3)

#Load the gplots package
library(gplots)

# Get plots of group means and standard errors
par(mfrow=c(1,2))
plotmeans(logCvalue ~ TrophicLevel, data=mammals, p=0.95, connect=FALSE)
plotmeans(logCvalue ~ GroundDwelling, data=mammals, p=0.95, connect=FALSE)

trophicLM <- lm(logCvalue ~ TrophicLevel, data=mammals)

anova(trophicLM)

summary(trophicLM)

TukeyTroph <- TukeyHSD(aov(trophicLM))
print(TukeyTroph)

library(repr) ; options(repr.plot.res = 100, repr.plot.width = 5, repr.plot.height = 5) # Change plot size

par(las=1, mar=c(4,10,3,1))
# las= 1 turns labels horizontal
# mar makes the left margin wider (bottom, left, top, right)
plot(TukeyTroph)

factorTable <- table(mammals$GroundDwelling, mammals$TrophicLevel)
print(factorTable) 

chisq.test(factorTable)

save(mammals, file='../data/mammals.Rdata')
