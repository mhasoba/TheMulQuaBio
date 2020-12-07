library(repr) ; options(repr.plot.width = 5, repr.plot.height = 6) # Change plot sizes (in cm)

rm(list = ls())
graphics.off()

set.seed(54321)

## 50 draws with each p 
pp <- c(0.1, 0.5, 0.8)
N <- 20
reps <- 50 

## histograms + density here
x <- seq(0, 50, by=1)
par(mfrow=c(1,3), bty="n")

# Write more code here

## MOM estimators for 3 simulated sets


## MoM estimates, histogram 

pp <- .25
N <- 10
reps <- 10
## Make one set of data

## the likelihood is always exactly zero
## at p=0,1, so I skip those values
ps <- seq(0.01, 0.99, by=0.01) 

## Likelihood


## MLE/MoM estimators 

## now plot the negative log likelihood profile


WL.data <- read.csv("../data/MidgeWingLength.csv")
Y <- WL.data$WingLength
n <- length(Y)

hist(Y,breaks=10,xlab="Wing Length (mm)") 

m <- sum(Y)/n
s2 <- sum((Y-m)^2)/(n-1)
round(c(m, s2), 3)

x <- seq(1.4,2.2, length=50)
hist(Y,breaks=10,xlab="Wing Length (mm)", xlim=c(1.4, 2.2), freq=FALSE) 
lines(x, dnorm(x, mean=m, sd=sqrt(s2)), col=2)

tau.post <- function(tau, tau0, n){n * tau + tau0}
mu.post <- function(Ybar, mu0, sig20, sig2, n){
 weight <- sig2+n * sig20
 
 return(n * sig20 * Ybar/weight + sig2 * mu0/weight)
}

mu0 <- 1.9
s20 <- 0.8
s2 <- 0.025 ## "true" variance

mp <- mu.post(Ybar=m, mu0=mu0, sig20=s20, sig2=s2, n=n)
tp <- tau.post(tau=1/s2, tau0=1/s20, n=n)

x <- seq(1.3,2.3, length=1000)
hist(Y,breaks=10,xlab="Wing Length (mm)", xlim=c(1.3, 2.3),
  freq=FALSE, ylim=c(0,8)) 
lines(x, dnorm(x, mean=mu0, sd=sqrt(s20)), col=2, lty=2, lwd=2) ## prior
lines(x, dnorm(x, mean=mp, sd=sqrt(1/tp)), col=4, lwd=2) ## posterior
legend("topleft", legend=c("prior", "posterior"), col=c(2,4), lty=c(2,1), lwd=2)

# Load libraries
require(rjags) # does the fitting
require(coda) # makes diagnostic plots
##require(mcmcplots) # another option for diagnostic plots

model1 <- "model{

 ## Likelihood
 for(i in 1:n){
 Y[i] ~ dnorm(mu,tau)
 }

 ## Prior for mu
 mu  ~ dnorm(mu0,tau0)

} ## close model 
"

model <- jags.model(textConnection(model1), 
     n.chains = 1, ## usually do more
     data = list(Y=Y,n=n, ## data
        mu0=mu0, tau0=1/s20, ## hyperparams
        tau = 1/s2 ## known precision
        ),
     inits=list(mu=3) ## setting an starting val
     )

samp <- coda.samples(model, 
  variable.names=c("mu"), 
  n.iter=1000, progress.bar="none")

plot(samp)

update(model, 10000, progress.bar="none") # Burnin for 10000 samples

samp <- coda.samples(model, 
  variable.names=c("mu"), 
  n.iter=20000, progress.bar="none")

plot(samp)

summary(samp)

x <- seq(1.3,2.3, length=1000)
hist(samp[[1]], xlab="mu", xlim=c(1.3, 2.3),
  freq=FALSE, ylim=c(0,8), main ="posterior samples") 
lines(x, dnorm(x, mean=mu0, sd=sqrt(s20)), col=2, lty=2, lwd=2) ## prior
lines(x, dnorm(x, mean=mp, sd=sqrt(1/tp)), col=4, lwd=2) ## posterior
legend("topleft", legend=c("prior", "analytic posterior"), col=c(2,4), lty=c(2,1), lwd=2)

model2 <- "model{

 # Likelihood
 for(i in 1:n){
 Y[i] ~ dnorm(mu,tau) T(0,) ## truncates at 0
 }

 # Prior for mu
 mu ~ dnorm(mu0,tau0)

 # Prior for the precision
 tau ~ dgamma(a, b)

 # Compute the variance
 s2  <- 1/tau
}"

## hyperparams for tau
a <- 0.01
b <- 0.01

m2 <- jags.model(textConnection(model2), 
     n.chains = 1,
     data = list(Y=Y, n=n,
        mu0=mu0, tau0=1/s20, ## mu hyperparams
        a=a, b=b ## tau hyperparams
        ),
     inits=list(mu=3, tau=10) ## starting vals
    )

samp <- coda.samples(m2, 
  variable.names=c("mu","s2"), 
  n.iter=1000, progress.bar="none")

plot(samp)

summary(samp)

par(mfrow=c(1,2), bty="n")

hist(samp[[1]][,1], xlab="samples of mu", main="mu")
lines(x, dnorm(x, mean=mu0, sd=sqrt(s20)), 
  col=2, lty=2, lwd=2) ## prior

x2 <- seq(0, 200, length=1000)
hist(1/samp[[1]][,2], xlab="samples of tau", main="tau")
lines(x2, dgamma(x2, shape = a, rate = b), 
  col=2, lty=2, lwd=2) ## prior

plot(as.numeric(samp[[1]][,1]), samp[[1]][,2], xlab="mu", ylab="s2")

require(R2jags) # fitting
require(coda) # diagnostic plots
set.seed(1234)

Aaeg.data <- read.csv("../data/AeaegyptiTraitData.csv")

head(Aaeg.data)

mu.data <- subset(Aaeg.data, trait.name == "mu")
lf.data <- subset(Aaeg.data, trait.name == "1/mu")
par(mfrow=c(1,2), bty="l") 
plot(trait ~ T, data = mu.data, ylab="mu")
plot(trait ~ T, data = lf.data, ylab="1/mu")

mu.data.inv <- mu.data # make a copy of the mu data
mu.data.inv$trait <- 1/mu.data$trait # take the inverse of the trait values to convert mu to lifespan
lf.data.comb <- rbind(mu.data.inv, lf.data) # combine both lifespan data sets together 
 
plot(trait ~ T, data = lf.data.comb, ylab="1/mu")

sink("quad.txt") # create a file
cat("
 model{
 
 ## Priors
 cf.q ~ dunif(0, 1)
 cf.T0 ~ dunif(0, 24)
 cf.Tm ~ dunif(25, 45)
 cf.sigma ~ dunif(0, 1000)
 cf.tau <- 1 / (cf.sigma * cf.sigma)
 
 ## Likelihood
 for(i in 1:N.obs){
 trait.mu[i] <- -1 * cf.q * (temp[i] - cf.T0) * (temp[i] - cf.Tm) * (cf.Tm > temp[i]) * (cf.T0 < temp[i])
 trait[i] ~ dnorm(trait.mu[i], cf.tau)
 }
 
 ## Derived Quantities and Predictions
 for(i in 1:N.Temp.xs){
 z.trait.mu.pred[i] <- -1 * cf.q * (Temp.xs[i] - cf.T0) * (Temp.xs[i] - cf.Tm) * (cf.Tm > Temp.xs[i]) * (cf.T0 < Temp.xs[i])
 }
 } # close model
",fill=T)
sink()

# Parameters to Estimate
parameters <- c("cf.q", "cf.T0", "cf.Tm","cf.sigma", "z.trait.mu.pred")

# Initial values for the parameters
inits <- function(){list(
 cf.q = 0.01,
 cf.Tm = 35,
 cf.T0 = 5,
 cf.sigma = rlnorm(1))}

# MCMC Settings: number of posterior dist elements = [(ni - nb) / nt ] * nc
ni <- 25000 # number of iterations in each chain
nb <- 5000 # number of 'burn in' iterations to discard
nt <- 8 # thinning rate - jags saves every nt iterations in each chain
nc <- 3 # number of chains

# Temperature sequence for derived quantity calculations
Temp.xs <- seq(0, 45, 0.2)
N.Temp.xs <- length(Temp.xs)

### Fitting the trait thermal response; Pull out data columns as vectors
data <- lf.data.comb # this lets us reuse the same generic code: we only change this first line
trait <- data$trait
N.obs <- length(trait)
temp <- data$T

# Bundle all data in a list for JAGS
jag.data <- list(trait = trait, N.obs = N.obs, temp = temp, Temp.xs = Temp.xs, N.Temp.xs = N.Temp.xs)

lf.fit <- jags(data=jag.data, inits=inits, parameters.to.save=parameters, 
    model.file="quad.txt", n.thin=nt, n.chains=nc, n.burnin=nb, 
    n.iter=ni, DIC=T, working.directory=getwd())

lf.fit.mcmc <- as.mcmc(lf.fit)

lf.fit$BUGSoutput$summary[1:5,]

plot(lf.fit.mcmc[,c(1,3,4)])

plot(trait ~ T, xlim = c(0, 45), ylim = c(0,42), data = lf.data.comb, ylab = "Lifespan for Ae. aegypti", xlab = "Temperature")
lines(lf.fit$BUGSoutput$summary[6:(6 + N.Temp.xs - 1), "2.5%"] ~ Temp.xs, lty = 2)
lines(lf.fit$BUGSoutput$summary[6:(6 + N.Temp.xs - 1), "97.5%"] ~ Temp.xs, lty = 2)
lines(lf.fit$BUGSoutput$summary[6:(6 + N.Temp.xs - 1), "mean"] ~ Temp.xs)

Temp.xs[which.max(as.vector(lf.fit$BUGSoutput$summary[6:(6 + N.Temp.xs - 1), "mean"]))]

lf.grad <- lf.fit$BUGSoutput$sims.list$z.trait.mu.pred
dim(lf.grad) # A matrix with 7500 iterations of the MCMC chains at 226 temperatures

require(R2jags) # does the fitting
require(coda) # makes diagnostic plots
library(IDPmisc) # makes nice colored pairs plots to look at joint posteriors

dat <- read.csv("../data/lb_ab_temps.csv")
head(dat)

d2 <- dat[which(dat$EXP==2),2:8]
d2 <- d2[which(d2$TEMP==12),]
summary(d2)

Temps <- seq(0,max(d2$DAY)-1, by=0.05)
mycol <- 1 
my.ylim <- c(0, 0.5)
my.title <- "LB-AB isolate, T=12C"

plot(d2$DAY-1, d2$OD, xlim=c(0,max(Temps)), ylim=my.ylim,
 pch=(mycol+20),
 xlab="time (days)", ylab="",
 main=my.title,
 col=mycol+1, cex=1.5)

sink("jags-logistic.bug")
cat("
 model {
 
 ## Likelihood
 for (i in 1:N) {
  Y[i] ~ dlnorm(log(mu[i]), tau)
  mu[i] <- K * Y0/(Y0+(K-Y0) * exp(-r * t[i]))
 }

 ## Priors
 r~dexp(1000)
 K ~ dunif(0.01, 0.6)
 Y0 ~ dunif(0.09, 0.15)
 tau <- 1/sigma^2
 sigma ~ dexp(0.1)

 } # close model
 ",fill=T)
sink()

# Parameters to Estimate
parameters <- c('Y0', 'K', 'r', 'sigma')

# Initial values for the parameters
inits <- function(){list(
 Y0 = 0.1,
 K = 0.4,
 r = 0.1,
 sigma = rlnorm(1))}

# MCMC Settings: number of posterior dist elements = [(ni - nb) / nt ] * nc
ni <- 6000 # number of iterations in each chain
nb <- 1000 # number of 'burn in' iterations to discard
nt <- 1 # thinning rate - jags saves every nt iterations in each chain
nc <- 5 # number of chains

# Pull out data columns as vectors
data <- d2 # this lets us reuse the same generic code: we only change this first line
Y <- data$OD
N <- length(Y)
t <- data$DAY

# Bundle all data in a list for JAGS
jag.data <- list(Y = Y, N = N, t = t)

# Run JAGS
OD.12C <- jags(data=jag.data, inits=inits, parameters.to.save=parameters, 
    model.file="jags-logistic.bug", n.thin=nt, n.chains=nc, n.burnin=nb, 
    n.iter=ni, DIC=T, working.directory=getwd())

OD.12C.mcmc <- as.mcmc(OD.12C)

OD.12C$BUGSoutput$summary

plot(OD.12C.mcmc[,c(1,2,4)])

s1 <- as.data.frame(OD.12C.mcmc[[1]])
par(mfrow=c(2,2))
for(i in 2:5) acf(s1[,i], lag.max=20)

source("../code/mcmc_utils.R")

samps <- NULL
for(i in 1:nc){
 samps <- rbind(samps, as.data.frame(OD.12C.mcmc[[i]]))
}

samps <- samps[,c(5,2,3,4)]

priors <- list()
priors$names <- c("Y0", "K", "r","sigma")
priors$fun <- c("uniform", "uniform", "exp","exp")
priors$hyper <- matrix(NA, ncol=4, nrow=3)
priors$hyper[,1] <- c(0.09, 0.15, NA)
priors$hyper[,2] <- c(0.01, 0.6, NA)
priors$hyper[,3] <- c(1000, NA, NA) 
priors$hyper[,4] <- c(0.1, NA, NA)

plot.hists(samps, my.par=c(2,2), n.hists=4, priors=priors, mai=c(0.5, 0.5, 0.25, 0.2))

ipairs(s1[,2:5], ztransf = function(x){x[x<1] <- 1; log2(x)})

my.logistic <- function(t, Y0, K, r){
 return(K * Y0/(Y0+(K-Y0) * exp(-r * t)))
}

ts <- seq(0, 40, length=100)
ss <- seq(1, dim(samps)[1], by=10)
my.curves <- matrix(NA, nrow=length(ss), ncol=length(ts))

for(i in 1:length(ss)){
 my.curves[i,] <- my.logistic(t=ts, Y0=samps$Y0[i], K=samps$K[i], r=samps$r[i])
}

plot(ts, my.curves[1,], col=1, type="l", ylim=c(0.09, 0.36), 
  ylab="predicted OD", xlab="time (days)")
for(i in 2:length(ss)) lines(ts, my.curves[i,], col=i)

m.log <- apply(my.curves, 2, mean)
l.log <- apply(my.curves, 2, quantile, probs=0.025)
u.log <- apply(my.curves, 2, quantile, probs=0.975)

hpd.log <- NULL
for(i in 1:length(ts)){
 hpd.log <- cbind(hpd.log, as.numeric(HPDinterval(mcmc(my.curves[,i]))))
}

my.ylim <- c(0.09, 0.45)
my.title <- "LB-AB isolate, T=12C"

plot(d2$DAY-1, d2$OD, xlim=c(0,max(Temps)), ylim=my.ylim,
 pch=(mycol+20),
 xlab="time (days)", ylab="",
 main=my.title,
 col="grey", cex=1.5)
lines(ts, m.log, col=1, lwd=2)
lines(ts, l.log, col=2, lwd=2, lty=2)
lines(ts, u.log, col=2, lwd=2, lty=2)

lines(ts, hpd.log[1,], col=3, lwd=2, lty=3)
lines(ts, hpd.log[2,], col=3, lwd=2, lty=3)
