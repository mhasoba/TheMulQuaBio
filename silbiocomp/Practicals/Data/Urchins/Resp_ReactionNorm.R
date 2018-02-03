#Analysis of urchin respiration rates with temperature using the full dataset

# Import the data
respiration <- read.csv("~/Documents/FIU/Research/MTE_Urchins/Data/respiration.csv")
# Standardize to 24 h
respiration$C_Resp_Day <- respiration$C_Resp_Mass*24
# Create the Arrhenius temperature
respiration$Ar<--1/(8.617*10^-5*(respiration$Temp+273))
# Run the initial linear model to supply starting parameter estimates to the non-linear regression
l.mod<-lm(log(C_Resp_Day)~Ar+log(UrchinMass),respiration)
summary(l.mod)
# Calculate the variance of each temperature, the inverse will be used as a weight in the regression
w<-numeric(25)
for(i in c(20,23,26,29,31)){
  index<-which(respiration$Temp==i)
  tempor<-respiration[index,]
  var.temp<-var(tempor$C_Resp_Day)
  w[index]<-1/var.temp
}

# Run null model
Null.mod <- nls(C_Resp_Day~a*UrchinMass^c, data=respiration, start=list(a=exp(6),c=0.25))

# Null model, with no mass
Null.mod.nomass <- nls(C_Resp_Day~a, data=respiration, start=list(a=0.01))

# Run linear model
lin.mod <- lm(C_Resp_Day~Temp+UrchinMass, data=respiration)
lin.mod.nomass <- lm(C_Resp_Day~Temp, data=respiration)

# Run the MTE regression using the parameter estimates from the linear regression
MTE.form<-formula(C_Resp_Day~a*exp(b*Ar)*UrchinMass^c)
MTE.mod<-nls(MTE.form,data=respiration,start=list(a=exp(13),b=0.40,c=0.026))

# Run MTE, no mass
MTE.nomass.form <- MTE.form<-formula(C_Resp_Day~a*exp(b*Ar))
MTE.nomass.mod<-nls(MTE.nomass.form,data=respiration,start=list(a=75000,b=0.40))

# Run the Gaussian Model
Gauss.mod <- nls(C_Resp_Day ~ exp(beta0+beta1*Ar+beta2*I(Ar^2))*UrchinMass^beta3, data=respiration, start=list(beta0=0,beta1=0,beta2=0,beta3=0.2))
Gauss.nomass <- nls(C_Resp_Day ~ exp(beta0+beta1*Ar+beta2*I(Ar^2)), data=respiration, start=list(beta0=0,beta1=0,beta2=0))

# Get the AICc values
library(bbmle)
ICtab(Null.mod.nomass, lin.mod.nomass, MTE.mod, Gauss.nomass, type="AICc", nobs=25, base=T, weights=T)

# Get the Likelihood values
NullLik <- exp(logLik(Null.mod.nomass))
LinLik <- exp(logLik(lin.mod.nomass))
MTELik <- exp(logLik(MTE.mod))
GaussLik <- exp(logLik(Gauss.nomass))

Liks <- c(NullLik, LinLik, MTELik, GaussLik)

# Calculate Posterior Probabilties
round(sapply(Liks, function(x) x/sum(Liks)),2)

# Correct the resp values
respiration$masscorr <- respiration$C_Resp_Day/respiration$UrchinMass^0.32

# Plot the Mass-corrected respiration~temperature values
means <- with(respiration, tapply(masscorr,Temp,mean))
library(plotrix)
ses <- with(respiration, tapply(masscorr,Temp,std.error))
plot.temps <- sort(unique(respiration$Temp))
par(mar=c(4,4.4,1,1)+0.2)
plot(plot.temps,means,xlab=expression("Temperature "*degree*C),ylab=expression("mg C Respired per Day"/"Mass"^0.33),axes=F,cex.lab=1.2,ylim=c(0,0.05),type="n")
segments(plot.temps,means-ses,plot.temps,means+ses)
points(plot.temps,means,pch=21,bg="grey",cex=1.2)
pred.temps <- seq(20,31,0.01)
MTE.pred2 <- 1.605e06*exp(0.46*(-1/(8.617e-5*(pred.temps+273))))
lines(pred.temps,MTE.pred2,lwd=1.2)
axis(1,at=c(20,23,26,29,31),lwd=0,lwd.tick=1,tck=0.02)
axis(2,lwd=0,lwd.tick=1,tck=0.02)
axis(4,lwd=0,lwd.tick=1,tck=0.02,lab=F)
axis(3,at=c(20,23,26,29,31),lwd=0,lwd.tick=1,tck=0.02,lab=F)
box()

# Plot the Temperature-corrected respiration~mass values
# Temp-Correct the respiration values
respiration$tempcorr <- respiration$C_Resp_Day/exp(0.46*respiration$Ar)
par(mar=c(4,5.4,1,1)+0.2)
plot(tempcorr~UrchinMass, respiration, pch=21, cex=1.2, bg='grey', axes=F, cex.lab=1.2, xlab='Urchin Mass (g)', ylab='')
axis(1, lwd=0, lwd.tick=1, tck=0.02)
axis(2, lwd=0, lwd.tick=1, tck=0.02, las=1, 
     at=c(6 * 10^6, 8*10^6, 1*10^7, 1.2*10^7),
     lab=c(expression(6 %*% 10^6), expression(8 %*% 10^6), expression(1 %*% 10^7), expression(1.2 %*% 10^7)))
mtext(expression('mg C Respired per Day'/e^(0.46*frac(-~~1, kT))), line=4, side=2, cex=1.2)
axis(3, lwd=0 ,lwd.tick=1, tck=0.02, lab=F)
axis(4, lwd=0, lwd.tick=1, tck=0.02, lab=F)
box()
pred.mass <- seq(min(respiration$UrchinMass), max(respiration$UrchinMass), 0.1)
yhat <- 1.605e06 * pred.mass^0.3271
lines(pred.mass, yhat)