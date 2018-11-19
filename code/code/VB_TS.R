## Code to accompany VectorBiTE 2018
## Intro to Time Series lecture 
## Leah R Johnson, Stats, VT

## slide 4
weather <- read.csv("weather.csv")
## pdf("weather.pdf", width=7, height=4)
plot(weather$temp, xlab="day", ylab="temp", type="l", 
  col=2, lwd=2)
## dev.off()

## slide 5
beer <- read.csv("beer.csv")
## pdf("beer.pdf", width=7, height=4)
plot(beer$prod, xlab="month", ylab="beer", type="l", 
  col=4, lwd=2)
## dev.off()

## slide 6
## pdf("norm.pdf", width=7, height=4)
plot(rnorm(200), xlab="t", ylab="Y_t", type="l", 
  col=6, lwd=2)
## dev.off()

## slide 7
## pdf("templast.pdf", width=5, height=5)
plot(weather$temp[1:58], weather$temp[2:59], pch=20, col=4,
     main="Daily Temp at O'Hare", xlab="temp(t-1)",
     ylab = "temp(t)")
text(x=6, y=45, col=2, cex=1.5,
     labels=paste("Corr =", round(cor(weather$temp[1:58],
       weather$temp[2:59]),2)))
## dev.off()

## slide 8
## pdf("lagtemp.pdf", width=9, height=4.5)
par(mfrow=c(1,2))
plot(weather$temp[1:57], weather$temp[3:59], pch=20, col=4,
     main="", xlab="temp(t-2)", ylab = "temp(t)")
text(x=7.5,y=45, col=2, 
     labels=paste("Lag 2 Corr =", round(cor(weather$temp[1:57],
       weather$temp[3:59]),2)))
plot(weather$temp[1:56], weather$temp[4:59], pch=20, col=4,
     main="", xlab="temp(t-3)", ylab = "temp(t)")
text(x=7.5,y=45, col=2, 
     labels=paste("Lag 3 Corr =", round(cor(weather$temp[1:56],
       weather$temp[4:59]),2)))
## dev.off()

## slides 9 and 10
## pdf("tempacf.pdf", width=6, height=4)
print(acf(weather$temp))
## dev.off()

## slide 11
## pdf("beeracf.pdf", width=6, height=4)
acf(beer$prod, lag.max=30)
## dev.off()

## slide 12
## pdf("normacf.pdf", width=6, height=4)
acf(rnorm(40), lag.max=40)
## dev.off()

## slide 16
tempreg <- lm(weather$temp[2:59] ~ weather$temp[1:58])
summary(tempreg)

## slide 17
## pdf("acftempreg.pdf", width=5, height=4)
acf(tempreg$residuals)
## dev.off()

## slide 18
beerreg <- lm(beer$prod[2:72] ~  beer$prod[1:71])
summary(beerreg)

## slide 19
## pdf("acfbeerreg.pdf", width=5, height=4)
acf(beerreg$residuals, lag.max=30)
## dev.off()


## slide 21
rw <- rnorm(1)
for(i in 2:200) rw <- c(rw, rw[i-1] + rnorm(1))
## pdf("randwalk.pdf", width=6, height=5)
plot(rw, pch=20, col=2)
lines(rw, col=4)
## dev.off()

## slide 22
## pdf("acfrandwalk.pdf", width=6, height=5)
acf(rw, lwd=2)
## dev.off()


## slide 24
xs <- rnorm(1)
for(i in 2:200) xs <- c(xs, 1.02*xs[i-1]+rnorm(1))
## pdf("exploding.pdf", width=6, height=5)
plot(xs, pch=20, col=2)
lines(xs, col=4)
## dev.off()

## slide 25
ss <- rnorm(1)
for(i in 2:200) ss <- c(ss, 0.8*ss[i-1]+rnorm(1))
## pdf("stationary.pdf", width=6, height=5)
plot(ss, pch=20, col=2)
lines(ss, col=4)
abline(h=0, lty=2, col=8)
## dev.off()

## slide 26
## pdf("acfstationary.pdf", width=6, height=5)
acf(ss, lwd=2)
## dev.off()

## slide 28
ns <- rnorm(1)
for(i in 2:100) ns <- c(ns, -0.8*ns[i-1]+rnorm(1))
## pdf("negcor.pdf", width=6, height=5)
plot(ns, pch=20, col=2)
lines(ns, col=4)
abline(h=0, lty=2, col=8)
## dev.off()

## slide 30
## shows how 1-year lag would work
beerreg12 <- lm( beer$prod[12:72] ~  beer$prod[1:61])
summary(beerreg12)

## not in slides
acf(beerreg12$residuals, lag.max=30)
## How would you add in both a 6 month and a 1 month lag? Are these
## terms significant?


## build the trending series
ss <- rnorm(1)
for(i in 2:200) ss <- c(ss, 0.8*ss[i-1]+rnorm(1))

## slide 32
## pdf("artime.pdf", width=6, height=4)
sst <- ss - (1:200)/20
plot(sst, col="blue", xlab="time")
## dev.off()

## slide 33
t <- 1:199
sst.fit <- lm(sst[2:200] ~ sst[1:199] + t)
summary(sst.fit)

## slide 35
t <- 0:35
## pdf("sincos.pdf", width=6, height=3)
par(mfrow=c(1,2))
plot(t, sin(2*pi*t/12), type="l", col="red")
plot(t, cos(2*pi*t/12), type="l", col="blue")
## dev.off()


###########
## Airline data analyses in the practical section. 

