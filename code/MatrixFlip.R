#the for-loop version
matflip<-function(m)
{
  res<-matrix(NA,nrow(m),ncol(m))  
  for (counter in 1:nrow(res))
  {
    res[counter,]<-m[nrow(m)-counter+1,]
  }
  return(res)
}
matflip(matrix(1:8,4,2))
matflip(matrix(1:9,3,3))

#the clever version
matflip2<-function(m)
{
  return(m[nrow(m):1,])
}
matflip2(matrix(1:8,4,2))
matflip2(matrix(1:9,3,3))
