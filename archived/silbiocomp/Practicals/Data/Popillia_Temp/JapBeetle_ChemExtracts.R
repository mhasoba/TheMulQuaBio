library(plotrix)
library(lattice)
library(nlme)
library(reshape2)

Chem_Extracts <- read.csv("~/Documents/FIU/Research/JapBeetle_Temp_Herbivory/Data/Chemical_Assays/Chem_Extracts.csv")
Chem_Extracts <- subset(Chem_Extracts[,1:17], Comments=='')
Chem_Extracts$Temperature[which(Chem_Extracts$Temperature==33)] <- 35

levels(Chem_Extracts$Food_Type) <- c('Rubus allegheniensis', 'Acer negundo', 'Acer rubrum', 'Rosa multiflora', 'Liquidambar styraciflua', 'Plantanus occidentalis', 'Viburnum prunifolium', 'Vitis vulpina', 'Rubus phoenicolasius')
Chem_Extracts$Food_Type <- factor(Chem_Extracts$Food_Type, levels = c('Acer negundo', 'Acer rubrum', 'Liquidambar styraciflua', 'Plantanus occidentalis', 'Rosa multiflora', 'Rubus allegheniensis', 'Rubus phoenicolasius', 'Viburnum prunifolium', 'Vitis vulpina'))

Chem_Extracts$MassCorrConsumpTreat <- as.numeric(Chem_Extracts$MassCorrConsumpTreat)
Chem_Extracts$MassCorrConsumpControl <- as.numeric(Chem_Extracts$MassCorrConsumpControl)

Chem_Extracts$diff <- with(Chem_Extracts, MassCorrConsumpTreat-MassCorrConsumpControl)

mod25 <- gls(diff~Food_Type-1, data=Chem_Extracts, subset=Temperature==25,
             weights=varIdent(form=~1|Food_Type))

mod35 <- gls(diff~Food_Type-1, data=Chem_Extracts, subset=Temperature==35,
             weights=varIdent(form=~1|Food_Type))

means <- with(Chem_Extracts,
              aggregate(
                list('diff'=diff), 
                by=list('Temp'=Temperature, 'Plant'=Food_Type),
                mean))

errors <- with(Chem_Extracts,
               aggregate(
                 list('err'=diff),
                 by=list('Temp'=Temperature, 'Plant'=Food_Type),
                 std.error))
errors <- errors[order(errors$Temp, errors$Plant),]

ov.means <- with(Chem_Extracts,
                 aggregate(
                   list('diff'=diff), 
                   by=list('Temp'=Temperature),
                   mean))

ov.errors <- with(Chem_Extracts,
                  aggregate(
                    list('err'=diff),
                    by=list('Temp'=Temperature),
                    std.error))

ov.means$Plant <- 'Overall Mean'
ov.errors$Plant <- 'Overall Mean'

means <- rbind(means, ov.means)
errors <- rbind(errors, ov.errors)
errors <- errors[c(1:9, 19, 10:18, 20),]

mod25pvals <- data.frame(Plant = unique(means$Plant), pvals = c(summary(mod25)$tTable[,4], 1))
mod25pvals$sig <- ifelse(mod25pvals$pvals < 0.05, '*', '')

mod35pvals <- data.frame(Plant = unique(means$Plant), pvals = c(summary(mod35)$tTable[,4],1))
mod35pvals$sig <- ifelse(mod35pvals$pvals < 0.05, '*', '')

xyplot(rev(Plant)~diff|as.factor(Temp), means, 
       pch=16, cex=1.4, col='black',
       strip=strip.custom(bg='grey90'),
       ylab=list(label='Plant Species', cex=1.2),
       xlab=list(label='Treatment - Control', cex=1.2),
       xlim=c(-2,2),
       scales=list(
         x=list(alternating=c(1,1), tck=c(1,0)),
         y=list(tck=c(1,0),
                lab=c(
                  expression('Overall Mean'),
                  expression(italic('Vitis vulpina')),
                  expression(italic('Viburnum prunifolium')),
                  expression(italic('Rubus phoenicolasius')),
                  expression(italic('Rubus allegheniensis')),
                  expression(italic('Rosa multiflora')),
                  expression(italic('Plantanus occidentalis')),
                  expression(italic('Liquidambar styraciflua')),
                  expression(italic('Acer rubrum')),
                  expression(italic('Acer negundo'))
                )
         )
       ),
         panel=function(x,y,...){
         panel.xyplot(x,y,...)
         panel.abline(v=0, lty=2)
         if(panel.number()==1){
           panel.segments(x-errors$err[1:10], y, x+errors$err[1:10], y)
           panel.text(x-0.5, y, mod25pvals$sig, cex=2)
         }
         if(panel.number()==2){
           panel.segments(x-errors$err[11:20], y, x+errors$err[11:20], y)
           panel.text(x-0.5, y, mod35pvals$sig, cex=1.6)
         }
         panel.abline(h=1.5, lty=3)
       })

## Test for a decrease or increase in toxicity
cast.means <- dcast(means, Plant ~ Temp, value.var='diff')
cast.means$diff <- cast.means$'25' - cast.means$'35'
wilcox.test(cast.means$'25'[1:9], cast.means$'35'[1:9], paired=T)
t.test(cast.means$diff[1:9])

## Variance test
var.test(means$diff[means$Temp==35], means$diff[means$Temp==25], alternative='greater')