## Model simplification

mammals <- read.csv('../data/MammalData.csv')

# get logs of continuous variables
mammals$logLS <- log(mammals$LitterSize)
mammals$logBM <- log(mammals$AdultBodyMass_g)
mammals$logCvalue <- log(mammals$meanCvalue)

# reduce dataset to five key variables
mammals <- subset(mammals, select=c(logCvalue, logLS, logBM, TrophicLevel, GroundDwelling))

# remove the row with missing data
mammals <- na.omit(mammals)

# Way too complex model!
model <- lm(formula = logCvalue ~  logLS * logBM * TrophicLevel * GroundDwelling, data = mammals)
anova(model)
summary(model)


# A better starting point
model <- lm(logCvalue ~  (logLS + logBM + TrophicLevel + GroundDwelling)^2, data = mammals)
anova(model)
summary(model)
par(mfrow=c(2,2))
plot(model)

# try a set of successive simplifications
model2 <- update(model, . ~ . - TrophicLevel:GroundDwelling)
# is this an acceptable simplification?
anova(model, model2)
# yes - so what else could be dropped?
anova(model2)
summary(model2)

# an obvious choice 
model3 <- update(model2, . ~ . - logBM:TrophicLevel)
anova(model, model3)
anova(model3)
summary(model3)

# now we're down to marginally significant terms in anova
# but the effect sizes in summary are not significant
model4 <- update(model3, . ~ . - logLS:TrophicLevel)
anova(model, model4)
anova(model4)
summary(model4)

# anova table says this is highly significant, but 
# summary shows tiny effect and big standard errors
model5 <- update(model4, . ~ . - logLS:logBM)
anova(model, model5)
anova(model5)
summary(model5)

# Same with trophic level - finally removing a main effect!
model6 <- update(model5, . ~ . - TrophicLevel)
anova(model, model6)
anova(model6)
summary(model6)

model7 <- update(model5, . ~ . - logLS:GroundDwelling)
anova(model, model7)
# can't do that!
model7 <- update(model5, . ~ . - logBM:GroundDwelling)
anova(model, model7)
# can't do that either
# can't drop Ground Dwelling - appears in interactions

# so model 6 is the minimum adequate model. Just check the diagnostics
plot(model6)