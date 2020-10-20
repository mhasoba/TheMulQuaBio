library(repr) ; options(repr.plot.width=6, repr.plot.height= 6) # Change plot sizes (in cm) - this bit of code is only relevant if you are using a juyter notebook - ignore otherwise

a <- 4  # store 4 as variable a

a # display it

a * a # product

a_squared <- a * a 

sqrt(a_squared) # square root

v <- c(0, 1, 2, 3, 4)

v # Display the vector-valued variable you created

is.vector(v) # check if v's a vector

mean(v) # mean

var(v) # variance

median(v) # median

sum(v) # sum all elements

prod(v + 1) # multiply

length(v) # how many elements in the vector

wing.width.cm <- 1.2 #Using dot notation

wing.length.cm <- c(4.7, 5.2, 4.8)

li = list(c(1,2,3))

class(li)





v <- TRUE

v

class(v)

v <- 3.2
class(v)

v <- 2L
class(v)

v <- "A string"
class(v)

b <- NA
class(b)

is.na(b)

b <- 0/0
b

is.nan(b)

b <- 5/0
b

is.nan(b)

is.infinite(b)

is.finite(b)

is.finite(0/0)

as.integer(3.1)

as.numeric(4)

as.roman(155)

as.character(155)  # same as converting to string

as.logical(5)

as.logical(0)

1E4

1e4

5e-2

1E4^2

1 / 3 / 1e8

a <- 5
is.vector(a)

v1 <- c(0.02, 0.5, 1)
v2 <- c("a", "bc", "def", "ghij")
v3 <- c(TRUE, TRUE, FALSE)

v1;v2;v3

v1 <- c(0.02, TRUE, 1)
v1

v1 <- c(0.02, "Mary", 1)
v1

mat1 <- matrix(1:25, 5, 5)
mat1

print(mat1)

mat1 <- matrix(1:25, 5, 5, byrow=TRUE)
mat1

dim(mat1) #get the size of the matrix

arr1 <- array(1:50, c(5, 5, 2))
arr1[,,1]

print(arr1)

arr1[,,2]

Col1 <- 1:10
Col1

Col2 <- LETTERS[1:10]
Col2

Col3 <- runif(10) # 10 random numbers from a uniform distribution
Col3

MyDF <- data.frame(Col1, Col2, Col3)
MyDF

print(MyDF)

names(MyDF) <- c("MyFirstColumn", "My Second Column", "My.Third.Column")
MyDF

MyDF$MyFirstColumn

MyDF$My Second Column

colnames(MyDF)

colnames(MyDF)[2] <- "MySecondColumn"
MyDF

MyDF$My.Third.Column

MyDF[,1]

MyDF[1,1]

MyDF[c("MyFirstColumn","My.Third.Column")] # show two specific columns only

class(MyDF)

str(MyDF)

head(MyDF)

tail(MyDF)

MyList <- list(species=c("Quercus robur","Fraxinus excelsior"), age=c(123, 84))
MyList

MyList[[1]]

MyList[[1]][1]

MyList$species

MyList[["species"]]

MyList$species[1]

pop1<-list(species='Cancer magister',
           latitude=48.3,longitude=-123.1,
           startyr=1980,endyr=1985,
           pop=c(303,402,101,607,802,35))
pop1

pop1<-list(lat=19,long=57,
           pop=c(100,101,99))
pop2<-list(lat=56,long=-120,
           pop=c(1,4,7,7,2,1,2))
pop3<-list(lat=32,long=-10,
           pop=c(12,11,2,1,14))
pops<-list(sp1=pop1,sp2=pop2,sp3=pop3)
pops

pops$sp1 # check out species 1

pops$sp1["pop"] # sp1's population sizes

pops[[2]]$lat #latitude of second species

pops[[3]]$pop[3]<-102 #change population of third species at third time step
pops

MyMat = matrix(1:8, 4, 4)
MyMat

MyDF = as.data.frame(MyMat)
MyDF

object.size(MyMat) # returns size of an R object (variable) in bytes

object.size(MyDF)

years <- 1990:2009
years

years <- 2009:1990 # or in reverse order 
years

seq(1, 10, 0.5)

MyVar <- c( 'a' , 'b' , 'c' , 'd' , 'e' )

MyVar[1] # Show element in first position 

MyVar[4] # Show element in fourth position 

MyVar[c(3,2,1)] # reverse order

MyVar[c(1,1,5,5)] # repeat indices

v <- c(0, 1, 2, 3, 4) # Create a vector named v

v[3] # access one element

v[1:3] # access sequential elements

v[-3] # remove elements

v[c(1, 4)] # access non-sequential indices

mat1 <- matrix(1:25, 5, 5, byrow=TRUE) #create a matrix
mat1

mat1[1,2]

mat1[1,2:4]

mat1[1:2,2:4]

mat1[1,] # First row, all columns

mat1[,1] # First column, all rows

a <- c(1,5) + 2
a

x <- c(1,2); y <- c(5,3,9,2)
x;y

x + y

x + c(y,1)

v <- c(0, 1, 2, 3, 4)
v2 <- v*2 # multiply whole vector by 2
v2

v * v2 # element-wise product

t(v) # transpose the vector

v %*% t(v) # matrix/vector product

v3 <- 1:7 # assign using sequence
v3

v4 <- c(v2, v3) # concatenate vectors
v4

species.name <- "Quercus robur" #You can alo use single quotes
species.name

paste("Quercus", "robur")

paste("Quercus", "robur",sep = "") #Get rid of space

paste("Quercus", "robur",sep = ", ") #insert comma to separate

paste('Year is:', 1990:2000)

strsplit("String; to; Split",';')# Split the string at ';'

set.seed(1234567)
rnorm(1)

rnorm(10)

set.seed(1234567)
rnorm(11)

setwd("../code/")

MyData <- read.csv("../data/trees.csv")

ls() #Check that MyData has appeared

class(MyData)

head(MyData) # Have a quick look at the data frame

str(MyData) # Note the data types of the three columns

MyData <- read.csv("../data/trees.csv", header = F) # Import ignoring headers

head(MyData)

MyData <- read.table("../data/trees.csv", sep = ',', header = TRUE) #another way

head(MyData)

MyData <- read.csv("../data/trees.csv", skip = 5) # skip first 5 lines

write.csv(MyData, "../results/MyData.csv")

dir("../results/") # Check if it worked

write.table(MyData[1,], file = "../results/MyData.csv",append=TRUE) # append

write.csv(MyData, "../results/MyData.csv", row.names=TRUE) # write row names

write.table(MyData, "../results/MyData.csv", col.names=FALSE) # ignore col names

source("basic_io.R")

a <- TRUE
if (a == TRUE){
    print ("a is TRUE")
    } else {
    print ("a is FALSE")
}

z <- runif(1) ## Generate a uniformly distributed random number
if (z <= 0.5) {print ("Less than a half")}

for (i in 1:10){
    j <- i * i
    print(paste(i, " squared is", j ))
}

1:10

for(species in c('Heliodoxa rubinoides', 
                 'Boissonneaua jardini', 
                 'Sula nebouxii')){
  print(paste('The species is', species))
}

v1 <- c("a","bc","def")
for (i in v1){
    print(i)
}

i <- 0
while (i < 10){
    i <- i+1
    print(i^2)
}

i <- 0 #Initialize i
    while(i < Inf) {
        if (i == 10) {
            break 
             } # Break out of the while loop! 
        else { 
            cat("i equals " , i , " \n")
            i <- i + 1 # Update i
    }
}

for (i in 1:10) {
  if ((i %% 2) == 0) # check if the number is odd
    next # pass to next iteration of loop 
  print(i)
}

source("boilerplate.R")

ls()

class(MyFunction)

# Checks if an integer is even
is.even <- function(n = 2){
  if (n %% 2 == 0)
  {
    return(paste(n,'is even!'))
  } 
  return(paste(n,'is odd!'))
}

is.even(6)

# Checks if a number is a power of 2
is.power2 <- function(n = 2){
  if (log2(n) %% 1==0)
  {
    return(paste(n, 'is a power of 2!'))
  } 
  return(paste(n,'is not a power of 2!'))
}

is.power2(4)

# Checks if a number is prime
is.prime <- function(n){
  if (n==0){
    return(paste(n,'is a zero!'))
  }
  if (n==1){
    return(paste(n,'is just a unit!'))
  }
  ints <- 2:(n-1)
  if (all(n%%ints!=0)){
    return(paste(n,'is a prime!'))
  } 
  return(paste(n,'is a composite!'))
}

is.prime(3)

a <- 1.0
class(a)

M <- matrix(runif(1000000),1000,1000)

SumAllElements <- function(M){
  Dimensions <- dim(M)
  Tot <- 0
  for (i in 1:Dimensions[1]){
    for (j in 1:Dimensions[2]){
      Tot <- Tot + M[i,j]
    }
  }
  return (Tot)
}
 
print("Using loops, the time taken is:")
print(system.time(SumAllElements(M)))

print("Using the in-built vectorized function, the time taken is:")
print(system.time(sum(M)))

NoPreallocFun <- function(x){
    a <- vector() # empty vector
    for (i in 1:x) {
        a <- c(a, i)
        print(a)
        print(object.size(a))
    }
}

system.time(NoPreallocFun(10))

PreallocFun <- function(x){
    a <- rep(NA, x) # pre-allocated vector
    for (i in 1:x) {
        a[i] <- i
        print(a)
        print(object.size(a))
    }
}

system.time(PreallocFun(10))

## Build a random matrix
M <- matrix(rnorm(100), 10, 10)

## Take the mean of each row
RowMeans <- apply(M, 1, mean)
print (RowMeans)

## Now the variance
RowVars <- apply(M, 1, var)
print (RowVars)

## By column
ColMeans <- apply(M, 2, mean)
print (ColMeans)

SomeOperation <- function(v){ # (What does this function do?)
  if (sum(v) > 0){ #note that sum(v) is a single (scalar) value
    return (v * 100)
  }
  return (v)
}

M <- matrix(rnorm(100), 10, 10)
print (apply(M, 1, SomeOperation))

######### Functions ##########

## A function to take a sample of size n from a population "popn" and return its mean
myexperiment <- function(popn,n){
    pop_sample <- sample(popn, n, replace = FALSE)
    return(mean(pop_sample))
}

## Calculate means using a for loop without preallocation:
loopy_sample1 <- function(popn, n, num){
    result1 <- vector() #Initialize empty vector of size 1 
    for(i in 1:num){
        result1 <- c(result1, myexperiment(popn, n))
    }
    return(result1)
}

## To run "num" iterations of the experiment using a for loop on a vector with preallocation:
loopy_sample2 <- function(popn, n, num){
    result2 <- vector(,num) #Preallocate expected size
    for(i in 1:num){
        result2[i] <- myexperiment(popn, n)
    }
    return(result2)
}

## To run "num" iterations of the experiment using a for loop on a list with preallocation:
loopy_sample3 <- function(popn, n, num){
    result3 <- vector("list", num) #Preallocate expected size
    for(i in 1:num){
        result3[[i]] <- myexperiment(popn, n)
    }
    return(result3)
}


## To run "num" iterations of the experiment using vectorization with lapply:
lapply_sample <- function(popn, n, num){
    result4 <- lapply(1:num, function(i) myexperiment(popn, n))
    return(result4)
}

## To run "num" iterations of the experiment using vectorization with lapply:
sapply_sample <- function(popn, n, num){
    result5 <- sapply(1:num, function(i) myexperiment(popn, n))
    return(result5)
}

popn <- rnorm(1000) # Generate the population
hist(popn)

n <- 20 # sample size for each experiment
num <- 1000 # Number of times to rerun the experiment

print("The loopy, non-preallocation approach takes:" )
print(system.time(loopy_sample1(popn, n, num)))

print("The loopy, but with preallocation approach takes:" )
print(system.time(loopy_sample2(popn, n, num)))

print("The loopy, non-preallocation approach on a list takes:" )
print(system.time(loopy_sample3(popn, n, num)))

print("The vectorized sapply approach takes:" )
print(system.time(sapply_sample(popn, n, num)))

print("The vectorized lapply approach takes:" )
print(system.time(lapply_sample(popn, n, num)))

x <- 1:20 # a vector
x

y <- factor(rep(letters[1:5], each = 4)) 
y

tapply(x, y, sum)

attach(iris)
iris

by(iris[,1:2], iris$Species, colMeans)

by(iris[,1:2], iris$Petal.Width, colMeans)

replicate(10, runif(5))

Ricker <- function(N0=1, r=1, K=10, generations=50)
{
  # Runs a simulation of the Ricker model
  # Returns a vector of length generations
  
  N <- rep(NA, generations)    # Creates a vector of NA
  
  N[1] <- N0
  for (t in 2:generations)
  {
    N[t] <- N[t-1] * exp(r*(1.0-(N[t-1]/K)))
  }
  return (N)
}

plot(Ricker(generations=10), type="l")

doit <- function(x){
    temp_x <- sample(x, replace = TRUE)
    if(length(unique(temp_x)) > 30) {#only take mean if sample was sufficient
         print(paste("Mean of this sample was:", as.character(mean(temp_x))))
        } 
    else {
        stop("Couldn't calculate mean: too few unique values!")
        }
    }

popn <- rnorm(50) #Generate your population

lapply(1:15, function(i) doit(popn))

result <- lapply(1:15, function(i) try(doit(popn), FALSE))

class(result)

result

result <- vector("list", 15) #Preallocate/Initialize
for(i in 1:15) {
    result[[i]] <- try(doit(popn), FALSE)
    }
