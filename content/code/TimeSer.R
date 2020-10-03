library(minpack.lm)
require(graphics)

# Data <- read.table(file="../Data/900days.txt", header=TRUE, sep="")
Data <- read.csv(file="../Data/ClimateData.csv", header=TRUE)
Data <- Data[!is.na(Data$NZS),]
x_0_strt <- mean(Data$NZS)  # Vertical shift
A_strt <- (max(Data$NZS) - min(Data$NZS)) / 2 # Amplitude
L_strt <- 12 # length of a cycle, 12 months

# find predictions for original time series
myFit <- nls(NZS~x_0 + A*sin(2*pi * Data$TimePt / L), data = Data, start = list(x_0 = x_0_strt, A = A_strt, L = L_strt))

# x = x_t + A*sin(2*pi*t/L)

sumFit <- summary(myFit)
x_0 <- sumFit$coefficients[1]
A <- sumFit$coefficients[2]
L <- sumFit$coefficients[3]

plot(Data$NZS ~ Data$TimePt, data = Data)
lines(Data$TimePt, x_0 + A*sin(2*pi * Data$TimePt / L), col="blue")
# lines(Data$TimePt,Data$NZS, col = "red")
