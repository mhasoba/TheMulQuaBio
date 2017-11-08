### Script to produce regression data for each subset of different 
# feeding interactions and lifestages for the EcolArchives data.

require(ggplot2)

Data <- read.csv("../Data/EcolArchives-E089-51-D1.csv")
p <- ggplot(Data, aes(x = Prey.mass, y = Predator.mass, colour = Predator.lifestage))
output <- p + 
  facet_grid(Type.of.feeding.interaction ~ .) + 
  theme_bw() + 
  geom_point(size = I(2), shape = I(3)) +
  scale_y_log10(limits = c(1e-10,1e+10)) + 
  scale_x_log10(limits = c(1e-10,1e+4)) +
  xlab("Prey mass in grams") + 
  ylab("Predator mass in grams") +
  geom_smooth(method = "lm", fullrange = TRUE) +
  labs(title = "Relation between predator mass and prey mass for different predator lifestages")

# Using qplot:
# qplot(Prey.mass, Predator.mass, log="xy", facets = Type.of.feeding.interaction ~.,
#       xlab = "Prey mass in grams", ylab = "Predator mass in grams", data = Data,
#       colour = Predator.lifestage, shape = I(3), geom = c("point", "smooth"),
#       method = "lm", fullrange = TRUE) +
#       theme_bw() + theme(legend.position="bottom") +
#       theme(strip.text.y = element_text(size = 10)) +
#       theme(aspect.ratio=1/2)
      
pdf("../Results/PP_Regress_results.pdf", 8.7, 11.8)
	print(output)
dev.off()

SomeStats <- function(mydata){
  m <- lm(Predator.mass ~ Prey.mass, data = mydata)
  yintercept <- round(m$coefficients[1],2)
  slope <- round(m$coefficients[2],2)
  ANOVA <- anova(m)
  r2 <- summary(m)$r.squared
  data.frame(yintercept, slope, ANOVA[[4]][1], ANOVA[[5]][1], r2)
}

library(plyr)
labeldata <- ddply(Data, .(Type.of.feeding.interaction, Predator.lifestage, Location), SomeStats)
names(labeldata) <- c("Type of feeding interaction", "Predator Lifestage", "Location", "Y intercept", "Slope", "F Value", "P Value", "R^2 Value")

write.csv(labeldata,"../Results/PP_Regress_Results.csv")
