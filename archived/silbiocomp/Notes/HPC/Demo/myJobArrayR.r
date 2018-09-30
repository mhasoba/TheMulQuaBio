x <- rnorm(100)
meanX <- mean(x)
print(meanX)

home <- Sys.getenv("HOME")
jobnum <-  Sys.getenv("PBS_ARRAY_INDEX")

save.image(file=paste(home, "/Demo/output_", jobnum, ".Rdata",sep=""))

