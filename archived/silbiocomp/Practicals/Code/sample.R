## run a simulation that involves sampling from a population

x <- rnorm(50) #Generate your population
doit <- function(x){
	x <- sample(x, replace = TRUE)
	if(length(unique(x)) > 30) { #only take mean if sample was sufficient
		 print(paste("Mean of this sample was:", as.character(mean(x))))
		 } 
	}

## Run 100 iterations using vectorization:
result <- lapply(1:100, function(i) doit(x))

## Or using a for loop:
result <- vector("list", 100) #Preallocate/Initialize
for(i in 1:100) {
	result[[i]] <- doit(x)
}
