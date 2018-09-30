CairoPDF("Panel2.pdf", width=13, height=5.5, bg="transparent")
layout(matrix(c(1,2), ncol=2))

# Consumption/Metabolism vs. Temperature
meta_data <- read.csv("~/Documents/FIU/Research/MTE_Urchins/Data/consmet_meta.csv")
meta.sub <- subset(meta_data, Experiment!=9)


library(lme4)
mod1 <- lmer(Ratio~1 + (1|Common.name), data=meta.sub)
mod2 <- lmer(Ratio~Temp + (Temp|Common.name), data=meta.sub)
mod3 <- lmer(Ratio~Temp + I(Temp^2) + (Temp|Common.name), data=meta.sub)

library(bbmle)
ICtab(mod1, mod2, mod3)

# Plot COLOR FIG
par(mar=c(4,4,1,1)+0.2)
plot(Ratio~Temp, data=meta.sub, pch=21, xlab = expression("Temperature "*degree*C), ylab="Metabolism/Consumption Ratio", cex.lab=1.2, xlim=c(0,50), axes=F, ylim=c(0.1,2.5), cex=1.4, col="white", bg="black")
axis(1, lwd=0, lwd.tick=1, tck=0.02)
axis(2, lwd=0, lwd.tick=1, tck=0.02, at=seq(0,3,0.5), las=1)
axis(4, lwd=0, lwd.tick=1, tck=0.02, at=seq(0,3,0.5), lab=F)
axis(3, lwd=0, lwd.tick=1, tck=0.02, lab=F)
box()

ef <- fixef(mod2)
xest <- seq(min(meta.sub$Temp), max(meta.sub$Temp), 0.01)
ypred <- ef[1] + ef[2]*xest
lines(xest, ypred, lwd=2)


color <- c(1:13)
sp.names <- levels(meta.sub$Common.name)
F1 <- fitted(mod2, level=1)
for(i in 1:12){
  x1 <- meta.sub$Temp[meta.sub$Common.name==sp.names[i]]
  y1 <- F1[meta.sub$Common.name==sp.names[i]]
  K <- order(x1)
  lines(sort(x1), y1[K], lty=2, col=color[i])
}
legend("topleft", bty="n", legend=sp.names, col=color, cex=0.7, inset=0.02, lty=2, ncol=2)
mtext(text="A", side=2, line=3, las=1, at=par("usr")[4], font=2, cex=1.4)

#Plot GREYSCALE FIG
par(mar=c(4,4,1,1)+0.2)
plot(Ratio~Temp, data=meta.sub, pch=plotchar, xlab = expression("Temperature "*degree*C), ylab="Metabolism/Consumption Ratio", cex.lab=1.2, xlim=c(0,50), axes=F, ylim=c(0.1,2.5), cex=1.4, col="black", bg=as.character(fillcol))
axis(1, lwd=0, lwd.tick=1, tck=0.02)
axis(2, lwd=0, lwd.tick=1, tck=0.02, at=seq(0,3,0.5), las=1)
axis(4, lwd=0, lwd.tick=1, tck=0.02, at=seq(0,3,0.5), lab=F)
axis(3, lwd=0, lwd.tick=1, tck=0.02, lab=F)
box()

ef <- fixef(mod2)
xest <- seq(min(meta.sub$Temp), max(meta.sub$Temp), 0.01)
ypred <- ef[1] + ef[2]*xest
lines(xest, ypred, lwd=2)


linetype <- c(1:13)
sp.names <- levels(meta.sub$Common.name)
F1 <- fitted(mod2, level=1)
for(i in 1:12){
  x1 <- meta.sub$Temp[meta.sub$Common.name==sp.names[i]]
  y1 <- F1[meta.sub$Common.name==sp.names[i]]
  K <- order(x1)
  lines(sort(x1), y1[K], lty=linetype[i])
}

legend.pch <- with(meta.sub, aggregate(list('plotchar'=plotchar), list('Species'=Common.name, 'Fill'=fillcol), mean))
legend.pch <- legend.pch[order(legend.pch$Species),]

legend("topleft", bty="n", legend=legend.pch$Species, cex=0.7, inset=0.02, lty=linetype, ncol=2, pch=as.numeric(legend.pch$plotchar), pt.bg=as.character(legend.pch$Fill))
mtext(text="A", side=2, line=3, las=1, at=par("usr")[4], font=2, cex=1.4)

# R2 value
cor(fitted(mod2), meta.sub$Ratio)^2

# Metabolism/Consumption vs. growth
meta_data <- read.csv("~/Documents/FIU/Research/MTE_Urchins/Data/growth_meta.csv")
meta_data$Ratio <- (meta_data$STD.Met+4)/(meta_data$STD.Cons+4)

meta.sub <- subset(meta_data, Experiment!=9)

mod.no.outlier1 <- lmer(STD.Growth.Pos~1 + (Ratio|Common), data=meta.sub)
mod.no.outlier2 <- lmer(STD.Growth.Pos~Ratio + (Ratio|Common), data=meta.sub)
mod.no.outlier3 <- lmer(STD.Growth.Pos~Ratio+I(Ratio^2) + (Ratio|Common), data=meta.sub)

ICtab(mod.no.outlier1, mod.no.outlier2, mod.no.outlier3)

#Plot COLOR
par(mar=c(4,4,1,1)+0.2)
color <- c(1:7)
sp.names <- levels(meta.sub$Common)

plot(STD.Growth.Pos~Ratio, data=meta.sub, pch=21, xlab = "Metabolism/Consumption Ratio", ylab="Standardized Growth Rates", cex.lab=1.2, axes=F, ylim=c(-2,3), cex=1.4, col="white", bg="black")

ef <- fixef(mod.no.outlier3)
xest <- seq(min(meta.sub$Ratio),max(meta.sub$Ratio),0.01)
ypred <- ef[1] + ef[2]*xest + ef[3]*xest^2
lines(xest, ypred, lwd=2)

F1 <- fitted(mod.no.outlier3)
for(i in c(1:7)){
x1 <- meta.sub$Ratio[meta.sub$Common==sp.names[i]]
y1 <- F1[meta.sub$Common==sp.names[i]]
K <- order(x1)
lines(sort(x1), y1[K], col=color[i], lwd=1, lty=2)
}
axis(1, lwd=0, lwd.tick=1, tck=0.02)
axis(2, lwd=0, lwd.tick=1, tck=0.02, las=1)
axis(3, lwd=0, lwd.tick=1, lab=F, tck=0.02)
axis(4, lwd=0 ,lwd.tick=1, lab=F, tck=0.02)
box()

legend("topright", legend=sp.names, lty=2, col=color, bty="n", cex=0.8, inset=0.02)
mtext(text="B", side=2, line=3, las=1, at=par("usr")[4], font=2, cex=1.4)

#R2 value
cor(fitted(mod.no.outlier3), meta.sub$STD.Growth.Pos)^2

#Plot GREAYSCALE
par(mar=c(4,4,1,1)+0.2)
sp.names <- levels(meta.sub$Common)

plot(STD.Growth.Pos~Ratio, data=meta.sub, pch=plotchar, xlab = "Metabolism/Consumption Ratio", ylab="Standardized Growth Rates", cex.lab=1.2, axes=F, ylim=c(-2,3), cex=1.4, col="black", bg=as.character(fillcol))

ef <- fixef(mod.no.outlier3)
xest <- seq(min(meta.sub$Ratio),max(meta.sub$Ratio),0.01)
ypred <- ef[1] + ef[2]*xest + ef[3]*xest^2
lines(xest, ypred, lwd=2)

linetype <- c(1:7)
F1 <- fitted(mod.no.outlier3)

for(i in c(1:7)){
  x1 <- meta.sub$Ratio[meta.sub$Common==sp.names[i]]
  y1 <- F1[meta.sub$Common==sp.names[i]]
  K <- order(x1)
  lines(sort(x1), y1[K], lwd=1, lty=linetype[i])
}

axis(1, lwd=0, lwd.tick=1, tck=0.02)
axis(2, lwd=0, lwd.tick=1, tck=0.02, las=1)
axis(3, lwd=0, lwd.tick=1, lab=F, tck=0.02)
axis(4, lwd=0 ,lwd.tick=1, lab=F, tck=0.02)
box()

legend.pch <- with(meta.sub, aggregate(list('plotchar'=plotchar), list('Species'=Common, 'Fill'=fillcol), mean))
legend.pch <- legend.pch[order(legend.pch$Species),]

legend("topright", bty="n", legend=legend.pch$Species, cex=0.7, inset=0.02, lty=linetype, ncol=2, pch=as.numeric(legend.pch$plotchar), pt.bg=as.character(legend.pch$Fill))
mtext(text="B", side=2, line=3, las=1, at=par("usr")[4], font=2, cex=1.4)

dev.off()
