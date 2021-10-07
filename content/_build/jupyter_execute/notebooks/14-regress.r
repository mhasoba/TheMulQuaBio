library(repr); options(repr.plot.res = 100, repr.plot.width = 6, repr.plot.height = 6) # Change plot sizes (in cm) - this bit of code 6s only relevant i6 you are using a jupyter notebook - ignore otherwise

genome <- read.csv('../data/GenomeSize.csv',stringsAsFactors = T) 

head(genome)

library(repr); options(repr.plot.res = 100, repr.plot.width = 10, repr.plot.height = 10)

pairs(genome)

pairs(genome, col=genome$Suborder)

library(repr); options(repr.plot.res = 100, repr.plot.width = 8, repr.plot.height = 8) # change plot size

# create a small data frame:
dat <- data.frame(A = c("a", "b", "c", "d", "e"), B = c(1, 2, 3, 4, 5))
dat[1, ] # select row 1 (all columns selected)

dat[, 2] # select column 2 (all rows selected)

dat[2, 1] # select row 2, column 1

morpho_vars <- c(4, 7, 8, 12, 14) # store the indices
pairs(genome[, morpho_vars], col = genome$Suborder)

cor(genome[, morpho_vars], use = "pairwise")

cor.test(genome$GenomeSize, genome$TotalLength, use = "pairwise")

genome$logGS <- log(genome$GenomeSize)

genome$logGS <- log(genome$GenomeSize)
genome$logBW <- log(genome$BodyWeight)
genome$logTL <- log(genome$TotalLength)
genome$logFL <- log(genome$ForewingLength)
genome$logFA <- log(genome$ForewingArea)

str(genome)

logmorpho <- c(17,18,19,20,21)

pairs(genome[, logmorpho], col=genome$Suborder)

cor(genome[, logmorpho], use='pairwise')

myColours <- c('red', 'blue') # Choose two colours
mySymbols <- c(1,3) # And two different markers
colnames(genome)

library(repr); options(repr.plot.res = 100, repr.plot.width = 6, repr.plot.height = 6) # change plot size

plot(logBW ~ GenomeSize , data = genome, #Now plot again
col = myColours[Suborder], pch = mySymbols[Suborder],
xlab='Genome size (pg)', ylab='log(Body weight) (mg)')

legend("topleft", legend=levels(genome$Suborder), #Add legend at top left corner
       col= myColours, pch = mySymbols)

genomeSizeModelDragon <- lm(logBW ~ logGS, data = genome, subset =  Suborder == "Anisoptera")

coef(genomeSizeModelDragon) 

summary(genomeSizeModelDragon) 

anova(genomeSizeModelDragon)

nullModelDragon <- lm(logBW ~ 1, data = genome, subset = Suborder ==  "Anisoptera")

sum(resid(nullModelDragon) ^ 2)

sum(resid(genomeSizeModelDragon) ^ 2)

genomeSizeModelDamsel <- lm(logBW ~ logGS, data=genome,subset=Suborder=='Zygoptera')

myCol <- c('red','blue')
library(repr); options(repr.plot.res = 100, repr.plot.width = 8, repr.plot.height = 8) # change plot size
plot(logBW ~ logGS, data=genome, col=myCol[Suborder], xlab='log Genome Size (pg)', ylab='log Body Weight (g)')

abline(genomeSizeModelDragon, col='red')

par(mfrow = c(2, 2), mar = c(5, 5, 1.5, 1.5))
plot(genomeSizeModelDragon)

par(mfrow = c(2, 2), mar = c(5, 5, 1.5, 1.5))
plot(genomeSizeModelDamsel)
