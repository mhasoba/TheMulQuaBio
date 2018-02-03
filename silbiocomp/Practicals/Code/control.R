## If statement
a <- TRUE
if (a == TRUE){
	print ("a is TRUE")
	} else {
	print ("a is FALSE")
}

## On a single line
z <- runif(1) ##random number
if (z <= 0.5) {
	print ("Less than a quarter")
	}

## For loop using a sequence
for (i in 1:100){
	j <- i * i
	print(paste(i, " squared is", j ))
}

## For loop over vector of strings
for(species in c('Heliodoxa rubinoides', 
                 'Boissonneaua jardini', 
                 'Sula nebouxii'))
{
  print(paste('The species is', species))
}

## for loop using a vector
v1 <- c("a","bc","def")
for (i in v1){
	print(i)
}

## While loop
i <- 0
while (i<100){
	i <- i+1
	print(i^2)
}
