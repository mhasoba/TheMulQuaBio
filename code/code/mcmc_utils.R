## This file contains utility functions for manipulating mcmc samps,
## and calculating/plotting predictions

library(IDPmisc)
library('rjags')
##source("../nls/temp_functions.R")

## first some functions to put the mcmc samples into a properly
## labeled data frame, depending on the functional form

##for the logistic fit
make.logistic.samps<-function(coda.samps, nchains=2, samp.lims=c(151, 5000), sig=TRUE, Y.0=FALSE){
  Y0<-K<-r<-sigma<-NULL
  l1<-samp.lims[1]
  l2<-samp.lims[2]
  for(i in 1:nchains){
    if(Y.0){
      Y0<-c(Y0, coda.samps[[i]][l1:l2,2])
      K<-c(K, coda.samps[[i]][l1:l2,1])
      r<-c(r, coda.samps[[i]][l1:l2,3])
      if(sig) sigma<-c(sigma, coda.samps[[i]][l1:l2,4])
    }
    else{
      K<-c(K, coda.samps[[i]][l1:l2,1])
      r<-c(r, coda.samps[[i]][l1:l2,2])
      if(sig) sigma<-c(sigma, coda.samps[[i]][l1:l2,3])
    }
  }
  if(sig){
    if(Y.0){
          samps<-data.frame(matrix(c(Y0, K, r, sigma), ncol=4, byrow=FALSE))
          names(samps)<-c("Y0", "K", "r", "sigma")
        }
    else{
      samps<-data.frame(matrix(c(K, r, sigma), ncol=3, byrow=FALSE))
      names(samps)<-c("K", "r", "sigma")
    }
  }
  else{
    if(Y.0){
      samps<-data.frame(matrix(c(Y0, K, r), ncol=3, byrow=FALSE))
      names(samps)<-c("Y0", "K", "r")
    }
    else{
      samps<-data.frame(matrix(c(K, r), ncol=2, byrow=FALSE))
      names(samps)<-c("K", "r")
    }
  }

  return(samps)
}


make.logistic.mod.samps<-function(coda.samps, nchains=2, samp.lims=c(151, 5000), sig=TRUE, Y.0=FALSE){
  Y0<-K<-r<-d<-m<-sigma<-NULL
  l1<-samp.lims[1]
  l2<-samp.lims[2]
  for(i in 1:nchains){
    if(Y.0){
      Y0<-c(Y0, coda.samps[[i]][l1:l2,2])
      K<-c(K, coda.samps[[i]][l1:l2,1])
      r<-c(r, coda.samps[[i]][l1:l2,5])
      d<-c(d, coda.samps[[i]][l1:l2,3])
      m<-c(m, coda.samps[[i]][l1:l2,4])
      if(sig) sigma<-c(sigma, coda.samps[[i]][l1:l2,6])
    }
    else{
      K<-c(K, coda.samps[[i]][l1:l2,1])
      r<-c(r, coda.samps[[i]][l1:l2,4])
      d<-c(d, coda.samps[[i]][l1:l2,2])
      m<-c(m, coda.samps[[i]][l1:l2,3])
      if(sig) sigma<-c(sigma, coda.samps[[i]][l1:l2,5])
    }
  }
  if(sig){
    if(Y.0){
          samps<-data.frame(matrix(c(Y0, K, r, d, m, sigma), ncol=6, byrow=FALSE))
          names(samps)<-c("Y0", "K", "r", "d", "m", "sigma")
        }
    else{
      samps<-data.frame(matrix(c(K, r, d, m, sigma), ncol=5, byrow=FALSE))
      names(samps)<-c("K", "r", "d", "m", "sigma")
    }
  }
  else{
    if(Y.0){
      samps<-data.frame(matrix(c(Y0, K, r, d, m), ncol=5, byrow=FALSE))
      names(samps)<-c("Y0", "K", "r", "d", "m")
    }
    else{
      samps<-data.frame(matrix(c(K, r, d, m), ncol=4, byrow=FALSE))
      names(samps)<-c("K", "r", "d", "m")
    }
  }

  return(samps)
}

## gompertz, with a form that has biologically meaningful params
make.gompertz2.samps<-function(coda.samps, nchains=2, samp.lims=c(151, 5000), sig=TRUE, Y.0=FALSE){
  Y0<-K<-r<-sigma<-NULL
  l1<-samp.lims[1]
  l2<-samp.lims[2]
  for(i in 1:nchains){
    if(Y.0){
      Y0<-c(Y0, coda.samps[[i]][l1:l2,2])
      K<-c(K, coda.samps[[i]][l1:l2,1])
      r<-c(r, coda.samps[[i]][l1:l2,3])
      if(sig) sigma<-c(sigma, coda.samps[[i]][l1:l2,4])
    }
    else{
      K<-c(K, coda.samps[[i]][l1:l2,1])
      r<-c(r, coda.samps[[i]][l1:l2,2])
      if(sig) sigma<-c(sigma, coda.samps[[i]][l1:l2,3])
    }
  }
  if(sig){
    if(Y.0){
          samps<-data.frame(matrix(c(Y0, K, r, sigma), ncol=4, byrow=FALSE))
          names(samps)<-c("Y0", "K", "r", "sigma")
        }
    else{
      samps<-data.frame(matrix(c(K, r, sigma), ncol=3, byrow=FALSE))
      names(samps)<-c("K", "r", "sigma")
    }
  }
  else{
    if(Y.0){
      samps<-data.frame(matrix(c(Y0, K, r), ncol=3, byrow=FALSE))
      names(samps)<-c("Y0", "K", "r")
    }
    else{
      samps<-data.frame(matrix(c(K, r), ncol=2, byrow=FALSE))
      names(samps)<-c("K", "r")
    }
  }

  return(samps)
}

make.gompertz.samps<-function(coda.samps, nchains=2, samp.lims=c(151, 5000), sig=TRUE, Y.0=FALSE){
  a<-b<-c<-sigma<-NULL
  l1<-samp.lims[1]
  l2<-samp.lims[2]
  for(i in 1:nchains){
    a<-c(a, coda.samps[[i]][l1:l2,2])
    b<-c(b, coda.samps[[i]][l1:l2,1])
    c<-c(c, coda.samps[[i]][l1:l2,3])
    if(sig) sigma<-c(sigma, coda.samps[[i]][l1:l2,4])
  }
  if(sig){
    samps<-data.frame(matrix(c(a, b, c, sigma), ncol=4, byrow=FALSE))
    names(samps)<-c("a", "b", "c", "sigma")
  }
  else{
    samps<-data.frame(matrix(c(a, b, c), ncol=3, byrow=FALSE))
    names(samps)<-c("a", "b", "c")
  }

  return(samps)
}

##for the briere bit, columns = T0, Tm, c, sigma
make.briere.samps<-function(coda.samps, nchains=2, samp.lims=c(151, 5000), sig=TRUE){
  T0<-Tm<-cc<-sigma<-NULL
  l1<-samp.lims[1]
  l2<-samp.lims[2]
  for(i in 1:nchains){
    T0<-c(T0, coda.samps[[i]][l1:l2,1])
    Tm<-c(Tm, coda.samps[[i]][l1:l2,2])
    cc<-c(cc, coda.samps[[i]][l1:l2,3])
    if(sig) sigma<-c(sigma, coda.samps[[i]][l1:l2,4])
  }
  if(sig){
    samps<-data.frame(matrix(c(T0, Tm, cc, sigma), ncol=4, byrow=FALSE))
    names(samps)<-c("T0", "Tm", "c", "sigma")
  }
  else{
    samps<-data.frame(matrix(c(T0, Tm, cc), ncol=3, byrow=FALSE))
    names(samps)<-c("T0", "Tm", "c")
  }

  return(samps)
}

##for the quadratic, columns = inter, quad, sigma, slope
make.quad.samps<-function(coda.samps, nchains=2, samp.lims=c(151, 5000), sig=TRUE){
  T0<-Tm<-qd<-sigma<-NULL
  l1<-samp.lims[1]
  l2<-samp.lims[2]
  for(i in 1:nchains){
    T0<-c(T0, coda.samps[[i]][l1:l2,1])
    Tm<-c(Tm, coda.samps[[i]][l1:l2,2])
    qd<-c(qd, coda.samps[[i]][l1:l2,3])
    if(sig) sigma<-c(sigma, coda.samps[[i]][l1:l2,4])
  }
  if(sig){
    samps<-data.frame(matrix(c(T0, Tm, qd, sigma), ncol=4, byrow=FALSE))
  names(samps)<-c("T0", "Tm", "qd", "sigma")
  }
  else{
    samps<-data.frame(matrix(c(T0, Tm, qd), ncol=3, byrow=FALSE))
    names(samps)<-c("T0", "Tm", "qd")

  }
  return(samps)
}

make.pos.quad.samps<-function(coda.samps, nchains=2, samp.lims=c(151, 5000)){
  inter<-n.slope<-qd<-tau<-NULL
  l1<-samp.lims[1]
  l2<-samp.lims[2]
  for(i in 1:nchains){
    inter<-c(inter, coda.samps[[i]][l1:l2,1])
    n.slope<-c(n.slope, coda.samps[[i]][l1:l2,2])
    qd<-c(qd, coda.samps[[i]][l1:l2,3])
    tau<-c(tau, coda.samps[[i]][l1:l2,4])
  }
  samps<-data.frame(matrix(c(inter, n.slope, qd, tau), ncol=4, byrow=FALSE))
  names(samps)<-c("inter", "n.slope", "qd", "tau")
  return(samps)
}


plot.hists<-function(samps, my.par=c(2,2), n.hists=4, priors=NA, mai=c(0.8, 0.8, 0.2, 0.2)){
  par(mfrow=my.par, bty="n", mai=mai)
  for(i in 1:n.hists){
    hist(samps[,i], main=names(samps)[i], xlab="", freq=FALSE)
    if(!is.na(priors$names[1])){
      x<-c(seq(0, 1, by=0.00001), seq(1, 4000, by=0.1))
      h<-priors$hyper[,i]
      if(priors$fun[i]=="beta") lines(x, dbeta(x, shape1=as.numeric(h[1]), shape2=as.numeric(h[2])), col=2)
      if(priors$fun[i]=="gamma") lines(x, dgamma(x, shape=as.numeric(h[1]), rate=as.numeric(h[2])), col=2)
      if(priors$fun[i]=="uniform") lines(x, dunif(x, min=as.numeric(h[1]), max=as.numeric(h[2])), col=2)
      if(priors$fun[i]=="exp") lines(x, dexp(x, rate=as.numeric(h[1])), col=2)
      if(priors$fun[i]=="min.gamma") lines(h[3]+x, dgamma(x, shape=as.numeric(h[1]), rate=as.numeric(h[2])), col=2)
      if(priors$fun[i]=="normal") lines(x, dnorm(x, mean=as.numeric(h[1]), sd=as.numeric(h[2])), col=2)
      
    }
  }
}
    

plot.samps<-function(samps, title){
  ipairs(samps, ztransf = function(x){x[x<1] <- 1; log2(x)}, main=title)
}


plot.data.preds1<-function(data, samps, Temps, ylab, title, mycol,
                           xlims=NULL, ylims=NULL, w, func="briere"){
  
  plot(data[,1], data[,2], xlim=xlims, ylim=ylims,
     xlab="Temperature (C)", ylab=ylab,
     main=title, col=mycol, cex=1.5)

  if(func=="briere"){
    for(i in w){
      c<-as.numeric(samps$c[i])
      Tm<-as.numeric(samps$Tm[i])
      T0<-as.numeric(samps$T0[i])
      wt<-c(which(Temps<=T0), which(Temps>=Tm))
      sim<-briere(Temps, c, Tm, T0)
      sim[wt]<-0
      lines(Temps, sim, col=2)
    }
  }

  if(func=="quad"){
    for(i in w){
      T0<-as.numeric(samps$T0[i])
      Tm<-as.numeric(samps$Tm[i])
      qd<-as.numeric(samps$qd[i])
      sim<-quad(Temps, T0=T0, Tm=Tm, qd=qd)
      data[which(data<=0)]<-0
      lines(Temps, sim, col=2)
    }
  }

  
}



## here is some code from other places to use as basis for calculating
## means and quantiles and plotting them

make.sims.temp.resp<-function(sim="quad", samps, Temps, thinned, p.name="PDR"){

  out<-data.sim<-NULL
  out<-list()
  data.sim<-matrix(NA, nrow=length(Temps), ncol=length(thinned))
  for(i in 1:length(thinned)){

    if(sim=="briere"){
      c<-as.numeric(samps$c[thinned[i]])
      Tm<-as.numeric(samps$Tm[thinned[i]])
      T0<-as.numeric(samps$T0[thinned[i]])
      w0<-which(Temps<=T0)
      wM<-which(Temps>=Tm)
      data.sim[,i]<-briere(Temps, c, Tm, T0)
      data.sim[c(w0,wM),i]<-0
    }

    if(sim=="briere.trunc"){
      c<-as.numeric(samps$c[thinned[i]])
      Tm<-as.numeric(samps$Tm[thinned[i]])
      T0<-as.numeric(samps$T0[thinned[i]])
      w0<-which(Temps<=T0)
      wM<-which(Temps>=Tm)
      data.sim[,i]<-briere.trunc(Temps, c, Tm, T0)
      data.sim[c(w0,wM),i]<-0
    }
  
    
    if(sim=="quad"){
      T0<-as.numeric(samps$T0[i])
      Tm<-as.numeric(samps$Tm[i])
      qd<-as.numeric(samps$qd[i])
      data.sim[,i]<-quad(Temps, T0=T0, Tm=Tm, qd=qd)
      w<-which(data.sim[,i]<0)
      data.sim[w,i]<-0
    }

    if(sim=="quad.pos"){
      inter<-as.numeric(samps$inter[i])
      slope<- - as.numeric(samps$n.slope[i])
      qd<-as.numeric(samps$qd[i])
      data.sim[,i]<-quad.alt(Temps, inter=inter, slope=slope, qd=qd)
      w<-which(data.sim[,i]<0)
      data.sim[w,i]<-0
    }


      if(sim=="quad.trunc"){
      T0<-as.numeric(samps$T0[i])
      Tm<-as.numeric(samps$Tm[i])
      qd<-as.numeric(samps$qd[i])
      data.sim[,i]<-quad.trunc(Temps, T0=T0, Tm=Tm, qd=qd)
      w<-which(data.sim[,i]<0)
      data.sim[w,i]<-0
    }

    if(sim=="logistic"){
      K<-as.numeric(samps$K[thinned[i]])
      r<-as.numeric(samps$r[thinned[i]])
      Y0<-as.numeric(samps$Y0[thinned[i]])
      data.sim[,i]<-logistic(Temps, Y0, K, r)
      w<-which(data.sim[,i]<0)
      data.sim[w,i]<-0
     }

    if(sim=="logistic.mod"){
      K<-as.numeric(samps$K[thinned[i]])
      r<-as.numeric(samps$r[thinned[i]])
      Y0<-as.numeric(samps$Y0[thinned[i]])
      d<-as.numeric(samps$d[thinned[i]])
      m<-as.numeric(samps$m[thinned[i]])
      data.sim[,i]<-logistic.mod(Temps, Y0, K, r, d, m)
      w<-which(data.sim[,i]<0)
      data.sim[w,i]<-0
     }

    if(sim=="gompertz2"){
      K<-as.numeric(samps$K[thinned[i]])
      r<-as.numeric(samps$r[thinned[i]])
      Y0<-as.numeric(samps$Y0[thinned[i]])
      data.sim[,i]<-gompertz2(Temps, Y0, K, r)
      w<-which(data.sim[,i]<0)
      data.sim[w,i]<-0
     }

    if(sim=="gompertz"){
      a<-as.numeric(samps$a[thinned[i]])
      b<-as.numeric(samps$b[thinned[i]])
      c<-as.numeric(samps$c[thinned[i]])
      data.sim[,i]<-gompertz(Temps, a, b, c)
      w<-which(data.sim[,i]<0)
      data.sim[w,i]<-0
     }

  
    ##stop()
  }
  out<-list(param = p.name,
            T   = Temps,
            fits = data.sim)
  return(out)
}

make.all.temp.resp<-function(a.p, n.p, thinned, Temps){
  out<-list()

  for(i in 1:n.p){
    out[[i]]<-make.sims.temp.resp(sim=all.params[[i]]$func,
                                  samps=all.params[[i]]$samps,
                                  Temps, thinned=thinned,
                                  p.name=all.params[[i]]$param)
  }

  return(out)

}

temp.sim.quants<-function(sim.data, l.temps, byCol=FALSE,
                     probs=c(0.025, 0.975)){

  q<-matrix(NA, nrow=length(probs), ncol=l.temps)
  if(byCol) for(i in 1:l.temps) q[,i]<-quantile(sim.data[,i], probs, na.rm=TRUE)
  else for(i in 1:l.temps) q[,i]<-quantile(sim.data[i,], probs, na.rm=TRUE)
  
  return(q)
}

make.all.r0<-function(){


}



#################################################
## Examples from elsewhere....
deb.sim.quants.LN<-function(sim.data, samps.sd, l, N.sims, byCol=TRUE, probs=c(0.025, 0.975)){

  ec<-0.0000001

  q.low<-q.high<-matrix(NA, nrow=N.sims, ncol=l)
  q<-matrix(NA, nrow=length(probs), ncol=l)

  q.temp<-0
  for(i in 1:N.sims){
    q.low[i,]<-qlnorm(probs[1], meanlog=log(sim.data[,i]+ec), sdlog=samps.sd[i])
    q.high[i,]<-qlnorm(probs[2], meanlog=log(sim.data[,i]+ec), sdlog=samps.sd[i])
    ##q.low[,i]<-q.temp[1]
    ##q.high[,i]<-q.temp[2] 
  }

  ##stop()
  
  if(byCol){
    for(i in 1:l){
      q[1,i]<-quantile(q.low[,i], probs[1], na.rm=TRUE)
      q[2,i]<-quantile(q.high[,i], probs[2], na.rm=TRUE)
    }
  }
  else{
    for(i in 1:l){
      q[i,1]<-quantile(q.low[i,], probs[1], na.rm=TRUE)
      q[i,2]<-quantile(q.high[i,], probs[2], na.rm=TRUE)
    }
  }
  ##stop()
  return(q)
  

}

deb.sim.quants.Norm<-function(sim.data, samps.sd, l, N.sims, byCol=TRUE, probs=c(0.025, 0.975)){

  ec<-0.0000001

  q.low<-q.high<-matrix(NA, nrow=N.sims, ncol=l)
  q<-matrix(NA, nrow=length(probs), ncol=l)

  q.temp<-0
  for(i in 1:N.sims){
    q.low[i,]<-qnorm(probs[1], mean=sim.data[,i], sd=samps.sd[i])
    q.high[i,]<-qnorm(probs[2], mean=sim.data[,i], sd=samps.sd[i])
    ##q.low[,i]<-q.temp[1]
    ##q.high[,i]<-q.temp[2] 
  }

  ##stop()
  
  if(byCol){
    for(i in 1:l){
      q[1,i]<-quantile(q.low[,i], probs[1], na.rm=TRUE)
      q[2,i]<-quantile(q.high[,i], probs[2], na.rm=TRUE)
    }
  }
  else{
    for(i in 1:l){
      q[i,1]<-quantile(q.low[i,], probs[1], na.rm=TRUE)
      q[i,2]<-quantile(q.high[i,], probs[2], na.rm=TRUE)
    }
  }
  ##stop()
  return(q)
  

}


add.sim.lines<-function(t, sim.data=NULL, q=NULL, q2=NULL, mycol="blue", lwd=1, ...){

  if(!is.null(sim.data)){
    ## plot the predicted mean
    if(!is.null(dim(sim.data)[1])) lines(t, rowMeans(sim.data, na.rm=TRUE),
                                         col=mycol, lwd=lwd, ...)
    else lines(t, sim.data, col=mycol, lwd=lwd, ...)
  }
  if(!is.null(q)){
    ## plot the predicted quantiles for the mean
    lines(t, q[1,], col=mycol, lty="dashed", lwd=(lwd+1), ...)
    lines(t, q[2,], col=mycol, lty="dashed", lwd=(lwd+1), ...)
  }
  if(!is.null(q2)){
    ## plot the predicted quantiles for the mean
    lines(t, q2[1,], col=mycol, lty="dotted", lwd=(lwd+2), ...)
    lines(t, q2[2,], col=mycol, lty="dotted", lwd=(lwd+2), ...)
  }
  
}

