library(repr) ; options(repr.plot.width = 4, repr.plot.height = 4) # Change plot sizes (in cm)

rm(list = ls())
graphics.off()

S_data <- seq(1,50,5)
S_data

V_data <- ((12.5 * S_data)/(7.1 + S_data))
plot(S_data, V_data)

set.seed(1456) # To get the same random fluctuations in the "data" every time
V_data <- V_data + rnorm(10,0,1) # Add 10 random fluctuations  with standard deviation of 0.5 to emulate error
plot(S_data, V_data)

MM_model <- nls(V_data ~ V_max * S_data / (K_M + S_data))

plot(S_data,V_data, xlab = "Substrate Concentration", ylab = "Reaction Rate")  # first plot the data 
lines(S_data,predict(MM_model),lty=1,col="blue",lwd=2) # now overlay the fitted model 

coef(MM_model) # check the coefficients

Substrate2Plot <- seq(min(S_data), max(S_data),len=200) # generate some new x-axis values just for plotting

Predict2Plot <- coef(MM_model)["V_max"] * Substrate2Plot / (coef(MM_model)["K_M"] + Substrate2Plot) # calculate the predicted values by plugging the fitted coefficients into the model equation 

plot(S_data,V_data, xlab = "Substrate Concentration", ylab = "Reaction Rate")  # first plot the data 
lines(Substrate2Plot, Predict2Plot, lty=1,col="blue",lwd=2) # now overlay the fitted model

summary(MM_model)

confint(MM_model)

MM_model2 <- nls(V_data ~ V_max * S_data / (K_M + S_data), start = list(V_max = 12, K_M = 7))

coef(MM_model)
coef(MM_model2)

MM_model3 <- nls(V_data ~ V_max * S_data / (K_M + S_data), start = list(V_max = .01, K_M = 20))

coef(MM_model)
coef(MM_model2)
coef(MM_model3)

plot(S_data,V_data)  # first plot the data 
lines(S_data,predict(MM_model),lty=1,col="blue",lwd=2) # overlay the original model fit
lines(S_data,predict(MM_model3),lty=1,col="red",lwd=2) # overlay the latest model fit

nls(V_data ~ V_max * S_data / (K_M + S_data), start = list(V_max = 0, K_M = 0.1))

nls(V_data ~ V_max * S_data / (K_M + S_data), start = list(V_max = -0.1, K_M = 100))

MM_model4 <- nls(V_data ~ V_max * S_data / (K_M + S_data), start = list(V_max = 12.96, K_M = 10.61))

coef(MM_model)
coef(MM_model4)

require("minpack.lm")

MM_model5 <- nlsLM(V_data ~ V_max * S_data / (K_M + S_data), start = list(V_max = 2, K_M = 2))

coef(MM_model2)
coef(MM_model5)

MM_model6 <- nlsLM(V_data ~ V_max * S_data / (K_M + S_data), start = list(V_max = .01, K_M = 20))

MM_model7 <- nlsLM(V_data ~ V_max * S_data / (K_M + S_data), start = list(V_max = 0, K_M = 0.1))

MM_model8 <- nlsLM(V_data ~ V_max * S_data / (K_M + S_data), start = list(V_max = -0.1, K_M = 100))

coef(MM_model6)
coef(MM_model7)
coef(MM_model8)

nlsLM(V_data ~ V_max * S_data / (K_M + S_data), start = list(V_max = -10, K_M = -100))

nlsLM(V_data ~ V_max * S_data / (K_M + S_data), start = list(V_max = 0.1, K_M = 0.1))

nlsLM(V_data ~ V_max * S_data / (K_M + S_data), start = list(V_max = 0.1, K_M = 0.1), lower=c(0.4,0.4), upper=c(100,100))

nlsLM(V_data ~ V_max * S_data / (K_M + S_data), start =  list(V_max = 0.5, K_M = 0.5), lower=c(0.4,0.4), upper=c(20,20))

hist(residuals(MM_model6))

MyData <- read.csv("../data/GenomeSize.csv") # using relative path assuming that your working directory is "code"

head(MyData)

Data2Fit <- subset(MyData,Suborder == "Anisoptera")

Data2Fit <- Data2Fit[!is.na(Data2Fit$TotalLength),] # remove NA's

plot(Data2Fit$TotalLength, Data2Fit$BodyWeight, xlab = "Body Length", ylab = "Body Weight")

library("ggplot2")

ggplot(Data2Fit, aes(x = TotalLength, y = BodyWeight)) + 
geom_point(size = (3),color="red") + theme_bw() + 
labs(y="Body mass (mg)", x = "Wing length (mm)")

nrow(Data2Fit)

PowFit <- nlsLM(BodyWeight ~ a * TotalLength^b, data = Data2Fit, start = list(a = .1, b = .1))

powMod <- function(x, a, b) {
 return(a * x^b)
}

PowFit <- nlsLM(BodyWeight ~ powMod(TotalLength,a,b), data = Data2Fit, start = list(a = .1, b = .1))

Lengths <- seq(min(Data2Fit$TotalLength),max(Data2Fit$TotalLength),len=200)

coef(PowFit)["a"]
coef(PowFit)["b"]

Predic2PlotPow <- powMod(Lengths,coef(PowFit)["a"],coef(PowFit)["b"])

plot(Data2Fit$TotalLength, Data2Fit$BodyWeight)
lines(Lengths, Predic2PlotPow, col = 'blue', lwd = 2.5)

summary(PowFit)

print(confint(PowFit))

hist(residuals(PowFit))

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

set.seed(1234) # To ensure we always get the same random sequence in this example "dataset" 

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
