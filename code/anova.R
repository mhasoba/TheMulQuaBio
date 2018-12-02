# LINEAR MODELS: ANALYSIS OF VARIANCE
# load and check the data
mammals <- read.csv('../data/MammalData.csv')
str(mammals)
summary(mammals)

# 1) Boxplots of C values by Trophic level
plot(meanCvalue ~ TrophicLevel, data= mammals)
mammals$logCvalue <- log(mammals$meanCvalue)
plot(logCvalue ~ TrophicLevel, data= mammals)

# 2) Boxplots of C values by Ground Dwelling
plot(meanCvalue ~ GroundDwelling, data= mammals)
plot(logCvalue ~ GroundDwelling, data= mammals)

# 3) Barplots/ CI plots

# get standard error of the mean from a set of values (x)
seMean <- function(x){
	# get rid of missing values
	x <- na.omit(x)
	# calculate the standard error
	se <- sqrt(var(x)/length(x))
	# tell the function to report the standard error
	return(se)
}

# barplot for trophic level

trophMeans <- tapply(mammals$logCvalue, mammals$TrophicLevel, FUN=mean)
print(trophMeans)
trophSE <- tapply(mammals$logCvalue, mammals$TrophicLevel, FUN=seMean)
print(trophSE)

# get the upper and lower limits of the error bars
upperSE <- trophMeans + trophSE
lowerSE <- trophMeans - trophSE

# get a barplot - this function can also report where the 
# centres of the bars are on the x-axis
# - set the y axis limits to contain the error bars
barMids <- barplot(trophMeans, ylim=c(0, max(upperSE)),
                   ylab='log C value (pg)')

# Now use the function to add error bars
# - draws arrows between the points (x0,y0) and (x1,y1)
# - arrow heads at each end (code=3) and at 90 degree angles
arrows(barMids, upperSE, barMids, lowerSE, ang=90, code=3)


# barplot for ground dwelling

groundMeans <- tapply(mammals$logCvalue, mammals$GroundDwelling, FUN=mean)
print(groundMeans)
groundSE <- tapply(mammals$logCvalue, mammals$GroundDwelling, FUN=seMean)
print(groundSE)

# get the upper and lower limits of the error bars
upperSE <- groundMeans + groundSE
lowerSE <- groundMeans - groundSE

# get a barplot - this function can also report where the 
# centres of the bars are on the x-axis
# - set the y axis limits to contain the error bars
barMids <- barplot(groundMeans, ylim=c(0, max(upperSE)), 
                   ylab='log C value (pg)')

# Now use the function to add error bars
# - draws arrows between the points (x0,y0) and (x1,y1)
# - arrow heads at each end (code=3) and at 90 degree angles
arrows(barMids, upperSE, barMids, lowerSE, ang=90, code=3)


# 4) Group mean plots
# Load the gplots package
library(gplots)
# Get plots of group means and standard errors
par(mfrow=c(1,2))
plotmeans(logCvalue ~ TrophicLevel, data=mammals, connect=FALSE)
plotmeans(logCvalue ~ GroundDwelling, data=mammals, connect=FALSE)


# 5) Linear models
trophicLM <- lm(logCvalue ~ TrophicLevel, data=mammals)
anova(trophicLM)
summary(trophicLM)

groundLM <- lm(logCvalue ~ GroundDwelling, data=mammals)
anova(groundLM)
summary(groundLM)

# 6) Diagnostic plots

par(mfrow=c(2,2))
plot(trophicLM)
plot(groundLM)

# 7) Tukey tests
TukeyTroph <- TukeyHSD(aov(trophicLM))
print(TukeyTroph)

# las= 1 turns labels horizontal
# mar makes the left margin wider (bottom, left, top, right)
par(las=1, mar=c(4,10,3,1)) 
plot(TukeyTroph)

TukeyGround <- TukeyHSD(aov(groundLM))
print(TukeyGround)
plot(TukeyGround)

# 8) Factor independence
factorTable <- table(mammals$GroundDwelling, mammals$TrophicLevel )
print(factorTable)
chisq.test(factorTable)

