## If statement
if (a == TRUE){
  print ("a is TRUE")
}
else{
  print ("a is FALSE")
}

## On the same line
if (z <= 0.25) print ("Less than a quarter")

## Basic for loop using a sequence
for (i in 1:100){
  j <- i * i
  print(paste(i, " squared is", j ))
}

## for loop using a vector
v1 <- c("a","bc","def")
for (element in v1){
  print(element)
}

## Basic while loop
i <- 0
while (i<100){
  print(i^2)
}
