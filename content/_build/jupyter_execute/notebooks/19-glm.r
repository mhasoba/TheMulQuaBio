library(repr); options(repr.plot.res = 100, repr.plot.width = 5, repr.plot.height = 4) # Change plot sizes (in cm) - this bit of code is only relevant if you are using a juyter notebook - ignore otherwise

par(mfrow=c(1,2)) 
hist(rpois(1000, lambda = 1),xlab = "Value", main="")
hist(rpois(1000, lambda = 100),xlab = "Value", main="")

par(mfrow=c(1,2)) 
hist(rbinom(1000, 1, 0.5),xlab = "Value", main="")
hist(rbinom(1000, 100, 0.5),xlab = "Value", main="")

par(mfrow=c(1,2)) 
hist(rgamma(1000,1,1),xlab = "Value", main = "")
hist(rgamma(1000,100,1),xlab = "Value", main = "")

colonies <- read.csv("../data/PracData.csv")
str(colonies)
head(colonies)

boxplot(ColonyCount ~ Treatment, data=colonies)

colonies$logCC <- log(colonies$ColonyCount + 1)
boxplot(logCC ~ Treatment, data=colonies)

tapply(colonies$ColonyCount, colonies$Treatment, min, na.rm = TRUE)

tapply(colonies$ColonyCount, colonies$Treatment, max, na.rm = TRUE)

MyData1 <- rep(c("Control", "NG", "NG"), 4)
MyData1

MyData1 %in% c("Control", "NG")

 MyData1 == "Control" |  MyData1 == "NG"

MyData1 == c("Control", "NG")

coloniesCN <- subset(colonies, Treatment %in% c("Control", "NG"))
str(colonies)

coloniesCN <- subset(colonies, Treatment == "Control" | Treatment == "NG")
str(coloniesCN)

coloniesCN <- droplevels(coloniesCN)
str(coloniesCN)

library(lattice)

bwplot(logCC ~ Strain | Treatment, data=coloniesCN)

tab <- tapply(coloniesCN$ColonyCount, list(coloniesCN$Treatment, coloniesCN$Strain), mean, na.rm=TRUE)

print(tab)

barplot(tab, beside=TRUE, log= 'y' )    

modLM <- lm(logCC ~ Strain * Treatment, data=coloniesCN)
par(mfrow=c(2,2), mar=c(3,3,3,1), mgp=c(2,0.8,0))
plot(modLM)

modPois <- glm(ColonyCount ~ Strain * Treatment, data=coloniesCN, family= 'poisson')

summary(modPois)

par(mfrow = c(2, 2), mar = c(3, 3, 3, 1), mgp = c(2, 0.8, 0))
plot(modPois)

modQPois <- glm(ColonyCount ~ Strain * Treatment, data = coloniesCN, family = 'quasipoisson')

summary(modQPois)

par(mfrow = c(2, 2), mar = c(3, 3, 3, 1), mgp = c(2, 0.8, 0))
plot(modQPois)    

anova(modQPois, test = "F")

drop.scope(modQPois)

modQPois2 <- update(modQPois, . ~ . - Strain:Treatment)
anova(modQPois, modQPois2, test = "F")

# use expand.grid to get all combinations of factors
df <- expand.grid(Strain = levels(coloniesCN$Strain), Treatment = levels(coloniesCN$Treatment))

predict(modQPois, newdata = df, type = "response")

table(Halo = colonies$HaloLawn, Strain = colonies$Strain, Treatment =  colonies$Treatment)
