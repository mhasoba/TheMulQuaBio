library(repr) ; options(repr.plot.width = 5, repr.plot.height = 6) # Change plot sizes (in cm)

rm(list = ls())
graphics.off()

require("minpack.lm") # for Levenberg-Marquardt nlls fitting

powMod <- function(x, a, b) {
 return(a * x^b)
}

MyData <- read.csv("../data/GenomeSize.csv")

head(MyData)

Data2Fit <- subset(MyData,Suborder == "Anisoptera")

Data2Fit <- Data2Fit[!is.na(Data2Fit$TotalLength),] # remove NA's

plot(Data2Fit$TotalLength, Data2Fit$BodyWeight)

library("ggplot2")

ggplot(Data2Fit, aes(x = TotalLength, y = BodyWeight)) + 
geom_point(size = (3),color="red") + theme_bw() + 
labs(y="Body mass (mg)", x = "Wing length (mm)")

PowFit <- nlsLM(BodyWeight ~ powMod(TotalLength, a, b), data = Data2Fit, start = list(a = .1, b = .1))

summary(PowFit)

Lengths <- seq(min(Data2Fit$TotalLength),max(Data2Fit$TotalLength),len=200)

coef(PowFit)["a"]
coef(PowFit)["b"]

Predic2PlotPow <- powMod(Lengths,coef(PowFit)["a"],coef(PowFit)["b"])

Exercisesplot(Data2Fit$TotalLength, Data2Fit$BodyWeight)
lines(Lengths, Predic2PlotPow, col = 'blue', lwd = 2.5)

confint(PowFit)

QuaFit <- lm(BodyWeight ~ poly(TotalLength,2), data = Data2Fit)

Predic2PlotQua <- predict.lm(QuaFit, data.frame(TotalLength = Lengths))

plot(Data2Fit$TotalLength, Data2Fit$BodyWeight)
lines(Lengths, Predic2PlotPow, col = 'blue', lwd = 2.5)
lines(Lengths, Predic2PlotQua, col = 'red', lwd = 2.5)

RSS_Pow <- sum(residuals(PowFit)^2) # Residual sum of squares
TSS_Pow <- sum((Data2Fit$BodyWeight - mean(Data2Fit$BodyWeight))^2) # Total sum of squares
RSq_Pow <- 1 - (RSS_Pow/TSS_Pow) # R-squared value

RSS_Qua <- sum(residuals(QuaFit)^2) # Residual sum of squares
TSS_Qua <- sum((Data2Fit$BodyWeight - mean(Data2Fit$BodyWeight))^2) # Total sum of squares
RSq_Qua <- 1 - (RSS_Qua/TSS_Qua) # R-squared value

RSq_Pow 
RSq_Qua

n <- nrow(Data2Fit) #set sample size
pPow <- length(coef(PowFit)) # get number of parameters in power law model
pQua <- length(coef(QuaFit)) # get number of parameters in quadratic model

AIC_Pow <- n + 2 + n * log((2 * pi) / n) + n * log(RSS_Pow) + 2 * pPow
AIC_Qua <- n + 2 + n * log((2 * pi) / n) + n * log(RSS_Qua) + 2 * pQua
AIC_Pow - AIC_Qua

AIC(PowFit) - AIC(QuaFit)

alb <- read.csv(file="../data/albatross_grow.csv")
alb <- subset(x=alb, !is.na(alb$wt))
plot(alb$age, alb$wt, xlab="age (days)", ylab="weight (g)", xlim=c(0, 100))

logistic1 <- function(t, r, K, N0){
 N0 * K * exp(r * t)/(K+N0 * (exp(r * t)-1))
}

vonbert.w <- function(t, Winf, c, K){
 Winf * (1 - exp(-K * t) + c * exp(-K * t))^3
}

scale <- 4000

alb.lin <- lm(wt/scale ~ age, data = alb)

alb.log <- nlsLM(wt/scale~logistic1(age, r, K, N0), start=list(K=1, r=0.1, N0=0.1), data=alb)

alb.vb <- nlsLM(wt/scale~vonbert.w(age, Winf, c, K), start=list(Winf=0.75, c=0.01, K=0.01), data=alb)

ages <- seq(0, 100, length=1000)

pred.lin <- predict(alb.lin, newdata = list(age=ages)) * scale

pred.log <- predict(alb.log, newdata = list(age=ages)) * scale

pred.vb <- predict(alb.vb, newdata = list(age=ages)) * scale

plot(alb$age, alb$wt, xlab="age (days)", ylab="weight (g)", xlim=c(0,100))
lines(ages, pred.lin, col=2, lwd=2)
lines(ages, pred.log, col=3, lwd=2)
lines(ages, pred.vb, col=4, lwd=2)

legend("topleft", legend = c("linear", "logistic", "Von Bert"), lwd=2, lty=1, col=2:4)

par(mfrow=c(3,1), bty="n")
plot(alb$age, resid(alb.lin), main="LM resids", xlim=c(0,100))
plot(alb$age, resid(alb.log), main="Logisitic resids", xlim=c(0,100))
plot(alb$age, resid(alb.vb), main="VB resids", xlim=c(0,100))

n <- length(alb$wt)
list(lin=signif(sum(resid(alb.lin)^2)/(n-2 * 2), 3), 
 log= signif(sum(resid(alb.log)^2)/(n-2 * 3), 3), 
 vb= signif(sum(resid(alb.vb)^2)/(n-2 * 3), 3))   

aedes <- read.csv(file="../data/aedes_fecund.csv")

plot(aedes$T, aedes$EFD, xlab="temperature (C)", ylab="Eggs/day")

quad1 <- function(T, T0, Tm, c){
 c * (T-T0) * (T-Tm) * as.numeric(T<Tm) * as.numeric(T>T0)
}

briere <- function(T, T0, Tm, c){
 c * T * (T-T0) * (abs(Tm-T)^(1/2)) * as.numeric(T<Tm) * as.numeric(T>T0)
}

scale <- 20

aed.lin <- lm(EFD/scale ~ T, data=aedes)

aed.quad <- nlsLM(EFD/scale~quad1(T, T0, Tm, c), start=list(T0=10, Tm=40, c=0.01), data=aedes)

aed.br <- nlsLM(EFD/scale~briere(T, T0, Tm, c), start=list(T0=10, Tm=40, c=0.1), data=aedes)

t <- seq(0, 22, 2)
N <- c(32500, 33000, 38000, 105000, 445000, 1430000, 3020000, 4720000, 5670000, 5870000, 5930000, 5940000)

set.seed(1234) # set seed to ensure you always get the same random sequence 

data <- data.frame(t, N * (1 + rnorm(length(t), sd = 0.1))) # add some random error

names(data) <- c("Time", "N")

head(data)

ggplot(data, aes(x = Time, y = N)) + 
 geom_point(size = 3) +
 labs(x = "Time (Hours)", y = "Population size (cells)")

data$LogN <- log(data$N)

# visualise
ggplot(data, aes(x = t, y = LogN)) + 
 geom_point(size = 3) +
 labs(x = "Time (Hours)", y = "log(cell number)")

(data[data$Time == 10,]$LogN - data[data$Time == 6,]$LogN)/(10-6)

diff(data$LogN)

max(diff(data$LogN))/2 # 2 is the difference in any successive pair of timepoints

lm_growth <- lm(LogN ~ Time, data = data[data$Time > 2 & data$Time < 12,])
summary(lm_growth)

logistic_model <- function(t, r_max, K, N_0){ # The classic logistic equation
 return(N_0 * K * exp(r_max * t)/(K + N_0 * (exp(r_max * t) - 1)))
}

# first we need some starting parameters for the model
N_0_start <- min(data$N) # lowest population size
K_start <- max(data$N) # highest population size
r_max_start <- 0.62 # use our estimate from the OLS fitting from above

fit_logistic <- nlsLM(N ~ logistic_model(t = Time, r_max, K, N_0), data,
      list(r_max=r_max_start, N_0 = N_0_start, K = K_start))

summary(fit_logistic)

timepoints <- seq(0, 22, 0.1)

logistic_points <- logistic_model(t = timepoints, 
         r_max = coef(fit_logistic)["r_max"], 
         K = coef(fit_logistic)["K"], 
         N_0 = coef(fit_logistic)["N_0"])
df1 <- data.frame(timepoints, logistic_points)
df1$model <- "Logistic equation"
names(df1) <- c("Time", "N", "model")

ggplot(data, aes(x = Time, y = N)) +
 geom_point(size = 3) +
 geom_line(data = df1, aes(x = Time, y = N, col = model), size = 1) +
 theme(aspect.ratio=1)+ # make the plot square 
 labs(x = "Time", y = "Cell number")

ggplot(data, aes(x = Time, y = LogN)) +
 geom_point(size = 3) +
 geom_line(data = df1, aes(x = Time, y = log(N), col = model), size = 1) +
 theme(aspect.ratio=1)+ 
 labs(x = "Time", y = "log(Cell number)")

ggplot(data, aes(x = N, y = LogN)) +
 geom_point(size = 3) +
 theme(aspect.ratio = 1)+ 
 labs(x = "N", y = "log(N)")

gompertz_model <- function(t, r_max, K, N_0, t_lag){ # Modified gompertz growth model (Zwietering 1990)
 return(N_0 + (K - N_0) * exp(-exp(r_max * exp(1) * (t_lag - t)/((K - N_0) * log(10)) + 1)))
}   

N_0_start <- min(data$LogN) # lowest population size, note log scale
K_start <- max(data$LogN) # highest population size, note log scale
r_max_start <- 0.62 # use our previous estimate from the OLS fitting from above
t_lag_start <- data$Time[which.max(diff(diff(data$LogN)))] # find last timepoint of lag phase

diff(data$LogN) # same as what we did above - get differentials

diff(diff(data$LogN)) # get the differentials of the differentials (approx 2nd order derivatives)

which.max(diff(diff(data$LogN))) # find the timepoint where this 2nd order derivative really takes off 

data$Time[which.max(diff(diff(data$LogN)))] # This then is a good guess for the last timepoint of the lag phase

fit_gompertz <- nlsLM(LogN ~ gompertz_model(t = Time, r_max, K, N_0, t_lag), data,
      list(t_lag=t_lag_start, r_max=r_max_start, N_0 = N_0_start, K = K_start))

summary(fit_gompertz)

timepoints <- seq(0, 24, 0.1)

logistic_points <- log(logistic_model(t = timepoints, 
          r_max = coef(fit_logistic)["r_max"], 
          K = coef(fit_logistic)["K"], 
          N_0 = coef(fit_logistic)["N_0"]))

gompertz_points <- gompertz_model(t = timepoints, 
         r_max = coef(fit_gompertz)["r_max"], 
         K = coef(fit_gompertz)["K"], 
         N_0 = coef(fit_gompertz)["N_0"], 
         t_lag = coef(fit_gompertz)["t_lag"])

df1 <- data.frame(timepoints, logistic_points)
df1$model <- "Logistic model"
names(df1) <- c("Time", "LogN", "model")

df2 <- data.frame(timepoints, gompertz_points)
df2$model <- "Gompertz model"
names(df2) <- c("Time", "LogN", "model")

model_frame <- rbind(df1, df2)

ggplot(data, aes(x = Time, y = LogN)) +
 geom_point(size = 3) +
 geom_line(data = model_frame, aes(x = Time, y = LogN, col = model), size = 1) +
 theme_bw() + # make the background white
 theme(aspect.ratio=1)+ # make the plot square 
 labs(x = "Time", y = "log(Abundance)")

nll.slr <- function(par, dat, ...){
 args <- list(...)
 
 b0 <- par[1]
 b1 <- par[2]
 X <- dat$X
 Y <- dat$Y
 if(!is.na(args$sigma)){
  sigma <- args$sigma
 } else 
  sigma <- par[3]

 mu <- b0+b1 * X
 
 return(-sum(dnorm(Y, mean=mu, sd=sigma, log=TRUE)))
}

set.seed(123)
n <- 30
b0 <- 10
b1 <- 3
sigma <- 2
X <- rnorm(n, mean=3, sd=7)
Y <- b0 + b1 * X + rnorm(n, mean=0, sd=sigma)
dat <- data.frame(X=X, Y=Y) # convert to a data frame

plot(X, Y)

N <- 50
b0s <- seq(5, 15, length=N)
mynll <- rep(NA, length=50)
for(i in 1:N){
 mynll[i] <- nll.slr(par=c(b0s[i],b1), dat=dat, sigma=sigma)
}

plot(b0s, mynll, type="l")
abline(v=b0, col=2)
abline(v=b0s[which.min(mynll)], col=3)

N0 <- 100
N1 <- 101
b0s <- seq(7,12, length=N0)
b1s <- seq(1,5, length=N1)

mynll <- matrix(NA, nrow=N0, ncol=N1)
for(i in 1:N0){
 for(j in 1:N1) mynll[i,j] <- nll.slr(par=c(b0s[i],b1s[j]), dat=dat, sigma=sigma)
}

ww <- which(mynll==min(mynll), arr.ind=TRUE)

b0.est <- b0s[ww[1]]
b1.est <- b1s[ww[2]]
rbind(c(b0, b1), c(b0.est, b1.est))

filled.contour(x = b0s, y = b1s, z= mynll, col=heat.colors(21), 
    plot.axes = {axis(1); axis(2); points(b0,b1, pch=21); 
       points(b0.est, b1.est, pch=8, cex=1.5); xlab="b0"; ylab="b1"})

par(mfrow=c(1,2), bty="n")
plot(b0s, mynll[,ww[2]], type="l", xlab="b0", ylab="NLL")
plot(b1s, mynll[ww[1],], type="l", xlab="b1", ylab="NLL")

fit <- optim(nll.slr, par=c(2, 1), method="L-BFGS-B", ## this is a n-D method
    lower=-Inf, upper=Inf, dat=dat, sigma=sigma)

fit

fit <- optim(nll.slr, par=c(2, 1, 5), method="L-BFGS-B", ## this is a n-D method
    lower=c(-Inf, -Inf, 0.1), upper=Inf, dat=dat, sigma=NA)
fit$par

plot(X, Y)
abline(a=fit$par[1], b=fit$par[2], col=2, lwd=2)

fit <- optim(nll.slr, par=c(2, 1), method="L-BFGS-B", hessian=TRUE, lower=-Inf, upper=Inf, dat=dat, sigma=sigma)

fisher_info <- solve(fit$hessian)
est_sigma <- sqrt(diag(fisher_info))
upper <- fit$par+1.96 * est_sigma
lower <- fit$par-1.96 * est_sigma
interval <- data.frame(value=fit$par, upper=upper, lower=lower)
interval

lmfit <- lm(Y~X)

summary(lmfit)$coeff

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
