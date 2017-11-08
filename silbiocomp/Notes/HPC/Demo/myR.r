x <- rnorm(100)
meanX <- mean(x)
print(meanX)

home <- Sys.getenv("HOME")
save.image(file=paste(home, "/Demo/output.Rdata",sep=""))

