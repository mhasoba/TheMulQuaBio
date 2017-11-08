# Runs the stochastic Ricker Equation with and without vectorization.

rm(list=ls())

stochrick<-function(p0=runif(1000,.5,1.5),r=1.2,K=1,sigma=0.2,numyears=100)
{
  #initialize
  N<-matrix(NA,numyears,length(p0))
  N[1,]<-p0
  
  for (pop in 1:length(p0)){ #loop through the populations
    for (yr in 2:numyears){ #for each pop, loop through the years
      N[yr,pop]<-N[yr-1,pop]*exp(r*(1-N[yr-1,pop]/K)+rnorm(1,0,sigma))
    }
  }
  return(N)
}
print("Stochastic Ricker takes:")
print(system.time(N<-stochrick()))

stochrickvect<-function(p0=runif(1000,0.5,1.5),r=1.2,K=1,sigma=.2,numyears=100){
  N<-matrix(NA,numyears,length(p0)) 
  N[1,]<-p0
  for (counter in 2:numyears){ #for each pop, loop through the years
    N[counter,]<-N[counter-1,] * exp(r*(1-N[counter-1,]/K)+rnorm(length(p0),0,sigma))
  }
  return(N)
}

print("Vectorized Stochastic Ricker takes:")
print(system.time(N2 <- stochrickvect()))
