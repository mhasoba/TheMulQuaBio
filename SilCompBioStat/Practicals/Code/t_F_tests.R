# CHAPTER 4. T TESTS AND F TESTS

# This script uses genome size and morphology data to explore 
# t tests and F tests in R

# (1) load the data from the CSV text file into a data frame
genome <- read.csv('../Data/GenomeSize.csv')
# double check that the data has loaded properly - does str() look right
str(genome)

# (2) One sample t-test by hand
# calculate the three values from the data
mean.gs <- mean(genome$GenomeSize)
print(mean.gs)
var.gs  <- var(genome$GenomeSize)
print(var.gs)
n.gs    <- length(genome$GenomeSize)
print(n.gs)
# get the difference
diff <- mean.gs - 1.25
print(diff)
# get the standard error
se.gs   <- sqrt(var.gs / n.gs)
print(se.gs)
# get the t value
t.gs    <- diff/se.gs
print(t.gs)

# (3) One sample t test using the t.test() function
t.test(genome$GenomeSize, mu=1.25)

# 95% confidence interval
tlim <- qt(c(0.025,0.975), df = 99)
print(tlim)
# use the mean and standard error from above to get a confidence interval
mean.gs + tlim * se.gs

# (4) One sample test for body weight
t.test(genome$BodyWeight, mu=0.045)

# (5) Two sample t-test by hand
# calculate the three values from the data
mean.gs <- tapply(genome$GenomeSize, INDEX=genome$Suborder, FUN=mean)
print(mean.gs)
var.gs  <- tapply(genome$GenomeSize, INDEX=genome$Suborder, FUN=var)
print(var.gs)
n.gs    <- tapply(genome$GenomeSize, INDEX=genome$Suborder, FUN=length)
print(n.gs)
# get the difference 
diff <- mean.gs[1] - mean.gs[2]
print(diff)
# get the standard error of the difference 
se.gs   <- sqrt((var.gs[1] / n.gs[1]) + (var.gs[2] / n.gs[2]) )
print(se.gs)
# get the t value
t.gs    <- diff/se.gs
print(t.gs)

# (6) Two sample t-tests using the t.test() function
t.test(GenomeSize ~ Suborder, data=genome)
t.test(BodyWeight ~ Suborder, data=genome)

# (7) Boxplot of body weight per suborder
par(mfrow=c(1,2))
plot(GenomeSize ~ Suborder, data=genome)
plot(BodyWeight ~ Suborder, data=genome)

# (8) F calculation by hand
var.gs[1]/var.gs[2]

# (9) Test for equal variance on the two data sets
var.test(GenomeSize ~ Suborder, data=genome)
var.test(BodyWeight ~ Suborder, data=genome)

# (10) Revisiting t tests
genome$logBodyWeight <- log(genome$BodyWeight)
boxplot(logBodyWeight ~ Suborder, data=genome)
var.test(logBodyWeight ~ Suborder, data=genome)
t.test(logBodyWeight ~ Suborder, data=genome)

# (11) Nonparametic tests
wilcox.test(genome$GenomeSize, mu=1.25)
wilcox.test(genome$BodyWeight, mu=0.045)
wilcox.test(GenomeSize ~ Suborder, data=genome)
wilcox.test(logBodyWeight ~ Suborder, data=genome)

