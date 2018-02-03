# Chapter 8: Multiple variables and interactions
# load and check the data
load('mammals.Rdata')
ls()
str(mammals)


# 1) interaction model
model <- lm(logCvalue ~ TrophicLevel * GroundDwelling, data= mammals)
par(mfrow=c(2,2))
plot(model)

anova(model)
summary(model)


# data frame of combinations of variables
gd <- rep(levels(mammals$GroundDwelling), times=3)
print(gd)
tl <- rep(levels(mammals$TrophicLevel), each=2)
print(tl)
predVals  <- data.frame(GroundDwelling=gd, TrophicLevel=tl)

# predict using the new data frame
predVals$predict <- predict(model, newdata=predVals)
print(predVals)

# 3) analysis of covariance

odonata <- read.csv('GenomeSize.csv')
odonata$logGS <- log(odonata$GenomeSize)
odonata$logBW <- log(odonata$BodyWeight)

odonModel <- lm(logBW ~ logGS * Suborder, data=odonata)
summary(odonModel)
anova(odonModel)

# 4) get predictions

# get the range of the data
rng  <- range(odonata$logGS)
# get a sequence of values spanning the range
span <- seq(rng[1], rng[2], length=100)

# get the predicted values
ZygoVals <- data.frame(logGS=span, Suborder='Zygoptera')
ZygoPred <- predict(odonModel, newdata=ZygoVals, se.fit=TRUE)

AnisoVals <- data.frame(logGS=span, Suborder='Anisoptera')
AnisoPred <- predict(odonModel, newdata=AnisoVals, se.fit=TRUE)

# plot the scatterplot of the data
plot(logBW ~ logGS, data=odonata, col=Suborder)

# add the predicted lines
lines(AnisoPred$fit ~ span, col='black')
lines(AnisoPred$fit + AnisoPred$se.fit ~ span, col='black', lty=2)
lines(AnisoPred$fit - AnisoPred$se.fit ~ span, col='black', lty=2)

lines(ZygoPred$fit ~ span, col='red')
lines(ZygoPred$fit + ZygoPred$se.fit ~ span, col='red', lty=2)
lines(ZygoPred$fit - ZygoPred$se.fit ~ span, col='red', lty=2)
