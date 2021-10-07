library(repr) ; options(repr.plot.res = 100, repr.plot.width = 6, repr.plot.height = 5) # Change plot sizes (in cm) - this bit of code is only relevant if you are using a jupyter notebook - ignore otherwise

load('../data/mammals.Rdata')

str(mammals)

mammals <- subset(mammals, select = c(GroundDwelling, TrophicLevel, 
logCvalue))
mammals <- na.omit(mammals)
str(mammals)

library(ggplot2)

ggplot(mammals, aes(x = TrophicLevel, y= logCvalue)) + 
    geom_boxplot() + facet_grid(. ~ GroundDwelling)

groups <- list(mammals$GroundDwelling, mammals$TrophicLevel)
groupMeans <- tapply(mammals$logCvalue, groups, FUN = mean)
print(groupMeans)

seMean <- function(x){
	# get rid of missing values
	x <- na.omit(x)
	# calculate the standard error
	se <- sqrt(var(x)/length(x))
	# tell the function to report the standard error
	return(se)
}

groups <- list(mammals$GroundDwelling, mammals$TrophicLevel)

groupMeans <- tapply(mammals$logCvalue, groups, FUN=mean)
print(groupMeans)

groupSE <- tapply(mammals$logCvalue, groups, FUN=seMean)
print(groupSE)

# get upper and lower standard error height
upperSE <- groupMeans + groupSE
lowerSE <- groupMeans - groupSE
# create barplot
barMids <- barplot(groupMeans, ylim=c(0, max(upperSE)), beside=TRUE, ylab= ' log C value (pg) ' , col=c( ' white ' , ' grey70 '))
arrows(barMids, upperSE, barMids, lowerSE, ang=90, code=3, len=0.05)

model <- lm(logCvalue ~ TrophicLevel + GroundDwelling, data = mammals)    

library(repr) ; options(repr.plot.res = 100, repr.plot.width = 7, repr.plot.height = 8) # Change plot size

par(mfrow=c(2,2))
plot(model)

library(repr) ; options(repr.plot.res = 100, repr.plot.width = 6, repr.plot.height = 5) # Change plot size back

anova(model)

summary(model) 

# data frame of combinations of variables
gd <- rep(levels(mammals$GroundDwelling), times = 3)
print(gd)

tl <- rep(levels(mammals$TrophicLevel), each = 2)
print(tl)

predVals <- data.frame(GroundDwelling = gd, TrophicLevel = tl)

predVals$predict <- predict(model, newdata = predVals)
print(predVals)

barMids <- barplot(groupMeans, ylim=c(0, 1.4), ylab='log C value (pg)', beside=TRUE, col=c('white', 'grey70'))

arrows(barMids, upperSE, barMids, lowerSE, ang=90, code=3, len=0.1)
points(barMids, predVals$predict, col='red', pch=12)
