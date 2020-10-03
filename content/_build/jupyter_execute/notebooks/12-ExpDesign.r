library(repr) ; options(repr.plot.res = 100, repr.plot.width=4, repr.plot.height= 4) # Change plot sizes (in cm) - this bit of code is only relevant if you are using a jupyter notebook - ignore otherwise

MySample <- rnorm(10, m=0, sd=1)

MySample

hist(MySample)

dnorm(1, m=0, sd=1)

dnorm(-1, m=0, sd=1)

dnorm(10, m=0, sd=1)

dnorm(100, m=0, sd=1)

MySample5 <- rnorm(5, m=0, sd=1) # Draw 5 normal random nos w/ mean 0 and s.d. 1:
MySample10 <- rnorm(10, m=0, sd=1) 
MySample20 <- rnorm(20, m=0, sd=1) 
MySample40 <- rnorm(40, m=0, sd=1)
MySample80 <- rnorm(80, m=0, sd=1)
MySample160 <- rnorm(160, m=0, sd=1)

par(mfcol = c(2,3)) #initialize multi-paneled plot
par(mfg = c(1,1)); hist(MySample5, col = rgb(1,1,0), main = 'n = 5') 
par(mfg = c(1,2)); hist(MySample10, col = rgb(1,1,0), main = 'n = 10') 
par(mfg = c(1,3)); hist(MySample20, col = rgb(1,1,0), main = 'n = 20') 
par(mfg = c(2,1)); hist(MySample40, col = rgb(1,1,0), main = 'n = 40') 
par(mfg = c(2,2)); hist(MySample80, col = rgb(1,1,0), main = 'n = 80') 
par(mfg = c(2,3)); hist(MySample160, col = rgb(1,1,0), main = 'n = 160') 

genome <- read.csv('../data/GenomeSize.csv')

head(genome) # this won't look so nice on your computer!

str(genome) # Check what the data columns contain

summary(genome)

hist(genome$GenomeSize, breaks=10)

plot(density(genome$GenomeSize, bw=0.1))

plot(GenomeSize ~ Suborder, data=genome)

Anisoptera <- subset(genome, Suborder=='Anisoptera') #The dragonflies
Zygoptera <- subset(genome, Suborder=='Zygoptera') #The damselflies

head(Anisoptera)

plot(density(Zygoptera$GenomeSize), xlim=c(0.1, 2.7), ylim=c(0,1.7))
lines(density(Anisoptera$GenomeSize), col='red')

plot(GenomeSize ~ BodyWeight, data = genome)

str(genome$Suborder) #Confirm that there are two levels under suborders 

myColours <- c('red', 'blue') # So choose two colours
mySymbols <- c(1,3) # And two different markers

plot(GenomeSize ~ TotalLength , data = genome, #Now plot again
col = myColours[Suborder], pch = mySymbols[Suborder],
xlab='Total length (mm)', ylab='Genome size (pg)')

legend("topleft", legend=levels(genome$Suborder), #Add legend at top left corner
       col= myColours, pch = mySymbols, cex = 1)
