rm(lst=ls())

load('../Data/KeyWestAnnualMeanTemperature.Rdata')

#the real correlation
temps<-ats$Temp
real.cor<-cor(temps[1:(length(temps)-1)],
          temps[2:length(temps)])

#the surrogate correlations
numsample<-10000
surr.cor<-rep(NA,numsample)
for (counter in 1:numsample)
{
  s.temps<-sample(temps,100,replace=F)
  surr.cor[counter]<-cor(s.temps[1:(length(s.temps)-1)],
                         s.temps[2:length(s.temps)])
}

hist(surr.cor,50)
lines(c(real.cor,real.cor),c(0,200),col='red',lwd=3)
sum(surr.cor<real.cor)/numsample
