require(ggplot2)

MyDF <- as.data.frame(read.csv("EcolArchives-E089-51-D1.csv"))
pdf("Figure1.pdf",width=8,height=10)
print(qplot(Prey.mass, Predator.mass,
      facets = Type.of.feeding.interaction ~ .,
      data = MyDF, colour = Predator.lifestage,
      geom = c("point", "smooth"), method = "lm",
      fullrange=TRUE, log="xy", shape=I(3),
      asp=0.5, xlab="Prey Mass in grams",
      ylab="Predator mass in grams"
      )+theme_bw()+opts(legend.position = "bottom"))
dev.off()
