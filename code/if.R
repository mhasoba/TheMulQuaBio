#This function decides if an integer is ever. You
#better put in an integer or it might not work.
is.even<-function(n)
{
  if (n%%2 == 0)
  {
    return('n is even')
  } 
  return('n is odd')
}
is.even(3)
is.even(4)

#pseudocode
is.power2<-function(n)
{
  if (log2(n) is an integer)
  {
    return('n is a power of 2')
  } 
  return('n is not a power of 2')
}

#real code
is.power2<-function(n)
{
  if (log2(n)%%1==0)
  {
    return('n is a power of 2')
  } 
  return('n is not a power of 2')
}
is.power2(2)
is.power2(3)
is.power2(4)
is.power2(25)
is.power2(256)

#pseudo code
is.prime<-function(n)
{
  if (n==0)
  {
    return('zero')
  }
  if (n==1)
  {
    return('unit')
  }
  if (n is a prime)
  {
    return('prime')
  } 
  return('composite')
}

#real code
is.prime<-function(n)
{
  if (n==0)
  {
    return('zero')
  }
  if (n==1)
  {
    return('unit')
  }
  ints<-2:(n-1)
  if (all(n%%ints!=0))
  {
    return('prime')
  } 
  return('composite')
}