library(repr) ; options(repr.plot.width = 5, repr.plot.height = 6) # Change plot sizes (in cm)

rm(list = ls())
graphics.off()

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
