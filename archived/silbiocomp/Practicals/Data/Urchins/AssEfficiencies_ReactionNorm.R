# Analysis of Assimilation Efficiencies on the full model

AssEff <- read.csv("~/Documents/FIU/Research/ThermalOpt_Geog/Data/AssEff.csv")
AssEff<-AssEff[-c(13:15),-12]
AssEff$Ar<--1/(8.617*10^-5*(AssEff$Temp+273))
l.mod<-lm(log(AssEff)~Ar+log(UrchinMass),AssEff)
summary(l.mod)

null.mod <- nls(AssEff~a*UrchinMass^c, start=list(a=0.66,c=-0.02), data=AssEff[-2,])
null.mod.nomass <- nls(AssEff~a, start=list(a=0.66), data=AssEff[-2,])
summary(null.mod.nomass)

lin.mod <- lm(AssEff ~ Temp + UrchinMass, data=AssEff[-2,])
lin.nomass <- lm(AssEff ~ Temp, data=AssEff[-2,])

mte.mod<-nls(AssEff~a*exp(b*Ar)*UrchinMass^c,start=list(a=exp(1),b=0,c=-0.02),data=AssEff[-2,],control=list(maxiter=1000))
mte.mod.nomass <- nls(AssEff~a*exp(b*Ar), start=list(a=exp(1),b=0), data=AssEff[-2,])
summary(mte.mod.nomass)

library(bbmle)
ICtab(null.mod.nomass, lin.nomass, mte.mod.nomass, base=T)

NullLik <- exp(logLik(null.mod.nomass))
LinLik <- exp(logLik(lin.nomass))
MTELik <- exp(logLik(mte.mod.nomass))

# Posterior Probabilities
Liks <- c(NullLik, LinLik, MTELik)

round(sapply(Liks, function(x) x/sum(Liks)),2)



# Plot
library(plotrix)
means <- tapply(AssEff$AssEff, AssEff$Temp, mean)
ses <- tapply(AssEff$AssEff, AssEff$Temp, std.error)
par(mar=c(4,4,1,1)+0.2)
plot(c(20,23,26,29,31), means, pch=21, type="n", axes=F, xlab=expression("Temperature "*degree*C), ylab="Assimilation Efficiency", ylim=c(0,1), cex=1.2)
axis(1, at=c(20,23,26,29,31), lwd=0, lwd.tick=1, tck=0.02)
axis(2, at=seq(0,1,0.2), lwd=0, lwd.tick=1, tck=0.02)
axis(3, at=c(20,23,26,29,31), lwd=0, lwd.tick=1, tck=0.02, lab=F)
axis(4, at=seq(0,1,0.2), lwd=0, lwd.tick=1, tck=0.02, lab=F)
segments(c(20,23,26,29,31), means-ses, c(20,23,26,29,31), means+ses)
points(c(20,23,26,29,31), means, pch=21, bg="grey", cex=1.2)
box()
segments(20,0.69, 31, 0.69)