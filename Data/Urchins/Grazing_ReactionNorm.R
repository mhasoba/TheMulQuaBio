# Analysis of grazing-temperature continuous reaction norm using the full dataset

# Import the data
grazing <- read.csv("~/Documents/FIU/Research/MTE_Urchins/Data/grazing.csv")
#Convert gC to mgC
grazing$Loss_mgC<-grazing$Loss_gC*1000
#Rework the temperatures into their correct values
mod.temp<-c(20,23,26,29,31,31)
exp.temp<-c(20,23,26,29,32,35)
for(i in 1:6){
index<-which(grazing$Temp==exp.temp[i])
grazing$mod.temp[index]<-mod.temp[i]
}
# Remove any observations with less than 5% grazing
grazing.sub<-subset(grazing,PcLoss>0.05)
# Calculate the Arrhenius temperature
grazing.sub$Ar<--1/(8.617*10^-5*(grazing.sub$mod.temp+273))

# Run null model
null.mod <- nls(Loss_mgC~beta0*UrchinMass^beta2, data=grazing.sub, start=list(beta0=20,beta2=0.24))

# Run linear model
lin.mod <- lm(Loss_mgC ~ mod.temp + UrchinMass, data=grazing.sub)

# Run the transformed model to supply estimates to the MTE model
mte.l.mod <- lm(log(Loss_mgC)~log(UrchinMass)+Ar,grazing.sub)
mte.mod <- nls(Loss_mgC~beta0*exp(beta1*Ar)*UrchinMass^beta2,data=grazing.sub,start=list(beta0=exp(6.2598),beta1=0.08,beta2=0.36))
summary(mte.mod)

# Run the transformed model to supply estimates to the non-linear regression
gaussian.l.mod<-lm(log(Loss_mgC)~log(UrchinMass)+Ar+I(Ar^2),grazing.sub)
summary(gaussian.l.mod)
# Set up the non-linear Gaussian model
gaussian.mod<-nls(Loss_mgC~exp(beta0+beta1*Ar+beta2*I(Ar^2))*UrchinMass^beta3,start=list(beta0=0,beta1=0,beta2=0,beta3=0.35),data=grazing.sub)
summary(gaussian.mod)

# Set up the non-linear Briere model
briere <- formula(Loss_mgC ~ a*mod.temp*(mod.temp-m)*sqrt(n-mod.temp)*UrchinMass^b)
briere.mod <- nls(briere, data=grazing.sub, start=list(a=100,n=35,m=12,b=1))
summary(briere.mod)

# Calculate the AIC for each model
library(bbmle)
ICtab(null.mod, lin.mod, mte.mod, gaussian.mod, briere.mod, nobs=49, type="AICc", base=T)

NullLik <- exp(logLik(null.mod))
LinLik <- exp(logLik(lin.mod))
MTELik <- exp(logLik(mte.mod))
GaussLik <- exp(logLik(gaussian.mod))
BriereLik <- exp(logLik(briere.mod))

# Calculate Posterior Probabilitys
Liks <- c(NullLik, LinLik, MTELik, GaussLik, BriereLik)
round(sapply(Liks, function(x) x/sum(Liks)),2)

# Briere provides the best fit, lowest AIC, BIC scores, high R2, and easiest parameter intepretation

#Mass Correct the Grazing Rates
grazing.sub$MassCorr <- grazing.sub$Loss_mgC/grazing.sub$UrchinMass^0.25

masscorr.briere <- formula(MassCorr ~ a*mod.temp*(mod.temp-m)*sqrt(n-mod.temp))
masscorr.briere.mod <- nls(masscorr.briere, data=grazing.sub, start=list(a=50,n=32,m=9.1))
summary(masscorr.briere.mod)

# Plot Mass-Corrected Grazing Rates
library(plotrix)
means <- tapply(grazing.sub$MassCorr,grazing.sub$mod.temp,mean)
ses <- tapply(grazing.sub$MassCorr,grazing.sub$mod.temp,std.error)
plot.temps <- sort(unique(grazing.sub$mod.temp))
par(mar=c(4,4.4,1,1)+0.2)
plot(plot.temps,means,axes=F,xlab=expression("Temperature "*degree*C),ylab=expression("mgC Consumed"/"Mass"^0.25),ylim=c(20,50),type="n",cex.lab=1.2)
segments(plot.temps,means-ses,plot.temps,means+ses)
points(plot.temps,means,pch=21,bg="grey",cex=1.3)
axis(1,at=c(20,23,26,29,31),lwd=0,lwd.tick=1,tck=0.02)
axis(2,lwd=0,lwd.tick=1,tck=0.02)
axis(3,at=c(20,23,26,29,31),lwd=0,lwd.tick=1,tck=0.02,lab=F)
axis(4,lwd=0,lwd.tick=1,tck=0.02,lab=F)
box()
pred.data <- data.frame(mod.temp = seq(20,31,0.01))
yhat <- predict(masscorr.briere.mod,pred.data)
lines(seq(20,31,0.01),yhat,lwd=1.2)

# Plot Temp-Corrected Mass-Consumption
grazing.sub$temp.corr <- grazing.sub$Loss_mgC/(0.3*grazing.sub$mod.temp*(9.17-grazing.sub$mod.temp)*sqrt(32.61-grazing.sub$mod.temp))
temp.corr.mod <- formula(temp.corr ~ a*UrchinMass^b)
temp.corr.mod <- nls(temp.corr.mod, data=grazing.sub, start=list(a=50, b=0.25))
plot(temp.corr~UrchinMass, data=grazing.sub, cex=1.2, pch=21, bg='grey',
     ylab='Temperature-Corrected Consumption (mg C per day)', xlab='Urchin Mass', cex.lab=1.2,
     axes=F)
axis(1, lwd=0, lwd.tick=1, tck=0.02)
axis(2, lwd=0, lwd.tick=1, tck=0.02, las=1)
axis(3, lwd=0, lwd.tick=1, tck=0.02, lab=F)
axis(4, lwd=0, lwd.tick=1, tck=0.02, lab=F)
box()
pred.mass <- seq(min(grazing.sub$UrchinMass), max(grazing.sub$UrchinMass), 0.1)
yhat <- predict(temp.corr.mod, data.frame(UrchinMass=pred.mass))
lines(pred.mass, yhat)

