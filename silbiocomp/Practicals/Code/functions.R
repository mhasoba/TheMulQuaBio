MyFunction <- function(Arg1, Arg2){
  ## statements
  return (ReturnValue)
}

## Computes the Position^th Fibonacci
## number 1 1 2 3 5 8 13 ...
Fibonacci <- function(Position){
  if (Position < 3){
    return (1)
  }
  i <- 1
  j <- 1
  s <- 0
  for (k in (Position - 2):1){
    s <- i + j
    i <- j
    j <- s
  }
  return (j)
}

## Computes the Factorial of a number
## using recursion
Factorial <- function(N){
  if (N == 1){
    return (N)
  }
  return(N * Factorial(N - 1))
}

## Computes Coefficient of Variation
CoefVar <- function(vec){
  return(sd(vec) / mean(vec))
}
