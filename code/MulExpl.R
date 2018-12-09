# Linear Models, Multiple explanatory variables
# load and check the data

load('../data/mammals.Rdata')
ls()
str(mammals)

# subset down to complete data
mammals <- subset(mammals, select=c(GroundDwelling, TrophicLevel, logCvalue))
mammals <- na.omit(mammals)
str(mammmals)

# 1) boxplots using subset
par(mfrow=c(1,2))
plot(logCvalue ~ TrophicLevel, data= mammals, subset=GroundDwelling=='No', main='Not ground dwelling')
plot(logCvalue ~ TrophicLevel, data= mammals, subset=GroundDwelling=='Yes', main='Ground dwelling')


# 2) boxplots using lattice
library(lattice)
bwplot(logCvalue ~ TrophicLevel | GroundDwelling, data= mammals)
bwplot(logCvalue ~ GroundDwelling | TrophicLevel , data= mammals)


# 3) Barplots and standard errors

# get standard error of the mean from a set of values (x)
seMean <- function(x){
	# get rid of missing values
	x <- na.omit(x)
	# calculate the standard error
	se <- sqrt(var(x)/length(x))
	# tell the function to report the standard error
	return(se)
}

# get a set of grouping variables
groups <- list(mammals$GroundDwelling, mammals$TrophicLevel)

# means and standard errors within groups
groupMeans <- tapply(mammals$logCvalue, groups, FUN=mean)
print(groupMeans)
groupSE <- tapply(mammals$logCvalue, groups, FUN=seMean)
print(groupSE)

# get the upper and lower limits of the error bars
upperSE <- groupMeans + groupSE
lowerSE <- groupMeans - groupSE

# get a barplot - this function can also report where the 
# centres of the bars are on the x-axis
# - set the y axis limits to contain the error bars
barMids <- barplot(groupMeans, ylim=c(0, max(upperSE)),
                   ylab='log C value (pg)', beside=TRUE, col=c('white', 'grey70'))

arrows(barMids, upperSE, barMids, lowerSE, ang=90, code=3, len=0.1)

# 4) creating the means plot figure
par(mfrow=c(1,2), mar=c(3,3,1,1), mgp=c(1.8, 0.7, 0))
plotmeans(logCvalue ~ TrophicLevel, data=mammals, subset=GroundDwelling=='Yes', connect=FALSE, ylim=c(0.8, 1.4))
text(0.6,1.35, 'a)')
plotmeans(logCvalue ~ TrophicLevel, data=mammals, subset=GroundDwelling=='No', connect=FALSE, ylim=c(0.8, 1.4))
text(0.6,1.35, 'b)')

# 5) multiple explanatory variable model
model <- lm(logCvalue ~ TrophicLevel + GroundDwelling, data= mammals)
par(mfrow=c(2,2))
plot(model)

anova(model)
summary(model)

# 6) predict

# data frame of combinations of variables
gd <- rep(levels(mammals$GroundDwelling), times=3)
print(gd)
tl <- rep(levels(mammals$TrophicLevel), each=2)
print(tl)
predVals  <- data.frame(GroundDwelling=gd, TrophicLevel=tl)

# predict using the new data frame
predVals$predict <- predict(model, newdata=predVals)
print(predVals)


# add those points to the barplot
barMids <- barplot(groupMeans, ylim=c(0, 1.4),
                   ylab='log C value (pg)', beside=TRUE, col=c('white', 'grey70'))

arrows(barMids, upperSE, barMids, lowerSE, ang=90, code=3, len=0.1)
points(barMids, predVals$predict, col='red', pch=12)

