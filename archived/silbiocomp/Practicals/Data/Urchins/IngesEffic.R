# Analysis of ingestion efficiency

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

# Calculate the metabolic rate of each urchin using the coefficients from the MTE model
grazing.sub$Metab <- 1.61e6 * exp(0.46*grazing.sub$Ar) * grazing.sub$UrchinMass^0.32

# Calculate the ingestion efficiency (Rall et al) as the amount of food assimilated per unit carbon respired
# Using 0.66 assimilation efficiency
grazing.sub$IngEff <- 0.70 * grazing.sub$Loss_mgC/grazing.sub$Metab

# Calculate the variance of each temperature, the inverse will be used as a weight in the regression
w<-numeric(49)
for(i in c(20,23,26,29,31)){
  index<-which(grazing.sub$mod.temp==i)
  tempor<-grazing.sub[index,]
  var.temp<-var(tempor$IngEff)
  w[index]<-1/var.temp
}

# Null model
Null.ingest <- nls(IngEff~a*UrchinMass^c, data=grazing.sub, start=list(a=150, c=0.27))
Null.ingest.nomass <- nls(IngEff~a, data=grazing.sub, start=list(a=150))

# Linear model
Lin.ingest <- lm(IngEff ~ mod.temp + UrchinMass, data=grazing.sub)
Lin.nomass <- lm(IngEff ~ mod.temp, data=grazing.sub)

# Find the MTE model of ingestion efficiency
MTE.ingest <- nls(IngEff~a*exp(b*Ar)*UrchinMass^c, data=grazing.sub, start=list(a=150, b=-0.35, c=0.27))
MTE.ingest.nomass <- nls(IngEff~a*exp(b*Ar), data=grazing.sub, start=list(a=150, b=-0.35))

# Find the Gaussian model of ingestion efficiency
gaussian.ingest <- nls(IngEff~exp(beta0+beta1*mod.temp+beta2*I(mod.temp^2))*UrchinMass^beta3,start=list(beta0=0.84,beta1=0.66,beta2=--0.013,beta3=0.122),data=grazing.sub)
gaussian.nomass <- nls(IngEff~exp(beta0+beta1*mod.temp+beta2*I(mod.temp^2)),start=list(beta0=0.84,beta1=0.66,beta2=--0.013),data=grazing.sub)

# Set up the non-linear Briere model
briere <- formula(IngEff ~ a*mod.temp*(mod.temp-m)*sqrt(n-mod.temp)*UrchinMass^b)
briere.ingest <- nls(briere, data=grazing.sub, start=list(a=.18,n=35,m=12,b=1), lower=c(-Inf,31,-Inf,-Inf),algorithm="port")
briere.nomass.form <- formula(IngEff ~ a*mod.temp*(mod.temp-m)*sqrt(n-mod.temp))
briere.nomass <- nls(briere.nomass.form, data=grazing.sub, start=list(a=.18,n=35,m=12), lower=c(-Inf,31,-Inf,-Inf),algorithm="port")


# Compare AICc values
library(bbmle)
ICtab(Null.ingest.nomass, Lin.nomass, MTE.ingest.nomass, gaussian.nomass, briere.nomass, type="AICc", base=T, nobs=49)

NullLik <- exp(logLik(Null.ingest.nomass))
LinLik <- exp(logLik(Lin.nomass))
MTELik <- exp(logLik(MTE.ingest.nomass))
GaussLik <- exp(logLik(gaussian.nomass))
BrieLik <- exp(logLik(briere.nomass))

# Posterior Probabilities
Liks <- c(NullLik, LinLik, MTELik, GaussLik, BrieLik)
round(sapply(Liks, function(x) x/sum(Liks)), 2)

# Plot the ingestion efficiency values
library(plotrix)
par(mar=c(4,4.4,1,1)+0.2)
plot.temps <- c(20,23, 26, 29, 31)
IngEff.means <- with(grazing.sub, tapply(IngEff, mod.temp, mean))
plot(plot.temps, IngEff.means, xlab=expression("Temperature "*degree*C), ylab=expression("Ingestion Efficiency"), cex.lab=1.2, axes=F, ylim=c(300,800), type="n")
IngEff.err <- with(grazing.sub, tapply(IngEff, mod.temp, std.error))
segments(plot.temps, IngEff.means-IngEff.err, plot.temps, IngEff.means+IngEff.err)
points(plot.temps, IngEff.means, pch=21, bg="grey", cex=1.2)
pred.temps <- seq(20,31,0.01)
yhat <- predict(briere.nomass, data.frame(mod.temp=pred.temps))
lines(pred.temps,yhat)
axis(1,at=plot.temps, lwd=0, lwd.tick=1, tck=0.02)
axis(2, lwd=0, lwd.tick=1, tck=0.02)
axis(3,at=plot.temps, lab=F, lwd=0, lwd.tick=1, tck=0.02)
axis(4, lwd=0, lwd.tick=1, tck=0.02, lab=F)
box()
