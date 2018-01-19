# Clear objects
rm(list=ls())

# import Data
MyDF <- read.csv("../Data/EcolArchives-E089-51-D1.csv")

# Create column for predator-prey ratio
MyDF$PredPreyRa <- MyDF$Prey.mass/MyDF$Predator.mass

# Load lattice library
library(lattice)

pdf("../Results/Pred_Lattice.pdf", 11.7,8.3)
print(densityplot(~log(Predator.mass) | Type.of.feeding.interaction, data = MyDF,
            xlab = "log Predator mass (kg)",
            main = "Predator mass by feeding interaction"))
dev.off()

pdf("../Results/Prey_Lattice.pdf",
    11.7,8.3)
print(densityplot(~log(Prey.mass) | Type.of.feeding.interaction, data = MyDF,
            xlab = "log Prey mass (kg)",
            main = "Prey mass by feeding interaction"))
dev.off()

pdf("../Results/SizeRatio_Lattice.pdf",
    11.7,8.3)
print(densityplot(~log(PredPreyRa) | Type.of.feeding.interaction, data = MyDF,
            xlab = "log Prey/Predator ratio",
            main = "Prey-predator ratio by feeding interaction"))
dev.off()


Results <- data.frame(matrix(ncol=7))
colnames(Results) <- c("Feeding_Type", "Mean_log_pred_mass","Median_log_pred_mass",
                       "Mean_log_prey_mass","Median_log_prey_mass",
                       "Mean_pred_size_ratio","Median_pred_size_ratio")

for (i in unique(MyDF$Type.of.feeding.interaction)){
  #print(mean(subset(MyDF$Predator.mass, MyDF$Type.of.feeding.interaction == i)))
  Results[i,1] <- i
  Results[i,2] <- mean(log(subset(MyDF$Predator.mass, MyDF$Type.of.feeding.interaction == i)))
  Results[i,3] <- median(log(subset(MyDF$Predator.mass, MyDF$Type.of.feeding.interaction == i)))
  Results[i,4] <- mean(log(subset(MyDF$Prey.mass, MyDF$Type.of.feeding.interaction == i)))
  Results[i,5] <- median(log(subset(MyDF$Prey.mass, MyDF$Type.of.feeding.interaction == i)))
  Results[i,6] <- mean(log(subset(MyDF$PredPreyRa, MyDF$Type.of.feeding.interaction == i)))
  Results[i,7] <- median(log(subset(MyDF$PredPreyRa, MyDF$Type.of.feeding.interaction == i)))
}
Results <- Results[-1,]

write.csv(Results, "../Results/PP_Results.csv", row.names=FALSE)
