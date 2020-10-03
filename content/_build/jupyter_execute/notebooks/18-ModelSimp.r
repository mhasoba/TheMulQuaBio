mammals <- read.csv('../data/MammalData.csv')

#get logs of continuous variables
mammals$logLS <- log(mammals$LitterSize)
mammals$logCvalue <- log(mammals$meanCvalue)
mammals$logBM <- log(mammals$AdultBodyMass_g)

# reduce dataset to five key variables
mammals <- subset(mammals, select = c(logCvalue, logLS, logBM, 
TrophicLevel, GroundDwelling))

# remove the row with missing data
mammals <- na.omit(mammals)

str(mammals)

model <- lm(formula = logCvalue ~ logLS * logBM * TrophicLevel * GroundDwelling, data = mammals)

model <- lm(logCvalue ~ (logLS + logBM + TrophicLevel + GroundDwelling)^2, data = mammals)

anova(model)

drop.scope(model)

drop.scope(y ~ a + b + c + a:b)

drop.scope(y ~ a + b + c + a:b + b:c + a:b:c)

# a simple model
f <- y ~ a + b + c + b:c

# remove b:c from the current model
update(f, . ~ . - b:c)

# model g as a response using the same explanatory variables.
update(f, g ~ .)

model2 <- update(model, . ~ . - TrophicLevel:GroundDwelling)

anova(model, model2)

anova(model2)

drop.scope(model2)
