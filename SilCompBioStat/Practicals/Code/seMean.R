# get standard error of the mean from a set of values (x)
seMean <- function(x){

	x <- na.omit(x) 	# get rid of missing values

	se <- sqrt(var(x)/length(x)) 	# calculate the standard error

	# tell the function to report the standard error
	return(se)
}
print(seMean(rnorm(1000, m = 0, sd = 1)))
