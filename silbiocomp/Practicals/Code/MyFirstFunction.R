expgrowth1<-function(p0,lambda)
{
  step<-0:4
  pop<-c(p0,lambda*p0,lambda^2*p0,lambda^3*p0,
         lambda^4*p0)
  plot(step,pop,type='b',xlab='Time step',
       ylab='Population')
  return(pop)  
}

expgrowth2<-function(p0,lambda)
{
  step<-0:4
  pop<-p0*lambda^step
  plot(step,pop,type='b',xlab='Time step',
       ylab='Population')
  return(pop)
}

expgrowth2(1,1.2)