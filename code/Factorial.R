fact<-function(n)
{
  if (n==0 || n==1)
  {
    return(1)  
  }
  
  res<-1
  for (counter in 2:n)
  {
    res<-res*counter
  }
  return(res)
}