rm(list = ls())

Students <- read.csv("../Data/Students_all.csv") 

Students$Name <- paste(Students$X1st.Name, Students$Surname, sep=" ")

MSc_Rep <- sample(Students$Name[which(Students$Program.Name == "Computational Methods in Ecology and Evolution (MSc 1YFT)")],1) 
MRes_Rep <- sample(Students$Name[which(Students$Program.Name == "Computational Methods in Ecology and Evolution (MRes 1YFT)")],1)

print(paste("MSc Rep: ", MSc_Rep))
print(paste("MRes Rep: ", MRes_Rep))
