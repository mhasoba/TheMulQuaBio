#####################################
## Continuous logistic growth

logistic1<-function(t, r, K, N0){
  N0*K*exp(r*t)/(K+N0*(exp(r*t)-1))
}

#####################################
## Discrete Logistic Map

## First define the function that makes one step
logistic.D<-function(N, r, K){
  N + r*N*(1-N/K)
}

## multiple steps
logistic.fwd<-function(N0, r, K, Tmax){
  nn<-rep(NA, Tmax)
  nn[1]<-N0
  for(t in 2:Tmax) nn[t]<-logistic.D(nn[t-1], r, K)
  return(nn)
}

#####################################
### from https://www.r-bloggers.com/non-linear-dynamics-and-chaos-using-r-1/
bounce <- function(f,init=4,n=10,cobweb=T,timeseries=F,dom=NULL,...){
    iterates <- NULL
    x0 <- init
    for(t in 1:n){
        x1<- f(x0,...)
        iterates[t] <- x1
        x0 <- x1
    }

    if(cobweb & !timeseries){
        if(is.null(dom)){
            a <- range(c(init,iterates))[1]-0.5
            b <- range(c(init,iterates))[2]+0.5
        }else{ a <- dom[1];b <- dom[2] }
        curve(f(x,...),a,b);grid(col="gray");abline(0,1,lty=2)
        lines(c(init,iterates), f(c(init,iterates),...),t="s")
        points(c(init,iterates), f(c(init,iterates),...))
    }
    
    if(timeseries){
        plot(0:n,c(init,iterates),t="l")
    }
    
}
