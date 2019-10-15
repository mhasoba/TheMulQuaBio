rm(list = ls())

Students <- read.csv("../data/Students_All.csv") 

Students$Name <- paste(Students$X1st.Name, Students$Surname, sep=" ")

MSc_Rep <- sample(Students$Name[which(Students$Program.Name == "Computational Methods in Ecology and Evolution (MSc 1YFT)")],1) 

MRes_Rep <- sample(Students$Name[which(Students$Program.Name == "Computational Methods in Ecology and Evolution (MRes 1YFT)")],1)

print(paste("MSc Rep is ", MSc_Rep, ", WOO-HOO!", sep = ""))
print(paste("MRes Rep is ", MRes_Rep, ", WOO-HOO!", sep = ""))
