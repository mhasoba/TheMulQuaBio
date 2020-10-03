library(repr) ; options(repr.plot.res = 100, repr.plot.width=4, repr.plot.height= 4) # Change plot sizes (in cm) - this bit of code is only relevant if you are using a juyter notebook - ignore otherwise

choose(2:6,2)

genome <- read.csv('../data/GenomeSize.csv')

mean.gs <- mean(genome$GenomeSize)
print(mean.gs)

var.gs <- var(genome$GenomeSize)
    print(var.gs)

n.gs <- length(genome$GenomeSize)
print(n.gs)

diff <- mean.gs - 1.25
print(diff)

se.gs <- sqrt(var.gs/n.gs)
print(se.gs)

t.gs <- diff/se.gs
print(t.gs)

t.test(genome$GenomeSize, mu = 1.25)

tlim <- qt(c(0.025,0.975), df = 99)
print(tlim)

mean.gs + tlim * se.gs

mean.gs <- tapply(X = genome$GenomeSize, INDEX = genome$Suborder, FUN = mean)
print(mean.gs)

var.gs <- tapply(X = genome$GenomeSize, INDEX = genome$Suborder, FUN = var)
print(var.gs)

n.gs <- tapply(X = genome$GenomeSize, INDEX = genome$Suborder, FUN = length)
print(n.gs)

diff <- mean.gs[1] - mean.gs[2]
print(diff)

se.gs <- sqrt((var.gs[1]/n.gs[1]) + (var.gs[2]/n.gs[2]))
print(se.gs)

t.gs <- diff/se.gs
print(t.gs)

t.test(GenomeSize ~ Suborder, data = genome)

var.gs[1]/var.gs[2]

var.test(GenomeSize ~ Suborder, data = genome) 

genome$logBodyWeight <- log(genome$BodyWeight)

wilcox.test(genome$GenomeSize, mu=1.25)
