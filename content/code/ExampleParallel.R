require(parallel)

rm(list=ls())
graphics.off()

#Runs a stochastic Ricker model. This is not vectorized, so it
#is slow (on purpose)
#
#Args
#len        The number of steps to do each run for
#numruns    The number of stochastic runs to do
#p0         Starting population
#r, K       Parameters of the deterministic Ricker
#sig        Strength of the stochasticity

slowricker<-function(len,numruns,p0,r,K,sig)
{
  res<-matrix(NA,len,numruns)
  res[1,]<-p0
  for (c.pop in 1:numruns)
  {
    for (c.time in 2:len)
    {
      ep <- rnorm(1,0,sig) # fluctuation
      res[c.time,c.pop] <- res[c.time-1,c.pop] * exp(r * (1 - res[c.time,c.pop]/K)+ep)
    }
  }
  return(res)
}

#now do a run using one core
time.slow <- system.time(res.slow <- slowricker(100,10000,1,1.1,10,.1))

#now do it using 2 cores
slowricker.wrapper <- function(x){
  return(slowricker(x['len'],x['numruns'],x['p0'],x['r'],x['K'],x['sig']))
}
X<-list(c(len=100,numruns=5000,p0=1,r=1.1,K=10,sig=0.1),
        c(len=100,numruns=5000,p0=1,r=1.1,K=10,sig=0.1))
time.fast<-system.time(res.fast<-mclapply(X=X,FUN=slowricker.wrapper,mc.cores=2))

#compare
print(time.slow)
print(time.fast)