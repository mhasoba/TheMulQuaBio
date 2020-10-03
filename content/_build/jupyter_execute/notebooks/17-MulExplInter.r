library(repr) ; options(repr.plot.res = 100, repr.plot.width=5, repr.plot.height= 5) # Change plot sizes (in cm) - this bit of code is only relevant if you are using a jupyter notebook - ignore otherwise

load('../data/mammals.Rdata')

model <- lm(logCvalue ~ TrophicLevel * GroundDwelling, data= mammals)
par(mfrow=c(2,2), mar=c(3,3,1,1), mgp=c(2, 0.8,0))
plot(model)   

anova(model)

summary(model)

# a data frame of combinations of variables
gd <- rep(levels(mammals$GroundDwelling), times = 3)
print(gd)

tl <- rep(levels(mammals$TrophicLevel), each = 2)
print(tl)

# New data frame
predVals <- data.frame(GroundDwelling = gd, TrophicLevel = tl)

# predict using the new data frame
predVals$predict <- predict(model, newdata = predVals)
print(predVals)

odonata <- read.csv('../data/GenomeSize.csv')

odonata$logGS <- log(odonata$GenomeSize)
odonata$logBW <- log(odonata$BodyWeight)

odonModel <- lm(logBW ~ logGS * Suborder, data = odonata)

summary(odonModel)

anova(odonModel)

summary(odonModel)

#get the range of the data:
rng <- range(odonata$logGS)
#get a sequence from the min to the max with 100 equally spaced values:
LogGSForFitting <- seq(rng[1], rng[2], length = 100)

print(LogGSForFitting)

#get a data frame of new data for the order
ZygoVals <- data.frame(logGS = LogGSForFitting, Suborder = "Zygoptera")

#get the predictions and standard error
ZygoPred <- predict(odonModel, newdata = ZygoVals, se.fit = TRUE)

#repeat for anisoptera
AnisoVals <- data.frame(logGS = LogGSForFitting, Suborder = "Anisoptera")
AnisoPred <- predict(odonModel, newdata = AnisoVals, se.fit = TRUE)

# plot the scatterplot of the data
plot(logBW ~ logGS, data = odonata, col = Suborder)
# add the predicted lines
lines(AnisoPred$fit ~ LogGSForFitting, col = "black")
lines(AnisoPred$fit + AnisoPred$se.fit ~ LogGSForFitting, col = "black", lty = 2)
lines(AnisoPred$fit - AnisoPred$se.fit ~ LogGSForFitting, col = "black", lty = 2)
