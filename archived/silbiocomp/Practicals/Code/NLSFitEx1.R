# Simple NLS Example adapted from http://www.walkingrandomly.com/?p=5254; 
# Try both nls and nlsLM

# library(minpack.lm)
library(graphics)

rm(list = ls())  # clear objects
graphics.off()  #close all open figures and graphics objects

# construct the data vectors using c()
xdata = c(-2,-1.64,-1.33,-0.7,0,0.45,1.2,1.64,2.32,2.9)
ydata = c(0.699369,0.700462,0.695354,1.03905,1.97389,2.41143,1.91091,0.919576,-0.730975,-1.42001)

# look at it
plot(xdata,ydata)

# some starting values
p1 = 1
p2 = 0.2

# do the fit
NLSfit = nls(ydata ~ p1*cos(p2*xdata) + p2*sin(p1*xdata), start=list(p1=p1,p2=p2))
# NLSfit = nlsLM(ydata ~ p1*cos(p2*xdata) + p2*sin(p1*xdata), start=list(p1=p1,p2=p2))

# summarize
summary(NLSfit)
sum(resid(NLSfit)^2)
confint(NLSfit)

Data2Plt = data.frame(xdata = seq(min(xdata),max(xdata),len=200))

lines(Data2Plt$xdata,predict(NLSfit,newdata=Data2Plt)) 
