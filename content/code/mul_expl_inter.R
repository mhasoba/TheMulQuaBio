# Multiple variables and interactions
# Run from the coursework project root with:
# Rscript code/mul_expl_inter.R

# Load the supplied data and recreate the derived column used in the ANOVA chapter.
mammals <- read.csv('data/mammal_data.csv', stringsAsFactors = TRUE)
mammals$logCvalue <- log(mammals$meanCvalue)
str(mammals)

dir.create('results', showWarnings = FALSE)
pdf('results/multiple_variables_interactions.pdf', 11, 8.5)

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

odonata <- read.csv('data/genome_size.csv', stringsAsFactors = TRUE)
odonata$genome_size <- as.numeric(as.character(odonata$GenomeSize))
odonata$BodyWeight <- as.numeric(as.character(odonata$BodyWeight))
odonata$logGS <- log(odonata$genome_size)
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

dev.off()
