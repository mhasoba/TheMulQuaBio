boltz <- function(T, c1, c2){ 
  c1*exp(-c2/T)
}

b.g<-function(T, c, E, s2, w){ 
 c*exp(-E/(8.62*10^(-5)*(T+273.15)) - (T-w)^2/(2*s2))
}

briere<-function(T, c, Tm, T0){
  c*T*(T-T0)*sqrt(Tm - T)*(T <= Tm)*(T >= T0)
}

briere.trunc<-function(T, c, Tm, T0){
  1*(briere(T, c, Tm, T0)>1) + briere(T, c, Tm, T0)*(briere(T, c, Tm, T0)<1)
}


linear<-function(T, inter, slope){
  (inter+slope*T)*((inter+slope*T)>0)
}

quad<-function(T, T0, Tm, qd){
  qd*(T-T0)*(T-Tm)*(T<=Tm)*(T>=T0)
}

quad.trunc<-function(T, T0, Tm, qd){
  1*((qd*(T-T0)*(T-Tm))>1) + (qd*(T-T0)*(T-Tm)*(T<=Tm)*(T>=T0))*((qd*(T-T0)*(T-Tm))<1)
}


quad.alt<-function(T, inter, slope, qd){
  (inter+slope*T+qd*T^2)*(inter+slope*T+qd*T^2>0)
}

expon<-function(t, rate){
  exp(rate*t)
}

gompertz<-function(t, a, b, c=1){
  c*exp(a*(exp(b*t)-1)/b)
}

logistic<-function(t, Y0, K, r){
  K*Y0/(Y0+(K-Y0)*exp(-r*t))
}

logistic.mod<-function(t, Y0, K, r, d, m){
  Y0*exp(-m*t)*(t<=d)+ (K*(Y0*exp(-m*d))/((Y0*exp(-m*d))+(K-(Y0*exp(-m*d)))*exp(-r*(t-d))))*(t>d)
}


gompertz2<-function(t, Y0, K, r){
  Y0*exp(log(Y0/K)*(exp(-r*t)-1))
}


AIC.c<-function(myfit){##, ndata){
  k<-(length(coef(myfit))+1)
  lLfit<-logLik(myfit)
  
  n<-attr(lLfit, "nobs")
  cort<-2*k*(k+1)/(n-k-1)

  AICc <- -2*lLfit + 2*k + cort

  return(AICc)

}
