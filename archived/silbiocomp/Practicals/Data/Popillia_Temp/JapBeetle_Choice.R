library(plotrix)
library(lattice)
library(reshape2)
library(vegan)

# CairoPDF('JapBeetle_Choice_raw.pdf', width=6.5, height=5.5, bg='transparent')
par(mar=c(4,4,1,1)+0.2)

JapBeet_Choice <- read.csv("~/Documents/FIU/Research/JapBeetle_Temp_Herbivory/Data/Choice_Assays/JapBeet_Choice.csv")
JapBeet_Choice$Temperature[which(JapBeet_Choice$Temperature==33)] <- 35

## PLOT PERCENT LOSS
means <- with(JapBeet_Choice, aggregate(PctLoss, list('Temp'=Temperature, 'Plant'=Food_Type), mean))
errs <- with(JapBeet_Choice, aggregate(PctLoss, list('Temp'=Temperature, 'Plant'=Food_Type), std.error))



par(mar=c(4,4,1,1)+0.2)
plot(x ~ Temp, data=means, type='n', ylim=c(0,1), axes=F,
     xlab=expression('Temperature '*degree*C), 
     ylab='Percent Loss',
     cex.lab=1.2,
     xlim=c(23,37))

colors <- data.frame('Plant' = unique(means$Plant),
                     'color' = as.character(c('black', 'white', 'black', 'black', 'black', 'white', 'grey', 'black', 'white')),
                     'shape'= c(24, 24, 22, 23, 21, 21, 21, 25, 25),
                     'line' = c(1,1,1,1,2,1,2,1,1))

cons.means <- merge(colors, means)
cons.means$shape <- as.numeric(cons.means$shape)

plant.names <- unique(means$Plant)

for(i in 1:length(plant.names)){
  temp.sub <- subset(cons.means, Plant==plant.names[i])
  temp.sub2 <- subset(errs, Plant==plant.names[i])
  segments(temp.sub$Temp, temp.sub$x - temp.sub2$x, temp.sub$Temp, temp.sub$x + temp.sub2$x)
  points(x~Temp, data=temp.sub, pch=as.numeric(shape), bg=as.character(color), cex=1.5)
}

axis(1, at=c(25, 35), lwd=0, lwd.tick=1)
axis(2, lwd=0, lwd.tick=1, las=1)
box()

op <- par(font=3)

legend('top', pch=as.numeric(colors$shape), lty=colors$line, 
       pt.bg=as.character(colors$color), legend=as.character(colors$Plant),
       ncol=3, cex=0.7, bty='n')

par(op)

means <- with(JapBeet_Choice, tapply(PctLoss, Temperature, mean))
errs <- with(JapBeet_Choice, tapply(PctLoss, Temperature, std.error))

segments(c(25,35)+1, means-errs, c(25,35)+1, means+errs)

points(c(25,35)+1, means, pch=21, bg='black', cex=1.5)
points(c(25,35)+1, means, pch=21, bg='grey', cex=1)



points(28.1, 0.9, pch=21, bg='black', cex=1)
points(28.1, 0.9, pch=21, bg='grey', cex=.6)
text(28.4, 0.895, 'Overall Mean', cex=0.7, pos=4)



#clean up
rm(temp.sub)
rm(temp.sub2)
rm(colors)

manova.data <- dcast(JapBeet_Choice, CupID + Date + Temperature~Food_Type, value.var='PctLoss', mean)
manova.data$TempGrp <- ifelse(manova.data$Temp==25, 'A', 'B')
colnames(manova.data) <- c('CupID', 'Date', 'Temp', 'Acn', 'Acr', 'Lis', 'Plo', 'Rom', 'Rua', 'Rup', 'Vip', 'Viv', 'Grp')

# Calculate Within group SSCP for each temperture
t25 <- subset(manova.data, Temp==25)
ones <- matrix(rep(1,8))
a25 <- t25[,4:12]
a25 <- as.matrix(a25)
D25 <- a25 - ones%*%t(ones)%*%a25*1/8
W25 <- t(D25) %*% D25

t35 <- subset(manova.data, Temp==35)
a35 <- as.matrix(t35[,4:12])
D35 <- a35 - ones%*%t(ones)%*%a35*1/8
W35 <- t(D35)%*%D35

W.ov <- W25 + W35

# Calculate Total SSCP
tot <- as.matrix(manova.data[,4:12])
dtot <- tot - matrix(rep(1,16)) %*% t(matrix(rep(1,16))) %*% tot * 1/16
T.ov <- t(dtot) %*% dtot

# Calculate B SSCP
B.ov <- T.ov - W.ov


wilks <- det(W.ov) / det(T.ov)

# Calculate wilks lambda - note this is IDENTICAL to the wilks' lamba reported 
# using the built in manova() function, except for some reason the p-value is 
# incorrect.

# so, calculate chi-sq stat manualy
test.stat <- -((16-1) - 0.5*(9+2))*log(wilks)

# this comes from a chi-sq distribution with 9*(2-1) degrees of freedom
1-pchisq(test.stat, 9)
#p-value = 0.037

# MANOVA is significant, so post-hoc it using False Discovery Rate correction
p20 <- subset(JapBeet_Choice, Temperature==25)
p20 <- with(p20, pairwise.t.test(PctLoss, Food_Type, 
                                 var.equal=F, p.adjust='none'))
p20 <- round(p20$p.value,5)
p20 <- unmatrix(p20)
p20 <- p20[!is.na(p20)]
p20 <- as.data.frame(sort(p20))
p20$rank <- order(p20[,1])
p20$FDR <- p20$rank * (0.05/144)
p20$sig <- p20[,1] < p20$FDR

p35 <- subset(JapBeet_Choice, Temperature==35)
p35 <- with(p35, pairwise.t.test(PctLoss, Food_Type, 
                                 var.equal=F, p.adjust='none'))
p35 <- round(p35$p.value,5)
p35 <- unmatrix(p35)
p35 <- p35[!is.na(p35)]
p35 <- as.data.frame(sort(p35))
p35$rank <- order(p35[,1])
p35$FDR <- p35$rank * (0.05/144)
p35$sig <- p35[,1] < p35$FDR

# Equality of Covariance Matrices
Choice25 <- subset(manova.data, Temp==25)
Choice35 <- subset(manova.data, Temp==35)

cov25 <- cov(Choice25[,4:12])
cov35 <- cov(Choice35[,4:12])

mean.diffs <- numeric(9999)
mean.diffs[1] <- mean(cov35 - cov25)

for(i in 2:9999){
  index <- sample(1:16, 8, replace=F)
  MC25 <- manova.data[index, 4:12]
  MC35 <- manova.data[-index, 4:12]
  mean.diffs[i] <- mean(cov(MC35) - cov(MC25))
}

par(mar=c(4,4,1,1)+0.2)
hist(mean.diffs, breaks=20, main='',
     prob=T, xlab='Average Difference Between Covariance Matrices')
abline(v=mean.diffs[1])

mean(mean.diffs > mean.diffs[1])

# Simpson's Index
diet <- manova.data[,4:12]
rel.abund <- apply(diet, 1, function(x) x/sum(x))
rel.abund <- t(rel.abund)
temp <- manova.data$Temp
div <- diversity(rel.abund, index='simpson', 1)
t.test(div~temp, var.equal=F)

means <- tapply(div, temp, mean)
errs <- tapply(div, temp, std.error)
plot(means, xlim=c(0.5,2.5),
     ylim=c(0.6, 1),
     xlab=expression('Temperature '*degree*C),
     ylab='Simpson\'s Diversity Index (1-D)',
     cex.lab=1.2,
     axes=F)

segments(1:2, means-errs, 1:2, means+errs)
points(1:2, means, pch=16, cex=1.2)
axis(1, at=1:2, lab=c(25,35), lwd=0, lwd.tick=1)
axis(2, lwd=0, lwd.tick=1, las=1)
box(bty='l')

