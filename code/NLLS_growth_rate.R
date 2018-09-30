##########################################################
### Basic example script for growth model fitting ########
### Tom Smith 2017
### Can be used for fitting to logged cell counts, or for raw OD data (as OD scales logarithmically with time)
### though note that I've had some issues with baranyi r max looking weird from OD data...

rm(list = ls())
graphics.off()

library("minpack.lm") # for nls Levenberg-Marquardt fitting
library("ggplot2")

###########################
#### Functions to load ####
###########################

### Baranyi, Buchanan and Gompertz microbial growth models
### all have the same 4 parameters:
### t_lag - the lag time
### r_max - maximum growth rate
### N_max - carrying capacity
### N_min - starting population size (or OD)
###
### you need to give them t (time) and N (population size, i.e. log(cell count) or OD measurement)


baranyi_model <- function(t, r_max, N_max, N_min, t_lag){
  # baranyi model (Baranyi 1993)
  return(N_max + log10((-1+exp(r_max*t_lag) + exp(r_max*t))/(exp(r_max*t) - 1 + exp(r_max*t_lag) * 10^(N_max-N_min))))
}


buchanan_model <- function(t, r_max, N_max, N_min, t_lag){
  # buchanan model - three phase logistic (buchanan 1997)
  return(N_min + (t >= t_lag) * (t <= (t_lag + (N_max - N_min) * log(10)/r_max)) * r_max * (t - t_lag)/log(10) +
           (t >= t_lag) * (t > (t_lag + (N_max - N_min) * log(10)/r_max)) * (N_max - N_min))
}


gompertz_model <- function(t, r_max, N_max, N_min, t_lag){
  # modified gompertz growth model (see Zwietering 1990)
  return(N_min + (N_max - N_min) * exp(-exp(r_max * exp(1) * (t_lag - t)/((N_max - N_min) * log(10)) + 1)))
}


####
### create some cell count data just as an example ###
####

time <- c(0, 2, 4, 6, 8, 10, 12, 16, 20, 24) # timepoints (in hours maybe?)
log_cells <- c(3.62, 3.62, 3.63, 4.14, 5.23, 6.27, 7.57, 8.38, 8.70, 8.62) # logged cell counts

data <- data.frame(time, log_cells)
names(data) <- c("t", "N")

# this is what it looks like:

ggplot(data, aes(x = t, y = N)) + geom_point()
# wow, thats a really great sigmoid growth curve, almost as if
# the data was entirely made-up for the purposes of this example...

# generate some starting values for the models:

N_min_start <- min(data$N)
N_max_start <- max(data$N)
t_lag_start <- data$t[which.max(diff(diff(data$N)))]
r_max_start <- max(diff(data$N))/mean(diff(data$t))

############
## fit the models
############

fit_baranyi <- nlsLM(N ~ baranyi_model(t = t, r_max, N_max, N_min, t_lag), data,
              list(t_lag=t_lag_start, r_max=r_max_start, N_min = N_min_start, N_max = N_max_start))


fit_buchanan <- nlsLM(N ~ buchanan_model(t = t, r_max, N_max, N_min, t_lag), data,
                        list(t_lag=t_lag_start, r_max=r_max_start, N_min = N_min_start, N_max = N_max_start))

fit_gompertz <- nlsLM(N ~ gompertz_model(t = t, r_max, N_max, N_min, t_lag), data,
                      list(t_lag=t_lag_start, r_max=r_max_start, N_min = N_min_start, N_max = N_max_start))

summary(fit_baranyi)
summary(fit_buchanan)
summary(fit_gompertz)

#############
## and a quick bit of plotting just to see how they look...
#############

timepoints <- seq(0, 24, 0.1)
baranyi_points <- baranyi_model(t = timepoints, r_max = coef(fit_baranyi)["r_max"], N_max = coef(fit_baranyi)["N_max"],
                                N_min = coef(fit_baranyi)["N_min"], t_lag = coef(fit_baranyi)["t_lag"])
buchanan_points <- buchanan_model(t = timepoints, r_max = coef(fit_buchanan)["r_max"], N_max = coef(fit_buchanan)["N_max"],
                                N_min = coef(fit_buchanan)["N_min"], t_lag = coef(fit_buchanan)["t_lag"])
gompertz_points <- gompertz_model(t = timepoints, r_max = coef(fit_gompertz)["r_max"], N_max = coef(fit_gompertz)["N_max"],
                                N_min = coef(fit_gompertz)["N_min"], t_lag = coef(fit_gompertz)["t_lag"])

df1 <- data.frame(timepoints, baranyi_points)
df1$model <- "Baranyi"
names(df1) <- c("t", "N", "model")

df2 <- data.frame(timepoints, buchanan_points)
df2$model <- "Buchanan"
names(df2) <- c("t", "N", "model")

df3 <- data.frame(timepoints, gompertz_points)
df3$model <- "Gompertz"
names(df3) <- c("t", "N", "model")

model_frame <- rbind(df1, df2, df3)

ggplot(data, aes(x = t, y = N)) +
  geom_point(size = 3) +
  geom_line(data = model_frame, aes(x = t, y = N, col = model), size = 1)