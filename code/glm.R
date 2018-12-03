# CHAPTER 10. GENERALISED LINEAR MODELS

# 1) Load the data
colonies <- read.csv("../Data/PracData.csv")
str(colonies)

# 2) Look at all the data
boxplot(ColonyCount ~ Treatment, data=colonies)

colonies$logCC <- log(colonies$ColonyCount + 1)
boxplot(logCC ~ Treatment, data=colonies)

# 3) Check the variation i colony count across treatments
tapply(colonies$ColonyCount, colonies$Treatment, min, na.rm=TRUE)
tapply(colonies$ColonyCount, colonies$Treatment, max, na.rm=TRUE)

# 4) Subset the data down to control and NG
coloniesCN <- subset(colonies, Treatment %in% c('Control', 'NG'), drop=TRUE)
str(coloniesCN)
# remove the unused levels
coloniesCN <- droplevels(coloniesCN)
str(coloniesCN)

# 5) Look at the strains by treament
library(lattice)
bwplot(logCC ~ Strain | Treatment, data=coloniesCN)

# alternatively, get a barplot
tab <- tapply(coloniesCN$ColonyCount, list(coloniesCN$Treatment,
	          coloniesCN$Strain), mean, na.rm=TRUE)
barplot(tab, beside=TRUE)

# 6) A test linear model
modLM <- lm(logCC ~ Strain * Treatment, data=coloniesCN)
par(mfrow=c(2,2))
plot(modLM)

# 7) A Poisson glm
modPois <- glm(ColonyCount ~ Strain * Treatment, data=coloniesCN, family='poisson')
summary(modPois)

par(mfrow=c(2,2))
plot(modPois)

# 8) A quasipoisson glm
modQPois <- glm(ColonyCount ~ Strain * Treatment, data=coloniesCN, family='quasipoisson')
summary(modQPois)
anova(modQPois, test='F')
plot(modQPois)

# 9) Simplification?
drop.scope(modQPois)
modQPois2 <- update(modQPois, . ~ . - Strain:Treatment)
anova(modQPois, modQPois2, test='F')

# 10) predictions
df <- expand.grid(Strain=levels(coloniesCN$Strain), 
                  Treatment=levels(coloniesCN$Treatment))
predict(modQPois, newdata=df, type='response')


# 10) halo

table(Halo=colonies$HaloLawn, Strain=colonies$Strain, Treatment=colonies$Treatment)


