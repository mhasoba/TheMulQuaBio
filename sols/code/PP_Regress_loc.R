#Script to calculate life-stage specific regressions

require(ggplot2)

#Get data
Data <- read.csv("../Data/EcolArchives-E089-51-D1.csv")

p <- ggplot(Data, aes(x=Prey.mass, y=Predator.mass, colour=Predator.lifestage)) + 
  geom_point(shape = 3) + 
  geom_smooth(method = "lm", fullrange = TRUE) + 
  facet_grid(Type.of.feeding.interaction ~ .) + 
  theme_bw() + theme(legend.position="bottom") + 
  theme(aspect.ratio = 1/2) + 
  xlab("Prey Mass in grams") + 
  ylab("Predator mass in grams")

pdf("../Results/PP_Regress.pdf", 8, 11)
print (p + scale_x_log10() + scale_y_log10())
dev.off()

#Regressions
library(plyr)
regressions.function <- function(x)
{
  models <- lm(log(Predator.mass) ~ log(Prey.mass), data = x)
  int <- models$coefficients[1]
  Slope <- models$coefficients[2]
  R <- summary(models)$r.squared
  ANOVA <- anova(models)
  data.frame(int, Slope, R, fstat = ANOVA[[4]][1], pvalue = ANOVA[[5]][1])
}

regressions.out <- ddply(Data, .(Type.of.feeding.interaction, Predator.lifestage), regressions.function)

#Rename column headings
regressions.out <- rename(regressions.out, c("Type.of.feeding.interaction" = "Feeding type", 
                          "Predator.lifestage"="Predator lifestage",
                          "int"="Intercept",
                          "R"="R Squared",
                          "fstat"="F Statistic",
                          "pvalue"="p-value"))

#Put it in a CSV
write.table(regressions.out, "../Results/PP_Regress_Results.csv", sep = ",", row.names = FALSE, col.names = TRUE)

##-------Extra credit - locations added in
regressions2.function <- function(x)
{
  models <- lm(log(Predator.mass) ~ log(Prey.mass), data = x)
  int <- models$coefficients[1]
  Slope <- models$coefficients[2]
  R <- summary(models)$r.squared
  ANOVA <- anova(models)
  data.frame(int, Slope, R, fstat = ANOVA[[4]][1], pvalue = ANOVA[[5]][1])
}

regressions2.out <- ddply(Data, .(Type.of.feeding.interaction, Predator.lifestage, Location), regressions2.function)

#Rename column headings
regressions2.out <- rename(regressions2.out, c("Type.of.feeding.interaction" = "Feeding type", 
                                             "Predator.lifestage"="Predator lifestage",
                                             "int"="Intercept",
                                             "R"="R Squared",
                                             "fstat"="F Statistic",
                                             "pvalue"="p-value"))

#Put it in a CSV
write.table(regressions2.out, "../Results/PP_Regress_Results_ExtraCredit.csv", sep = ",", row.names = FALSE, col.names = TRUE)
