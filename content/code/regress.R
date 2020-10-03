# CHAPTER 5. LINEAR MODELS: REGRESSION

# This script uses genome size and morphology data to explore regression in R

# (1) Load the data
genome <- read.csv('../data/GenomeSize.csv')

# (2) look at pairwise plots of all variables
pairs(genome)

# (3) identify the column numbers of five key variables and produce pairs plots
morpho <- c(4,7,8,12,14)
pairs(genome[, morpho], col=genome$Suborder)


# (4) Look at pairwise correlation coefficients and a correlation test
cor(genome[, morpho], use='pairwise')
cor.test(genome$GenomeSize, genome$TotalLength, use='pairwise')

# (5) log transform the key variables
genome$logGS <- log(genome$GenomeSize)
genome$logBW <- log(genome$BodyWeight)
genome$logTL <- log(genome$TotalLength)
genome$logFL <- log(genome$ForewingLength)
genome$logFA <- log(genome$ForewingArea)

str(genome)

# (6) get the columns of the transformed variables and repeat pairs and cor
logmorpho <- c(17,18,19,20,21)
# pair plots of log variables
pairs(genome[, logmorpho], col=genome$Suborder)
# correlation coefficient for log variables
cor(genome[, logmorpho], use='pairwise')

# (7) fit the null and genome size model for dragonflies
nullModDragon <- lm(logBW ~ 1, data=genome, subset=Suborder=='Anisoptera')
genomeSizeModelDragon <- lm(logBW ~ logGS, data=genome, subset=Suborder=='Anisoptera')
summary(genomeSizeModelDragon)
anova(genomeSizeModelDragon)

# residual sums of squares for the two models
sum(resid(nullModDragon)^2)
sum(resid(genomeSizeModelDragon)^2) 

# (8) fit the genome size model for damselflies
genomeSizeModelDamsel <- lm(logBW ~ logGS, data=genome,subset=Suborder=='Zygoptera')
summary(genomeSizeModelDamsel)
anova(genomeSizeModelDamsel)

# (9) Examine model diagnostics

# pdf("../../Graphics/DiagModDragon.pdf")
par(mfrow = c(2, 2), mar = c(5, 5, 1.5, 1.5))
plot(genomeSizeModelDragon)
# dev.off()

# pdf("../../Graphics/DiagModDamsel.pdf")
par(mfrow = c(2, 2), mar = c(5, 5, 1.5, 1.5))
plot(genomeSizeModelDamsel)
# dev.off()

# (10) Plot the model and add regression lines
myCol <- c('red','blue')
plot(logBW ~ logGS, data=genome, col=myCol[Suborder], xlab='log Genome Size (pg)', ylab='log Body Weight (g)')
abline(genomeSizeModelDragon, col='red')
abline(genomeSizeModelDamsel, col='blue')



