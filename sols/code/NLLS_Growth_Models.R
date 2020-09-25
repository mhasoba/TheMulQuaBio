## Model comparison (1000 iterations)

library(minpack.lm)
library(ggplot2)

## Generate data
time <- c(0, 2, 4, 6, 8, 10, 12, 16, 20, 24) 
log_cells <- c(3.62, 3.62, 3.63, 4.14, 5.23, 6.27, 7.57, 8.38, 8.70, 8.69) 

## Models (on log scale)
baranyi <- function(t, r_max, N_max, N_0, t_lag){
  return(N_max + log10((-1+exp(r_max*t_lag) + exp(r_max*t))/(exp(r_max*t) - 1 + exp(r_max*t_lag) * 10^(N_max-N_0))))
}

buchanan <- function(t, r_max, N_max, N_0, t_lag){
  return(N_0 + (t >= t_lag) * (t <= (t_lag + (N_max - N_0) * log(10)/r_max)) * r_max * (t - t_lag)/log(10) +
           (t >= t_lag) * (t > (t_lag + (N_max - N_0) * log(10)/r_max)) * (N_max - N_0))
}

gompertz <- function(t, r_max, N_max, N_0, t_lag){
  return(N_0 + (N_max - N_0) * exp(-exp(r_max * exp(1) * (t_lag - t)/((N_max - N_0) * log(10)) + 1)))
}


## Create dataframe to store AIC results
Comparison  <- as.data.frame(matrix(nrow = 1000, ncol = 3))
colnames(Comparison) <- c("AIC_Buchanan", "AIC_Baranyi", "AIC_Gompertz")

## Initiate loop
for (i in 1:1000) {
  
  
  ## Randomise Data
  Data <- data.frame(time, log_cells) + rnorm(length(time),sd=.1)
  names(Data) <- c("t", "LogN")
  
  ## Calculate starting values
  N_0_start <- min(Data$LogN)
  N_max_start <- max(Data$LogN)
  t_lag_start <- Data$t[which.max(diff(diff(Data$LogN)))]
  r_max_start <- max(diff(Data$LogN))/mean(diff(Data$t))
  
  ## Fit models
  Model_Baranyi <- tryCatch(nlsLM(LogN ~ baranyi(t, r_max, N_max, N_0, t_lag), 
                                  data = Data, 
                                  start = list(r_max=r_max_start, 
                                               N_max=N_max_start, 
                                               N_0=N_0_start, 
                                               t_lag=t_lag_start)), 
                            error = function(e) NULL)
  
  Model_Buchanan <- tryCatch(nlsLM(LogN ~ buchanan(t, r_max, N_max, N_0, t_lag), 
                                   data = Data, 
                                   start = list(r_max=r_max_start, 
                                                N_max=N_max_start, 
                                                N_0=N_0_start, 
                                                t_lag=t_lag_start)),
                             error = function(e) NULL)
  
  Model_Gompertz <- tryCatch(nlsLM(LogN ~ gompertz(t, r_max, N_max, N_0, t_lag), 
                                   data = Data, 
                                   start = list(r_max=r_max_start, 
                                                N_max=N_max_start, 
                                                N_0=N_0_start, 
                                                t_lag=t_lag_start)),
                             error = function(e) NULL)
  
  ## Calculate and store AIC if convergence
  if (!is.null(Model_Baranyi)) {Comparison$AIC_Baranyi[i] <- AIC(Model_Baranyi)}
  if (!is.null(Model_Buchanan)) {Comparison$AIC_Buchanan[i] <- AIC(Model_Buchanan)}
  if (!is.null(Model_Gompertz)) {Comparison$AIC_Gompertz[i] <- AIC(Model_Gompertz)}
  
}

## Model comparison
hist(Comparison$AIC_Baranyi)
hist(Comparison$AIC_Gompertz)
hist(Comparison$AIC_Buchanan)

mean(Comparison$AIC_Baranyi - Comparison$AIC_Gompertz, na.rm=TRUE)
