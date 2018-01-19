library(lattice)
library(nlme)

JapBeet_NoChoice <- read.csv("~/Documents/FIU/Research/JapBeetle_Temp_Herbivory/Data/No_Choice_Assays/JapBeet_NoChoice.csv")
jap.feeding <- subset(JapBeet_NoChoice, Consumption!='NA')
jap.feeding$Food_Type <- factor(jap.feeding$Food_Type)
jap.feeding$Temperature[which(jap.feeding$Temperature==33)] <- 35
jap.feeding$ratio <- jap.feeding$Herb_RGR/jap.feeding$MassCorr_Consumption_Daily

cons.data <- with(jap.feeding, aggregate(list('mean'=MassCorr_Consumption_Daily), list('Plant'=Food_Type, 'Temp'=Temperature), mean, na.rm=T))
growth.data <- with(jap.feeding, aggregate(list('mean'=Herb_Growth), list('Plant'=Food_Type, 'Temp'=Temperature), mean, na.rm=T))

all_trait <- read.csv("~/Documents/FIU/Research/JapBeetle_Temp_Herbivory/Data/Plant_Traits/all_trait.csv")
all_trait <- subset(all_trait[,-8], pctN!='NA')

cor(all_trait[,2:7])

## CONSUMPTION ANALYSIS ##
# PCA
plant.pca <- princomp(all_trait[,2:7], cor=T)
all_trait$PC1 <- plant.pca$scores[,1]
all_trait$PC2 <- plant.pca$scores[,2]
all_trait$PC3 <- plant.pca$scores[,3]


trait.merged.cons <- merge(cons.data, all_trait)

cons.mod <- gls(mean ~ PC1 + PC2 + PC3 + Temp
                + PC1:Temp + PC2:Temp + PC3:Temp,
                data=trait.merged.cons,
                weights=varExp(form=~Temp * PC3),
                method='REML')

plot(cons.mod)
summary(cons.mod)

cons.modFull <- gls(mean ~ pctC + pctN + pctP + pct.water
                    + pctProtein + toughness + Temp
                    + pctC:Temp + pctN:Temp + pctP:Temp
                    + pct.water:Temp + pctProtein:Temp
                    + toughness:Temp,
                    data=trait.merged.cons,
                    method='REML')



## GROWTH ANALYSIS ##

trait.merged.growth <- merge(growth.data, all_trait)


growth.mod <- gls(mean ~ PC1 + PC2 + PC3 + Temp
                 + PC1:Temp + PC2:Temp + PC3:Temp,
                 data=trait.merged.growth,
                  subset=Plant!='Rosa multiflora',
                  weights=varExp(form=~PC3))

plot(growth.mod)
summary(growth.mod)

# Analyze w/ no Rubus
t2 <- subset(trait.merged.growth, Plant!='Rubus phoenicolasius')
growth.mod2 <- gls(mean ~ PC1 + PC2 + PC3 + Temp
                  + PC1:Temp + PC2:Temp + PC3:Temp,
                  data=t2,
                  subset=Plant!='Rosa multiflora',
                  weights=varExp(form=~PC3))

plot(growth.mod2)
summary(growth.mod2)



growth.modFull <- gls(mean ~ pctC + pctN + pctP + pct.water
                    + pctProtein + toughness + Temp
                    + pctC:Temp + pctN:Temp + pctP:Temp
                    + pct.water:Temp + pctProtein:Temp
                    + toughness:Temp,
                    data=trait.merged.growth,
                    method='REML',
                      subset=Plant!='Rosa multiflora')


plot.mod <- lm(mean ~ PC3 + Temp + PC3:Temp,
               data=trait.merged.growth, subset=Plant!='Rosa multiflora')

PC3 <- seq(min(trait.merged.growth$PC3), max(trait.merged.growth$PC3), 0.01)

yhat20 <- predict(plot.mod, data.frame(PC3=PC3, Temp=20))
yhat25 <- predict(plot.mod, data.frame(PC3=PC3, Temp=25))
yhat30 <- predict(plot.mod, data.frame(PC3=PC3, Temp=30))
yhat35 <- predict(plot.mod, data.frame(PC3=PC3, Temp=35))


CairoPDF('JapBeetle_Growth_PC3.pdf', width=6.5, height=5.5, bg='transparent')
xyplot(mean ~ PC3|as.factor(Temp), data=trait.merged.growth,
       subset=Plant!='Rosa multiflora',
       pch=16, col='black', cex=1.2,
       strip=strip.custom(bg='grey90'),
       ylab=list('Mass Change', cex=1.2),
       xlab=list('PC 3', cex=1.2),
       scales=list(
         y=list(tck=c(1,0), alternating=c(1,1)),
         x=list(tck=c(1,0), alternating=c(1,1))),
       as.table=T,
       panel=function(x,y,...){
         panel.xyplot(x,y,...)
         #if(panel.number()==1){panel.lines(PC3, yhat20, col='black')}
         #if(panel.number()==2){panel.lines(PC3, yhat25, col='black')}
         if(panel.number()==3){panel.lines(PC3, yhat30, col='black')}
         if(panel.number()==4){panel.lines(PC3, yhat35, col='black')}
       }
)


# MONTE CARLO POWER SIMULATION FOR PC3:TEMP INTERACTION OF CONSUMPTION
yhat <- fitted(cons.mod)

p.vals <- numeric(999)
p.vals[1] <- summary(cons.mod)$tTable[8,4]
for(i in 2:9999){
  ysim <- yhat + rnorm(length(yhat), 0, 0.2645656)
  try(sim.mod <- gls(ysim ~ PC1 + PC2 + PC3 + Temp
                  + PC1:Temp + PC2:Temp + PC3:Temp,
                  data=trait.merged.cons,
                  weights=varExp(form=~Temp * PC3),
                  method='REML'), silent=TRUE)
  p.vals[i] <- summary(sim.mod)$tTable[8,4]
}

