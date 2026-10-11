# DATA ANAYLSIS STEPS FOR JAPANESE BEETLE DATA

# OBTAINED PHYLOGENY OF PLANTS FROM PHYLOMATIC (APG III). NODE AGES TAKEN FROM WISKTROM ET AL 2001. PHYLOGENY AND AGES RUN THROUGH BLADJ (PHYLOCOM) TO ADJUST NODE AGE (INSTEAD OF ALL NODES BEING THE SAME DISTANCE APART). NOTE: THERE WAS NO AGE FOR THE SEPARATE OF RUBUS FROM ROSA

library(ape)
library(Hmisc)
library(nlme)
library(lattice)
library(plotrix)
library(multcomp)
library(gdata)

## LOAD IN FEEDING DATA
jap_beet_no_choice <- read.csv("~/Documents/FIU/research/JapBeetle_Temp_Herbivory/Data/No_Choice_Assays/jap_beet_no_choice.csv")
jap.feeding <- subset(jap_beet_no_choice, Consumption!='NA')
jap.feeding$Food_Type <- factor(jap.feeding$Food_Type)
jap.feeding$Temperature[which(jap.feeding$Temperature==33)] <- 35

## READ IN PHYLOGENETIC TREE CODE
source('/Users/Nate/Documents/FIU/research/JapBeetle_Temp_Herbivory/Data_Analysis/JapBeetle_PhyloGraph.r')

########### ANALYSIS OF NO-CHOICE ASSAYS ##################
###########################################################
prelim.mod <- lm(MassCorr_Consumption_Daily~as.factor(Temperature)*Food_Type, data=jap.feeding)
anova(prelim.mod)

## RUN THE WEIGHTED anova WHERE WEIGHTS ARE CALCULATED FOR EACH PLANT*TEMPErATUrE GROUP
cons.mod.weighted <- gls(MassCorr_Consumption_Daily ~ as.factor(Temperature)*Food_Type,
                    data=jap.feeding,
                    weights=varIdent(form=~1|as.factor(Temperature)*Food_Type))

mass.mod.weighted <- gls(Herb_Growth ~ as.factor(Temperature)*Food_Type,
                         data=jap.feeding,
                         weights=varIdent(form=~1|as.factor(Temperature)*Food_Type))


### PLOT NO-CHOICE CONSUMPTION AND GrOWTH
source('/Users/Nate/Documents/FIU/research/JapBeetle_Temp_Herbivory/Figures/jap_beet_no_choice_Graphs.r')


## POST-HOC TESTS FOR CONSUMPTION. THERE ARE 36 COMPArISONS IN EACH TEMP, 4 TEMPS = 144 COMPArISONS
## CRITICAL P IS 0.0003. NOT COMPArING ACrOSS TEMPErATUrES.
library(gdata)
temp20 <- subset(jap.feeding, Temperature==20)
p20 <- with(temp20, pairwise.t.test(MassCorr_Consumption_Daily, Food_Type, var.equal=F,
                             p.adj='none'))
p20 <- round(p20$p.value,5)
p20 <- unmatrix(p20)
p20 <- p20[!is.na(p20)]
p20 <- as.data.frame(sort(p20))
p20$rank <- order(p20[,1])
p20$FDr <- p20$rank * (0.05/144)
p20$sig <- p20[,1] < p20$FDr

temp25 <- subset(jap.feeding, Temperature==25)
p25 <- with(temp25, pairwise.t.test(MassCorr_Consumption_Daily, Food_Type, var.equal=F,
                                    p.adj='none'))
p25 <- round(p25$p.value,5)
p25 <- unmatrix(p25)
p25 <- p25[!is.na(p25)]
p25 <- as.data.frame(sort(p25))
p25$rank <- order(p25[,1])
p25$FDr <- p25$rank * (0.05/144)
p25$sig <- p25[,1] < p25$FDr

temp30 <- subset(jap.feeding, Temperature==30)
p30 <- with(temp30, pairwise.t.test(MassCorr_Consumption_Daily, Food_Type, var.equal=F,
                                    p.adj='none'))
p30 <- round(p30$p.value,5)
p30 <- unmatrix(p30)
p30 <- p30[!is.na(p30)]
p30 <- as.data.frame(sort(p30))
p30$rank <- order(p30[,1])
p30$FDr <- p30$rank * (0.05/144)
p30$sig <- p30[,1] < p30$FDr

temp35 <- subset(jap.feeding, Temperature==35)
p35 <- with(temp35, pairwise.t.test(MassCorr_Consumption_Daily, Food_Type, var.equal=F,
                                    p.adj='none'))
p35 <- round(p35$p.value,5)
p35 <- unmatrix(p35)
p35 <- p35[!is.na(p35)]
p35 <- as.data.frame(sort(p35))
p35$rank <- order(p35[,1])
p35$FDr <- p35$rank * (0.05/144)
p35$sig <- p35[,1] < p35$FDr


## POST-HOC TESTS FOR GrOWTH THERE ARE 36 COMPArISONS IN EACH TEMP, 4 TEMPS = 144 COMPArISONS
## CRITICAL P IS 0.0003. NOT COMPArING ACrOSS TEMPErATUrES.
temp20 <- subset(jap.feeding, Temperature==20)
p20 <- with(temp20, pairwise.t.test(Herb_Growth, Food_Type, var.equal=F,
                                    p.adj='none'))
p20 <- round(p20$p.value,5)
p20 <- unmatrix(p20)
p20 <- p20[!is.na(p20)]
p20 <- as.data.frame(sort(p20))
p20$rank <- order(p20[,1])
p20$FDr <- p20$rank * (0.05/144)
p20$sig <- p20[,1] < p20$FDr

temp25 <- subset(jap.feeding, Temperature==25)
p25 <- with(temp25, pairwise.t.test(Herb_Growth, Food_Type, var.equal=F,
                                    p.adj='none'))
p25 <- round(p25$p.value,5)
p25 <- unmatrix(p25)
p25 <- p25[!is.na(p25)]
p25 <- as.data.frame(sort(p25))
p25$rank <- order(p25[,1])
p25$FDr <- p25$rank * (0.05/144)
p25$sig <- p25[,1] < p25$FDr

temp30 <- subset(jap.feeding, Temperature==30)
p30 <- with(temp30, pairwise.t.test(Herb_Growth, Food_Type, var.equal=F,
                                    p.adj='none'))
p30 <- round(p30$p.value,5)
p30 <- unmatrix(p30)
p30 <- p30[!is.na(p30)]
p30 <- as.data.frame(sort(p30))
p30$rank <- order(p30[,1])
p30$FDr <- p30$rank * (0.05/144)
p30$sig <- p30[,1] < p30$FDr

temp35 <- subset(jap.feeding, Temperature==35)
p35 <- with(temp35, pairwise.t.test(Herb_Growth, Food_Type, var.equal=F,
                                    p.adj='none'))
p35 <- round(p35$p.value,5)
p35 <- unmatrix(p35)
p35 <- p35[!is.na(p35)]
p35 <- as.data.frame(sort(p35))
p35$rank <- order(p35[,1])
p35$FDr <- p35$rank * (0.05/144)
p35$sig <- p35[,1] < p35$FDr

# VARIANCE ANALYSIS
growth.data <- with(jap.feeding, aggregate(list('mean'=Herb_Growth), list('Plant'=Food_Type, 'Temp'=Temperature), mean, na.rm=T))
cons.data <- with(jap.feeding, aggregate(list('mean'=MassCorr_Consumption_Daily), list('Plant'=Food_Type, 'Temp'=Temperature), mean, na.rm=T))

var.test(growth.data$mean[growth.data$Temp==35], y=growth.data$mean[growth.data$Temp==20],
         alternative='g')
var.test(cons.data$mean[cons.data$Temp==35], y=cons.data$mean[cons.data$Temp==20],
         alternative='g')

growth.data2 <- subset(growth.data, Plant!='rosa multiflora')
var.test(growth.data2$mean[growth.data2$Temp==35], y=growth.data2$mean[growth.data2$Temp==20],
         alternative='g')

growth.var.means <- with(growth.data, aggregate(list('variance'=mean), by=list('Temp'=Temp), var))

layout(1)
par(mar=c(4,4,1,1)+0.2)
plot(growth.var.means, xlab=expression('Temperature '*degree*C),
     ylab='Variance in Mass Change Among Plant Species',
     cex.lab=1.2,
     pch=16,
     cex=1.2,
     axes=F)

axis(1, lwd=0, lwd.tick=1, tck=0.02)
axis(2, lwd=0, lwd.tick=1, tck=0.02)
axis(3, lwd=0, lwd.tick=1, tck=0.02, lab=F)
axis(4, lwd=0, lwd.tick=1, tck=0.02, lab=F)
box()

cons.var.means <- with(cons.data, aggregate(list('variance'=mean), by=list('Temp'=Temp), var))
layout(1)
par(mar=c(4,5,1,1)+0.2)
plot(cons.var.means, xlab=expression('Temperature '*degree*C),
     ylab='Variance in Consumption rates\nAmong Plant Species',
     cex.lab=1.2,
     pch=16,
     cex=1.2,
     axes=F)

axis(1, lwd=0, lwd.tick=1, tck=0.02)
axis(2, lwd=0, lwd.tick=1, tck=0.02)
axis(3, lwd=0, lwd.tick=1, tck=0.02, lab=F)
axis(4, lwd=0, lwd.tick=1, tck=0.02, lab=F)
box()
