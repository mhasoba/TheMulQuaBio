palette(c('blue','red','purple','firebrick'))

# pdf width
w <- 3.5

# some replicate functions with changed defaults
arrows2 <- function(...) arrows(..., code=3, len=0.07, col='red')
text2   <- function(...) text(..., col='red', cex=1.4)


# simple regression no error

pdf('Origin.pdf', height=w, width=w)

	par(mar=c(3,3,0.5,0.5), mgp=c(1.8,0.5,0), tcl=-0.4)

	x <- 1:4
	y <- 4*x

	plot(y ~ x, col=1, pch=21, cex=1.4, xlim=c(0,5), ylim=c(0,25), lwd=1.4)
	abline(a=0, b=4,  col=1)	

dev.off()


pdf('Intercept.pdf', height=w, width=w)

	par(mar=c(3,3,0.5,0.5), mgp=c(1.8,0.5,0), tcl=-0.4)
	
	y <- 4*x + 5

	plot(y ~ x, col=1, pch=21, cex=1.4, xlim=c(0,5), ylim=c(0,25), lwd=1.4)
	abline(a=5, b=4, col=1)	

dev.off()


pdf('Factor.pdf', height=w, width=w)

	par(mar=c(3,3,0.5,0.5), mgp=c(1.8,0.5,0), tcl=-0.4)
	
	y <- rep(c(2,5), each=3)
    x <- seq(along=y)-0.5
	plot(y ~ x, col='blue', pch=21, cex=1.4, xlim=c(0,6), ylim=c(0,6), lwd=1.4, xaxt='n', xlab='')
	gap <- 0.05
	arrows(c(0,3) + gap, c(2,5), c(3,6) - gap, c(2,5), code=0, col='blue')
    axis(side=1, at=c(1.5,4.5),  labels=c('Female','Male'))

dev.off()

pdf('TwoVars.pdf', height=w, width=w)

	par(mar=c(3,3,0.5,0.5), mgp=c(1.8,0.5,0), tcl=-0.4)
		
    x <- rep(1:3, times=2) 
    f <- rep(c(0,1), each=3)
    y <- 1 + 2 * x + 3 *f
	plot(y ~ x, col='blue', pch=21, cex=1.4, xlim=c(0,3.5), ylim=c(0,11), lwd=1.4)
	abline(a=1, b=2, col='blue')
	abline(a=4, b=2, col='blue')

dev.off()

pdf('TwoVarsHighlight.pdf', height=w, width=w)

	par(mar=c(3,3,0.5,0.5), mgp=c(1.8,0.5,0), tcl=-0.4)
		
    x <- rep(1:3, times=2) 
    f <- rep(c(0,1), each=3)
    y <- 1 + 2 * x + 3 *f
	plot(y ~ x,  pch=21, cex=1.4, xlim=c(0,3.5), ylim=c(0,11), lwd=1.4, col=c(1,1,1,1,2,1))
	abline(a=1, b=2, col='blue')
	abline(a=4, b=2, col='blue')
	
	abline(h=c(0,1), v=0, lty=2, col='red')
	gap <- 0.1
    arrows2(c(2,2,2), c(0,1,5)+gap, c(2,2,2), c(1,5,8)-gap)
	text(rep(2.4, 3), c(0.5,3,7), c(expression(beta[1]), expression(beta[2]*x), expression(beta[3]*g[m])), col='red')

dev.off()




x <- seq(along=y)-0.5
mid <- c(1,3,5,7)

pdf('Anova.pdf', height=w, width=w)

	par(mar=c(3,3,0.5,0.5), mgp=c(1.8,0.5,0), tcl=-0.4)

	plot(y ~ x, xaxt='n', xlab='', xlim=c(0,nk), ylim=c(0,max(y)), col=unclass(f), pch=21, cex=1.4, lwd=1.4)
	axis(side=1, at=mid,  labels=levels(f))
	
	gap <- 0.2
	arrows(c(0,2,4,6) + gap, yhat, c(2,4,6,8) - gap, yhat, col=1:4, code=0, lwd=2)


dev.off()


pdf('Error.pdf', height=w, width=w)

	par(mar=c(3,3,0.5,0.5), mgp=c(1.8,0.5,0), tcl=-0.4)
	x <- 1:4
	y <- 4*x + 5 + c(0.50,-2,2.58,-1)

	plot(y ~ x, col=1, pch=21, cex=1.4, xlim=c(0,5), ylim=c(0,25), lwd=1.4)
	#abline(a=5, b=4, col=1)	

dev.off()


pdf('TooFlat.pdf', height=w, width=w)

	par(mar=c(3,3,0.5,0.5), mgp=c(1.8,0.5,0), tcl=-0.4)

	plot(y ~ x, col=1, pch=21, cex=1.4, xlim=c(0,5), ylim=c(0,25), lwd=1.4)
	tooflat <- nls(y ~ a + 1 * x, start=list(a=10))
	abline(a=coef(tooflat), b=1, col=1)
	
	p <- predict(tooflat)
	r <- resid(tooflat)
	
	arrows(x,p,x,p+r, col='red', code=0)
	
dev.off()


pdf('TooSteep.pdf', height=w, width=w)

	par(mar=c(3,3,0.5,0.5), mgp=c(1.8,0.5,0), tcl=-0.4)

	plot(y ~ x, col=1, pch=21, cex=1.4, xlim=c(0,5), ylim=c(0,25), lwd=1.4)
	b <- 7
	toosteep <- nls(y ~ a + b * x, start=list(a=-10))
	abline(a=coef(toosteep), b=b, col=1)
	
	p <- predict(toosteep)
	r <- resid(toosteep)
	
	arrows(x,p,x,p+r, col='red', code=0)
	
dev.off()



pdf('Varying.pdf', height=w, width=2*w)

	par(mar=c(3,3,0.5,0.5), mgp=c(1.8,0.5,0), tcl=-0.4)
	par(mfrow=c(1,2))
	
	bvals <- seq(1, 7, length=50)
	resvar <- rep(NA, 50)
	
	for(b in seq_along(bvals)){
	
		model <- nls(y ~ a + bvals[b] * x, start=list(a=-10))

		p <- predict(model)
		r <- resid(model)
		resvar[b] <- deviance(model)

		plot(y ~ x, col=1, pch=21, cex=1.4, xlim=c(0,5), ylim=c(0,25), lwd=1.4)
		abline(a=coef(model), b=bvals[b], col=1)
		arrows(x,p,x,p+r, col='red', code=0)

		plot(resvar ~ bvals, type='o', ylim=c(10,60), col=2)		

	}
	
	abline(v=4, lty=2)
	
dev.off()


pdf('Varying_timeline.pdf', height=w, width=2*w)

	par(mar=c(3,3,0.5,0.5), mgp=c(1.8,0.5,0), tcl=-0.4)
	par(mfrow=c(1,2))
	
	bvals <- seq(1, 7, length=51)
	resvar <- rep(NA, 51)

	plot(y ~ x, col=1, pch=21, cex=1.4, xlim=c(0,5), ylim=c(0,25), lwd=1.4)
	p1 <- par('usr')
	plot(resvar ~ bvals, type='o', ylim=c(10,60), col=2, ylab='Sum of square residuals', xlab=expression(Slope~(beta[2])))		
	p2 <- par('usr')
	
	for(b in seq_along(bvals)){
	
		model <- nls(y ~ a + bvals[b] * x, start=list(a=-10))
		p <- predict(model)
		r <- resid(model)
		resvar[b] <- deviance(model)

		plot.new()
		par(usr=p1)
		arrows(x,p,x,p+r, col='red', code=0)
		abline(a=coef(model), b=bvals[b], col=1)
		
		plot.new()
		par(usr=p2)
		points(resvar ~ bvals, type='o', ylim=c(10,60), col=2)		

	}
	
	abline(v=4, lty=2)
	
dev.off()

pdf('JustRight.pdf', height=w, width=w)

	par(mar=c(3,3,0.5,0.5), mgp=c(1.8,0.5,0), tcl=-0.4)

	plot(y ~ x, col=1, pch=21, cex=1.4, xlim=c(0,5), ylim=c(0,25), lwd=1.4)
	justright <- nls(y ~ a + b * x, start=list(a=5, b=4))
	abline(justright, col=1)
	
	p <- predict(justright)
	r <- resid(justright)
	
	arrows(x,p,x,p+r, col='red', code=0)
	
dev.off()

pdf('Predicted.pdf', height=w, width=w)

	par(mar=c(3,3,0.5,0.5), mgp=c(1.8,0.5,0), tcl=-0.4)

	plot(y ~ x, col='grey', pch=21, cex=1.4, xlim=c(0,5), ylim=c(0,25), lwd=1.4)
	abline(justright, col=1)
	
	p <- predict(justright)
	r <- resid(justright)

	arrows(x,p,x,p+r, col='grey', code=0)	
	points(x, p, col=2,  pch=21, cex=1.4 )

	
dev.off()

pdf('ResidDemo.pdf', height=1.5*w, width= 1.2*w )

	par(mar=c(3,3,0.5,0.5), mfrow=c(2,1), mgp=c(1.8,0.5,0), tcl=-0.4)

	sd <- 1
	# xx <- runif(100)*25
	# yy <- 1 + 0.2*xx + rnorm(100, sd=sd)
	xx <- c(10.56, 8.42, 7.45, 5.85, 13.55, 7.33, 2.59, 4.29, 21.79, 1.52, 
			19.6, 22.32, 2.25, 1.67, 5.09, 3.93, 20.71, 2.7, 1.41, 4.81, 
			16.72, 14.49, 22.47, 2.76, 17.97, 0.52, 1.77, 23.91, 16.85, 17.45, 
			17.77, 4.82, 13.14, 0.88, 20.37, 8.64, 12.23, 14.04, 21.66, 3.07, 
			17.9, 0.75, 22, 24, 1.33, 18.07, 12.15, 0.92, 10.28, 18.48, 19.31, 
			11.64, 10.43, 1.29, 8.32, 13.94, 4.76, 6.92, 4.19, 14.94, 20.29, 
			13.72, 17.84, 1.39, 5.8, 17.48, 23.31, 24.96, 1.47, 18.79, 11.67, 
			15.78, 8.23, 15.48, 4.66, 0.37, 4.67, 24.75, 8.83, 4.64, 9.25, 
			22.76, 4.38, 12.14, 18.69, 20.02, 4.51, 1.61, 1.52, 17.32, 3.44, 
			2, 3.34, 6.09, 22.96, 8.04, 4.85, 23.5, 7.05, 5.41)
	yy <- c(4.63, 2.64, 2.54, 1.49, 3.8, 3.06, 2.1, 1.15, 5.3, 1.35, 5.05, 
			4.9, 2.79, -0.01, 2.21, 1.39, 5.34, -0.68, 1.1, 2.15, 3.14, 4.81, 
			6.83, 1.74, 4.44, 1.41, 0.19, 5.51, 2.83, 5.86, 4.46, 1.94, 4.81, 
			2.65, 4.99, 2.33, 2.95, 4.54, 7.3, 1.8, 4.66, 1.73, 5.1, 5.86, 
			0.03, 4.47, 3.53, 2.05, 3.7, 3.88, 5.56, 2.02, 3.89, 0.58, 4.87, 
			3.8, 3.26, 0.56, 1.11, 1.5, 5.02, 2.12, 2.38, 1.74, 3.09, 3.53, 
			6.89, 5.43, 0.01, 4.24, 3.04, 5.11, 2.18, 3.26, 2.4, -1.04, 3.37, 
			5.42, 3.69, -1.36, 3.42, 4.12, 2.4, 1.73, 2.78, 5.85, 0.63, 1.52, 
			0.07, 5.38, 0.24, 2.38, 3.13, 2.6, 4.25, 2.2, 2.35, 5.58, 2.56, 1.68)
	plot(yy~xx, col='gray60', ylab='y', xlab='x', ylim=c(-2,8))
	mod <- lm(yy~xx)
	abline(mod, col='gray60')
	
	pts <- c(1,6,11,16,21)
	mnx <- predict(mod, newdata=list(xx=pts))
	points(pts, mnx, col='red', pch=19)
	
	for(i in seq_along(pts)){
	
		qn <- qnorm(ppoints(99), mean=mnx[i], sd=sd)
		dn <- dnorm(qn, mean=mnx[i], sd=sd)
		dn <- dn / max(dn) * 3 
		lines(dn + pts[i], qn, col='red', lwd=1.5)
		lines(rep(pts[i],2), qn[c(1,99)], col='red', lty=1, lwd=0.5)
		lines(c(pts[i], pts[i] + dn[45]), rep(mnx[i],2), col='red', lty=1, lwd=0.5)
		
	}
	
	n <- 21
	p <- ppoints(n)
	a <- qnorm(seq(0,1, by=diff(p)[1]))
	a[c(1,n+1)] <- c(-3,3)
	q <- qnorm(p)
	d <- dnorm(q)
	
	curve(dnorm(x), xlim=c(-3,3), type='n', ylim=c(0,0.45), ylab='Density')
	
	for(i in seq(1,n, by=2)){
	    x <- seq(a[i], a[i+1], length=15)
		y <- dnorm(x)
		polygon(x=c(a[i], x, a[i+1]), c(0,y,0), col='grey80', border=NA)
	}
	
	arrows(q, dnorm(q), q, rep(0.43, length(q)), code=0, col='gray')
	curve(dnorm(x), xlim=c(-3,3), add=TRUE)
	points(q, dnorm(q), col='red')
	points(q, rep(0.43, length(q)), col='red')


dev.off()


pdf('LinearModels.pdf', height=2/3*w, width=2*w)

	par(mar=c(3,3,2,0.5), mfrow=c(1,3), mgp=c(1.8,0.5,0), tcl=-0.4)
	
	x <- runif(20)
	y <- 0.5 * x + rnorm(20, sd=0.05)

	mod <- lm(y~x)
	plot(y ~ x, col='red')
	abline(mod, col=1)
	title(main=expression(y == beta[1] + beta[2] *x))

	x <- runif(20)
	y <- 0.5 * x - 0.6*x^2+ rnorm(20, sd=0.03)

	mod <- lm(y~x + I(x^2))
	plot(y ~ x, col='red')
	xx <- seq(0,1, length=50)
	p <- predict(mod, newdata=list(x=xx))
	lines(xx, p, col=1)
	title(main=expression(y == beta[1] + beta[2] *x + beta[3] *x^2))


	x1 <- runif(40)
	x2 <- runif(40)
	y  <- 0.2 * x1 + 0.3 * x2 - 0.4*x2^2 + 0.2*x1*x2 + rnorm(40, sd=0.05)
	mod <- lm(y ~ x1*x2+ I(x2^2))
	
	xx <- seq(0,1,length=20)
	newdata <- expand.grid(x1=xx, x2=xx)
	p <- predict(mod, newdata=newdata)	
	
	par(mar=c(1,1,2,1))
	VT <- persp(xx,xx, matrix(p, ncol=20), theta=-45, phi=10, xlab='x1', ylab='x2', zlab='y', border=1)
	points(trans3d(x1,x2,y, VT), col='red')

	title(main=expression(y == beta[1] + beta[2] * x[1] + beta[3] * x[2]+ beta[4] * x[2]^2+  beta[5] *x[1]*x[2]))


dev.off()

# pdf('Animate.pdf', height=w, width=w)

# for(t in seq(-180,180, by=5)){
	# VT <- persp(xx,xx, matrix(p, ncol=20), theta=t, phi=10, xlab='x1', ylab='x2', zlab='y', border=1)
	# points(trans3d(x1,x2,y, VT), col='red')

	# title(main=expression(y == beta[1] + beta[2] * x[1] + beta[3] * x[2]+ beta[4] * x[2]^2+  beta[5] *x[1]*x[2]))
# }

# dev.off()


## data for constant variance plots

# xreg <- runif(60)
# yreg <- 1 + 2*xreg +rnorm(60, sd=0.25)
# xaov <- gl(3,20, labels=c('none','sofa','active'))
# yaov <- 3 + 2.5 * (xaov=='sofa') + 1.1 * (xaov=='active') + rnorm(60, sd=0.25)
# yqd <- 0.1 + 2*xreg -  4*xreg^2 + rnorm(60, sd=0.25)
# ycurve   <- 1 + 2*xreg + 2 * xreg^2 + rnorm(60, sd=0.25) 
# yneqvar  <- 3 + 2.5 * (xaov=='sofa') + 1.1 * (xaov=='active') + rnorm(60, sd=0.25)*unclass(xaov)
# ynonnorm <- 0.1 + 2*xreg -  4*xreg^2 + rt(60, df=1.5)/10
# dat <- data.frame(xreg=round(xreg,3), xaov=xaov, yreg=round(yreg,3), yoav=round(yaov,3), 
#                   yqd=round(yqd,3), ycurve=round(ycurve,3), yneqvar=round(yneqvar,3), ynonnorm=round(ynonorm,3))


dat <- data.frame(xreg = c(0.669, 0.529, 0.825, 0.659, 0.791, 0.283, 
							0.164, 0.768, 0.129, 0.333, 0.647, 0.863, 0.987, 0.265, 0.602, 
							0.444, 0.513, 0.535, 0.717, 0.162, 0.059, 0.839, 0.285, 0.644, 
							0.382, 0.736, 0.983, 0.023, 0.121, 0.394, 0.271, 0.098, 0.705, 
							0.119, 0.415, 0.374, 0.516, 0.419, 0.529, 0.126, 0.143, 0.791, 
							0.011, 0.206, 0.506, 0.569, 0.03, 0.875, 0.429, 0.623, 0.346, 
							0.658, 0.74, 0.979, 0.591, 0.136, 0.338, 0.93, 0.921, 0.928), 
				    xaov = gl(3,20, labels=c('none','sofa','active')),			    
				    yreg = c(2.492, 1.956, 2.771, 2.292, 2.902, 1.829, 1.565, 2.341, 1.097, 
							2.1, 2.258, 2.89, 3.08, 1.589, 2.329, 1.897, 2.191, 1.91, 2.74, 
							1.215, 1.61, 2.55, 1.563, 1.918, 1.623, 2.735, 2.762, 1.152, 
							1.13, 1.618, 1.819, 1.217, 2.22, 1.291, 1.61, 1.707, 2.323, 2.215, 
							2.297, 1.032, 1.191, 2.581, 1.078, 1.44, 1.906, 2.095, 1.098, 
							3.044, 1.514, 2.133, 1.598, 1.974, 2.314, 2.799, 2.187, 0.95, 
							1.86, 2.667, 2.822, 2.752), 
				    yoav = c(3.29, 2.728, 2.979, 3.509, 3.446, 2.901, 2.792, 
						    3.308, 3.107, 3.14, 3.212, 3.109, 2.912, 2.894, 3.214, 2.705, 
						    3.164, 2.482, 2.693, 3.07, 5.685, 5.349, 5.958, 5.368, 5.695, 
						    5.357, 5.557, 4.995, 5.731, 5.57, 5.405, 5.017, 5.538, 5.556, 
						    5.052, 6.005, 5.585, 5.31, 5.739, 4.893, 4.236, 4.66, 4.269, 
						    4.5, 3.612, 3.465, 3.799, 4.132, 3.838, 4.326, 3.844, 4.091, 
						    4.237, 3.987, 4.504, 3.874, 4.219, 4.065, 4.336, 4.157), 
				    yqd = c(-0.254, -0.198, -1.103, 0, -1.006, 0.262, 1.051, 
						    -0.551, 0.151, -0.071, -0.361, -1.212, -2.044, 0.481, 0.066, 
						    0.104, -0.029, -0.1, -0.098, 0.607, 0.146, -1.005, 0.067, 
						    -0.044, 0.447, -0.576, -2.327, 0.065, 0.275, 0.081, 0.847, 
						    0.04, -0.576, 0.642, 0.285, 0.39, 0.246, 0.322, -0.111, 0.385, 
						    0.329, -0.81, 0.168, 0.521, 0.19, -0.183, 0.01, -1.519, 0.431, 
						    -0.263, 0.307, -0.813, -0.976, -2.142, -0.138, 0.67, 0.387, 
						    -1.478, -1.11, -1.559),
					ycurve = c(2.897, 2.463, 3.678, 3.179, 3.342, 1.474, 1.586, 3.131, 1.403, 
							1.653, 3.112, 3.644, 4.573, 1.931, 2.814, 2.126, 2.328, 2.845, 
							2.823, 1.214, 1.085, 3.485, 1.776, 2.993, 1.508, 2.978, 4.522, 
							1.662, 1.122, 1.715, 1.839, 1.129, 3.105, 1.441, 2.214, 1.473, 
							2.411, 1.762, 2.599, 1.38, 0.952, 3.785, 1.207, 1.418, 1.932, 
							2.368, 1.297, 4.089, 2.077, 2.899, 1.891, 2.832, 3.151, 4.792, 
							3.018, 1.248, 2.162, 4.043, 4.289, 4.07),
					yneqvar = c(2.944, 2.593, 2.788, 3.206, 2.795, 3.323, 2.881, 
							2.996, 2.951, 2.9, 2.534, 3.02, 2.718, 3.022, 3.129, 3.026, 2.863, 
							3.454, 3.026, 2.94, 4.771, 5.627, 6.435, 5.479, 5.01, 5.094, 
							5.347, 4.767, 5.701, 5.759, 5.266, 5.477, 5.861, 4.547, 5.671, 
							5.069, 5.604, 5.883, 6.007, 4.649, 5.834, 5.307, 4.276, 4.201, 
							3.372, 4.669, 4.079, 3.724, 3.843, 3.835, 3.084, 2.897, 4.553, 
							3.706, 4.274, 4.818, 2.736, 4.268, 4.528, 4.582),
					ynonnorm = c(-0.256, 0.06, -0.986, 0.579, -0.343, 0.296, 0.626, -0.559, 
							-0.269, 0.676, -1.752, -0.931, -1.768, 0.662, -0.205, 0.045, 
							0.147, 0.101, -0.094, 0.361, 0.209, 0.376, 0.285, -0.34, 0.272, 
							-0.611, -1.898, 0.238, 0.218, 0.124, 0.228, 0.022, -0.353, 0.268, 
							0.295, 0.326, 0.261, 0.275, 0.069, 0.313, 0.341, -0.518, 0.093, 
							-0.438, 0.123, -0.13, 0.382, -1.23, 0.806, -0.217, 0.185, -0.309, 
							-0.663, -1.817, -0.29, 0.487, 0.217, -1.481, -1.385, -1.424))



regmod <- lm(yreg~xreg, data=dat)
regpred <- predict(regmod)
regres <- resid(regmod)

aovmod <- lm(yaov ~ xaov, data=dat)
aovpred <- predict(aovmod)
aovres <- resid(aovmod)

quadmod <- lm(yqd ~ xreg + I(xreg^2), data=dat) 
quadpred <- predict(quadmod)
quadres <- resid(quadmod)

curvemod <- lm(ycurve ~ xreg, data=dat)
curvepred <- predict(curvemod)
curveres <- resid(curvemod)

neqvarmod <- lm(yneqvar ~ xaov, data=dat)
neqvarpred <- predict(neqvarmod)
neqvarres <- resid(neqvarmod)

nonnormmod <- lm(ynonnorm ~ xreg + I(xreg^2), data=dat)
nonnormpred <- predict(nonnormmod)
nonnormres <- resid(nonnormmod)

pdf('ConstantVarianceDat.pdf', height=2/3*w, width=2*w)

	par(mar=c(3,3,2,0.5), mfrow=c(1,3), mgp=c(1.8,0.5,0), tcl=-0.4)
	
	plot(yreg ~ xreg,  ylab='y',  xlab='x',col='red', data=dat)
	title(main=expression(y == beta[1] + beta[2] *x))

	xaovxx <- c(4:23, 29:48, 54:73)
	plot(yaov ~ xaovxx, ylim=c(2.25, 6.25), xlim=c(1, 76), xlab='', xaxt='n', ylab='y', col='red', data=dat)
	axis(1, at=c(1,26,51,76), labels=FALSE)
	mtext(levels(xaov), at=c(13.5,38.5,63.5), side=1, line=1.8, cex=0.8)
	abline(v=c(1,26,51,76), lty=2, col='gray')
	title(main=expression(y == beta[1] + beta[2] * x[s] + beta[3] *x[a]))


	plot(yqd ~ xreg,  ylab='y',  xlab='x', col='red', data=dat)
	title(main=expression(y == beta[1] + beta[2] *x + beta[3] *x^2))

dev.off()


pdf('ConstantVarianceMods.pdf', height=2/3*w, width=2*w)

	par(mar=c(3,3,2,0.5), mfrow=c(1,3), mgp=c(1.8,0.5,0), tcl=-0.4)
	
	plot(yreg ~ xreg,  ylab='y',  xlab='x', type='n', data=dat)
	title(main=expression(y == beta[1] + beta[2] *x))

	arrows(xreg, regpred, xreg, yreg, code=0, col='grey')
	abline(regmod, col='blue')
	points(yreg ~ xreg, col='red', data=dat)	

	xaovxx <- c(4:23, 29:48, 54:73)
	plot(yaov ~ xaovxx, ylim=c(2.25, 6.25), xlim=c(1, 76), xlab='', xaxt='n', ylab='y', type='n', data=dat)
	axis(1, at=c(1,26,51,76), labels=FALSE)
	mtext(levels(xaov), at=c(13.5,38.5,63.5), side=1, line=1.8, cex=0.8)
	abline(v=c(1,26,51,76), lty=2, col='gray')
	title(main=expression(y == beta[1] + beta[2] * x[s] + beta[3] *x[a]))
	
	arrows(xaovxx, aovpred, xaovxx, yaov, code=0, col='grey')
	cf <- coef(aovmod)
	cf[2:3] <- cf[2:3] + cf[1]
	arrows(c(1,26,52), cf, c(26,51,76),cf, code=0, col='blue')
	points(yaov ~ xaovxx, col='red', data=dat)

	plot(yqd ~ xreg,  ylab='y',  xlab='x', type='n', data=dat)
	title(main=expression(y == beta[1] + beta[2] *x + beta[3] *x^2))

	arrows(xreg, quadpred, xreg, yqd, code=0, col='grey')
	cf <- as.list(coef(quadmod))
	names(cf) <- c('i','l','q')
	with(cf, curve(i + l*x + q*x^2, col='blue', add=TRUE))
	points(yqd ~ xreg, col='red', data=dat)

dev.off()

pdf('FitResid.pdf', height=2/3*w, width=2*w)

	par(mar=c(3,3,2,0.5), mfrow=c(1,3), mgp=c(1.8,0.5,0), tcl=-0.4)

	plot(regmod,  which=1, add.smooth=FALSE, col='red')
	plot(aovmod,  which=1, add.smooth=FALSE, col='red')
	plot(quadmod, which=1, add.smooth=FALSE, col='red')

dev.off()

qq2 <- function(mod){
	rs <- rstandard(mod)
	xy <- qqnorm(rs, plot.it=FALSE)
	plot(xy, type='n', main="Normal Q-Q plot", xlab='Theoretical Quantiles', ylab='Sample Quantiles')
	qqline(rs, col='gray30')
	points(xy, col='red')
}

pdf('QQNorm.pdf', height=2/3*w, width=2*w)

	par(mar=c(3,3,2,0.5), mfrow=c(1,3), mgp=c(1.8,0.5,0), tcl=-0.4)
	
	qq2(regmod)
	qq2(aovmod)
	qq2(quadmod)
			
dev.off()

# Bad plots

pdf('NonConstantVarianceMods.pdf', height=2/3*w, width=2*w)

	par(mar=c(3,3,2,0.5), mfrow=c(1,3), mgp=c(1.8,0.5,0), tcl=-0.4)
	
	plot(ycurve ~ xreg,  ylab='y',  xlab='x', type='n', data=dat)
	title(main=expression(y == beta[1] + beta[2] *x))

	arrows(xreg, curvepred, xreg, ycurve, code=0, col='grey')
	abline(curvemod, col='blue')
	points(ycurve ~ xreg, col='red', data=dat)	

	xaovxx <- c(4:23, 29:48, 54:73)
	plot(yneqvar ~ xaovxx, ylim=c(2.25, 6.45), xlim=c(1, 76), xlab='', xaxt='n', ylab='y', type='n', data=dat)
	axis(1, at=c(1,26,51,76), labels=FALSE)
	mtext(levels(xaov), at=c(13.5,38.5,63.5), side=1, line=1.8, cex=0.8)
	abline(v=c(1,26,51,76), lty=2, col='gray')
	title(main=expression(y == beta[1] + beta[2] * x[s] + beta[3] *x[a]))
	
	arrows(xaovxx, neqvarpred, xaovxx, yneqvar, code=0, col='grey')
	cf <- coef(neqvarmod)
	cf[2:3] <- cf[2:3] + cf[1]
	arrows(c(1,26,52), cf, c(26,51,76),cf, code=0, col='blue')
	points(yneqvar ~ xaovxx, col='red', data=dat)

	plot(ynonnorm ~ xreg,  ylab='y',  xlab='x', type='n', data=dat)
	title(main=expression(y == beta[1] + beta[2] *x + beta[3] *x^2))

	arrows(xreg, nonnormpred, xreg, ynonnorm, code=0, col='grey')
	cf <- as.list(coef(nonnormmod))
	names(cf) <- c('i','l','q')
	with(cf, curve(i + l*x + q*x^2, col='blue', add=TRUE))
	points(ynonnorm ~ xreg, col='red', data=dat)

dev.off()

pdf('BadFitResid.pdf', height=2/3*w, width=2*w)

	par(mar=c(3,3,2,0.5), mfrow=c(1,3), mgp=c(1.8,0.5,0), tcl=-0.4)

	plot(curvemod,  which=1, add.smooth=FALSE, col='red')
	plot(neqvarmod,  which=1, add.smooth=FALSE, col='red')
	plot(nonnormmod, which=1, add.smooth=FALSE, col='red')

dev.off()

pdf('BadQQNorm.pdf', height=2/3*w, width=2*w)

	par(mar=c(3,3,2,0.5), mfrow=c(1,3), mgp=c(1.8,0.5,0), tcl=-0.4)
	
	qq2(curvemod)
	qq2(neqvarmod)
	qq2(nonnormmod)
			
dev.off()


# pdf('Anscombe.pdf', height=2*w, width=2*w)

	# par(mar=c(3,3,0.5,0.5), mfrow=c(2,2), mgp=c(1.8,0.5,0), tcl=-0.4)
	
	# data(anscombe)
	
	# for(i in 1:4){
		
		# x <- anscombe[,i]; y <- anscombe[,i+4]
		# mod <- lm(y~x)
		# plot(y ~ x)
		# abline(mod)
	# }

# dev.off()

## EXPLANATORY POWER


# null and saturated model

x <- 1:9
f1 <- gl(3,3, labels=letters[1:3])
f2 <- gl(9,1, labels=letters[1:9])
# y <- unclass(f1) +rnorm(9, sd=0.9)
y <- c(0.82, 1, 0.17, -0.42, 2.29, 2.35, 4.06, 2.71, 2.73)


pdf('NullSaturated.pdf', height=1.5*w, width=1.2*w)

	par(mar=c(3,3,2,0.5), mfrow=c(2,1), mgp=c(1.8,0.5,0), tcl=-0.4)

	null <- lm(y ~ 1)
	nr <- resid(null)
	np <- predict(null)
	nullSS <- sum(resid(null)^2)


	plot(y ~ x, col='red', xlim=c(0.5,9.5), xaxt='n', xlab='')
	abline(null, col='blue')
	arrows(x, np, x, y, col='blue', code=0)
	title(main=expression(y == beta[1]), line=1.2)
	text(1, 3.5, sprintf("ESS = %0.2f\nRSS = %0.2f", 0,nullSS), adj=0)	

	mod <- lm(y ~ f2) 
	plot(y ~ x, col='red', xlim=c(0.5,9.5), xaxt='n')
	axis(1, at=1:9, labels=levels(f2))
	arrows(x-0.5, y, x+0.5, y, col='blue', code=0)
	title(main=expression(y == beta[1] + beta[2]*f[b] + ldots + beta[8]*f[h]), line=1.2)
	text(1, 3.5, sprintf("ESS = %0.2f\nRSS = %0.2f", nullSS, 0), adj=0)	

dev.off()

pdf('Intermediate.pdf', height=0.75*w, width=1.2*w)

	par(mar=c(3,3,2,0.5),  mgp=c(1.8,0.5,0), tcl=-0.4)
	mod <- lm(y ~ f1) 
	r <- resid(mod)
	p <- predict(mod)
	rss <- sum(resid(mod)^2)
	plot(y ~ x, col='red', xlim=c(0.5,9.5), xaxt='n', xlab='')
	axis(1, at=c(2,5,8), labels=levels(f1))
	cf <- coef(mod); cf[2:3] <- cf[2:3]+cf[1]
	arrows(c(1,4,7), cf, c(3,6,9), cf, col=2, code=0 )
	arrows(x, p, x, y, col='blue', code=0)
	title(main=expression(y == beta[1] + beta[2]*f[b] + beta[3]*f[c]), line=1.2)
	text(1, 3.5, sprintf("ESS = %0.2f\nRSS = %0.2f", nullSS-rss,rss), adj=0)		

dev.off()

# Simulate F 2,6

N <- 10000
ratio <- numeric(N)
f1 <- gl(3,3, labels=letters[1:3])
x <- 1:9
y <- matrix(rnorm(9 *N), ncol=9)

null <- apply(y, 1, function(x) var(x) * 8)
means <- t(apply(y, 1, function(x) rep(c(mean(x[1:3]), mean(x[4:6]), mean(x[7:9])), each=3)))

RSS <- rowSums((y - means)^2)
ESS <- null - RSS
ratio <- (ESS/2)/(RSS/6)

idx <- c(which.min(ratio), which.min(abs(ratio - median(ratio))),  which.min(abs((ratio -12))))

pdf('F_extremes.pdf', height=2/3*w, width=2*w)

	par(mar=c(3,3,2,0.5), mfrow=c(1,3), mgp=c(1.8,0.5,0), tcl=-0.4)

	yl <- range(y[idx,])
	
	for(i in idx){
		
		null <- lm(y[i,] ~ 1)
		nullSS <- sum(resid(null)^2)
	
		mod <- lm(y[i,] ~ f1) 
		r <- resid(mod)
		p <- predict(mod)
		rss <- sum(resid(mod)^2)
		
		plot(y[i, ] ~ x, col='red', xlim=c(0,9.5), xaxt='n', xlab='', ylab='y', ylim=yl)
		axis(1, at=c(2,5,8), labels=levels(f1))
		cf <- coef(mod); cf[2:3] <- cf[2:3]+cf[1]
		arrows(c(1,4,7), cf, c(3,6,9), cf, col=2, code=0 )
		arrows(x, p, x, y[i,], col='blue', code=0)
		title(main=expression(y == beta[1] + beta[2]*f[b] + beta[3]*f[c]), line=1.2)
		
		text(0.2, 1., sprintf("ESS = %0.2f\nRSS = %0.2f\nF = %0.2f", nullSS-rss, rss, anova(mod)[1,4]), adj=0)		
	
	}

dev.off()




pdf('FAnimate.pdf',height=0.75*w, width= 1.2*w)

	par(mar=c(3,3,0.5,0.5), mgp=c(1.8,0.5,0), tcl=-0.4)

	clip <- quantile(ratio, 0.99)
	xr <-c(0, clip)
	bks <- seq(0, clip, length=30)
	tratio <- ifelse(ratio >= clip, NA, ratio)
	
	# base graphic
	plot(1, ylim=c(0,0.8), xlim=xr, type='n', xlab='Variance ratio', ylab='Density')
	arrows(4.52,0.2,4.52,0, lwd=2, col='red',len=0.13)
	usr <- par('usr')
	
	# frames of animation
	for(x in seq(250,N, by=250)){
		plot.new();  par(usr=usr)	
		h <- hist(tratio[1:x], breaks=bks, plot=FALSE)
		h$density <- h$counts/N/diff(bks)[1]
		lines(h, freq=FALSE)
	}

	abline(v=quantile(ratio, 0.95), col='blue')
	
dev.off()

## T simulation

x <- 1:20 + runif(20)/0.5

y1 <- 6 - 0.05 * x + rnorm(20, sd=2.3)
y2 <- 3 + 1/3 * x + rnorm(20, sd=2.3)
y3 <- 6 - 0.05 * x + rnorm(20, sd=0.4)
y4 <- 3 + 1/3 * x + rnorm(20, sd=0.4)

xd <- list(x=seq(0, 20, length=100))

yr <- range(y1,y2,y3,y4)

pdf('T_examples.pdf',height=1.5*w, width= 2*w)
	
	par(mar=c(0.5,0.5,0.5,0.5), mfrow=c(2,2), mgp=c(1.8,0.5,0), tcl=-0.4, oma=c(2,2,2,2))
	
	for(i in 1:4){
		
		y <- get(paste('y', i, sep=''))
	
		plot(y~x, ylim=yr, type='n', xaxt='n', yaxt='n')
		mod <- lm(y ~ x)
		if(i %in% c(3,4)) axis(1) else axis(1, labels=FALSE)
		if(i %in% c(1,3)) axis(2) else axis(2, labels=FALSE)
		
		if(i == 1) {mtext('Small effect', line=1, cex=1.2)}
		if(i == 2) {mtext('Large effect', line=1, cex=1.2); ; mtext('Low precision', side=4, line=1, cex=1.2)} 
		if(i == 4) mtext('High precision', side=4, line=1, cex=1.2)


		p <- predict(mod, newdata=xd, se.fit=TRUE)
	
		abline(h=mean(y), col='grey')
		abline(mod, col='blue')
		lines(xd$x, p$fit + 2*p$se.fit, col='blue', lty=2)
		lines(xd$x, p$fit - 2*p$se.fit, col='blue', lty=2)
			
		points(y ~ x, col='red')
		mm <- summary(mod)$coef
		text(2, yr[2]-0.5 , bquote(beta[2]==.(a), list(a=round(mm[2,1],3))), adj=0)		
		text(2, yr[2]-1.5 , bquote(se ==.(a), list(a=round(mm[2,2],3))), adj=0)		
		text(2, yr[2]-2.5 , bquote(t ==.(a), list(a=round(mm[2,3],3))), adj=0)		
	
		
		# print(summary(lm(y ~ x)))
	}
	
dev.off()


# Simulate t 19

N <- 10000
tval <- numeric(N)
x <- 1:20 + runif(20)/0.5
y <- matrix(rnorm(20*N, mean=5), ncol=20)
xd <- list(x=seq(0, 20, length=100))


for(i in seq_along(tval)) tval[i] <- summary(lm(y[i,] ~ x))$coef[2,3]


idx <- c(which.min(tval), which.min(abs(tval)),  which.max(tval))

pdf('t_extremes.pdf', height=2/3*w, width=2*w)

	par(mar=c(3,3,2,0.5), mfrow=c(1,3), mgp=c(1.8,0.5,0), tcl=-0.4)

	yl <- range(y[idx,])

	for(i in idx){
		
				
		plot(y[i, ] ~ x, col='red', ylab='y', ylim=yl)
		title(main=expression(y == beta[1] + beta[2]*x, line=1.2))
		mod <- lm(y[i,] ~ x)
		p <- predict(mod, newdata=xd, se.fit=TRUE)
	
		abline(h=mean(y[i,]), col='grey')
		abline(mod, col='blue')
		lines(xd$x, p$fit + 2*p$se.fit, col='blue', lty=2)
		lines(xd$x, p$fit - 2*p$se.fit, col='blue', lty=2)

		mm <- summary(mod)$coef
		if( mm[2,1] < 0) yy <- 3.5 else yy <- 6.75
		text(3, yy  , bquote(beta[2]==.(a), list(a=round(mm[2,1],3))), adj=0)		
		text(3, yy - 0.4, bquote(se ==.(a), list(a=round(mm[2,2],3))), adj=0)		
		text(3, yy - 0.8, bquote(t ==.(a), list(a=round(mm[2,3],3))), adj=0)		

	
	}

dev.off()





pdf('tAnimate.pdf',height=0.75*w, width= 1.2*w)

	par(mar=c(3,3,0.5,0.5), mgp=c(1.8,0.5,0), tcl=-0.4)

	xr <- range(tval)
	bks <- seq(xr[1], xr[2], length=30)
	
	# base graphic
	plot(1, ylim=c(0,0.42), xlim=xr, type='n', xlab='t value', ylab='Density')
	usr <- par('usr')
	
	# frames of animation
	for(x in seq(250,N, by=250)){
		plot.new();  par(usr=usr)	
		h <- hist(tval[1:x], breaks=bks, plot=FALSE)
		h$density <- h$counts/N/diff(bks)[1]
		lines(h, freq=FALSE)
	}

	abline(v=quantile(tval, c(0.025,0.975)), col='red')
	
dev.off()


## more detailed examples
# n <- 60
# x <- rep(1:20, times=3) + runif(60)
# f <- gl(3,20)
# y1 <- 4 + rnorm(n, sd=2)
# y2 <- 1 + 0.05*x + 1.2*unclass(f) + rnorm(n, sd=1.3)
# y3 <- -1 + 0.3*x + unclass(f) + rnorm(n, sd=0.8)

palette(c('red','blue','darkgreen'))

f <- gl(3,20)
x <- c(1.32, 2.87, 3.91, 4.51, 6, 7, 7.12, 8.4, 9.31, 10.04, 11.5, 
		12.96, 13.47, 14.83, 15.77, 16.69, 17.93, 18.82, 19.47, 20.19, 
		1.25, 2.08, 3.62, 4.44, 5.46, 6.58, 7.22, 8.56, 9.15, 10.11, 
		11, 12.83, 13.66, 14.44, 15.38, 17, 17.28, 18.66, 19.54, 20.62, 
		1.29, 2.44, 3.83, 4.56, 5.59, 6.84, 7.18, 8.24, 9.31, 10.69, 
		11.25, 12.16, 13.87, 14.55, 15.19, 16.66, 17.17, 18.06, 19.04, 20.25)
y1 <- c(3.63, 4.59, 4.5, 3.16, 4.32, 4.36, 0.41, 1.47, 3.44, 2.85, 
		8.62, 6.14, 6.8, 4.75, 0.77, 4.4, 1.53, 4.05, 6.62, 1.45, 4.14, 
		7.58, 5.52, 2.68, 2.4, 1.54, 4.3, 2.96, 5.36, 5.2, 1.37, 6.95, 
		3.46, 2.84, 3.32, -0.12, 6.47, 3.63, 5.27, 6.6, 2, 6.35, 4.03, 
		6.75, 3.92, 3.48, 3.33, 3.6, 6.58, 6.43, 8.67, 3.24, -0.28, 4.58, 
		6.18, 4.64, 3.9, 4.64, 4.07, 3.9)
y2 <- c(1.76, 6.46, 0.63, -0.25, 5.27, 2.97, 2.91, 2.05, 
		2.16, 3.95, 5.2, 1.93, 3.03, 4.62, 4, 6.67, 2.36, 3.49, 3.87, 
		0.26, 3.49, 3.05, 3.45, 4.5, 3.29, 2.41, 4.58, 1.43, 3.56, 2.28, 
		4.05, 4.74, 6.43, 3.11, 5.15, 3.43, 2.78, 3.74, 5.82, 3.66, 4.11, 
		3.8, 3.9, 4.33, 5.67, 4.71, 4.64, 3.41, 6.34, 4.16, 6.44, 7.02, 
		6.89, 2.99, 5.3, 5.84, 5.48, 6.64, 8.78, 5.64)
y3 <- c(0.39, 0.65, -0.13, 1.14, 1.58, 2, 2.85, 1.74, 3.9, 
		1.83, 3.01, 4.39, 3.85, 5.32, 3.62, 5.56, 5.92, 5, 5.39, 6.71, 
		1.16, 1.55, 0.15, 1.27, 2.92, 3.35, 3.25, 3.26, 4.84, 3.42, 3.55, 
		4.21, 5.3, 5.65, 6.56, 6.63, 5.24, 6.41, 5.76, 7.73, 2.47, 2.54, 
		2.55, 2.66, 3.47, 4.7, 3.75, 4.48, 4.12, 6.49, 5.42, 4.86, 5.97, 
		6.61, 6.04, 6.58, 6.39, 7.51, 7.42, 8.37)

pdf('ANOVA_null.pdf', height=2/3*w, width=2*w)

	par(mar=c(3,3,2,0.5), mfrow=c(1,3), mgp=c(1.8,0.5,0), tcl=-0.4)

	for(i in 1:3){
		
		y <- get(paste('y', i, sep=''))
	
		plot(y~x, ylim=c(-2,10), type='n')
		null <- lm(y ~ 1)
		pnull <- predict(null)
	
		abline(null, col='grey')
		arrows(x,pnull,x,y, code=0, col='grey')
		points(y ~ x, col='red')
		text(1.5,9.5, sprintf('SS = %0.2f', sum(resid(null)^2)), adj=0, cex=1.2)
		title(main=expression(y == beta[1]))
	}
	
dev.off()


pdf('ANOVA_mod.pdf', height=2/3*w, width=2*w)

	par(mar=c(3,3,2,0.5), mfrow=c(1,3), mgp=c(1.8,0.5,0), tcl=-0.4)

	for(i in 1:3){
		
		y <- get(paste('y', i, sep=''))
	
		plot(y~x, ylim=c(-2,10), type='n')
		mod <- lm(y ~ x )
		pmod  <- predict(mod)
	
		abline(mod, col='blue')
		arrows(x,pmod,x,y, code=0, col='blue')
		points(y ~ x, col='red')
		text(1.5,9.5, sprintf('SS = %0.2f', sum(resid(mod)^2)), adj=0, cex=1.2)
		title(main=expression(y == beta[1] + beta[2] *x))	
	
	}

dev.off()


pdf('ANOVA_mod2.pdf', height=2/3*w, width=2*w)

	par(mar=c(3,3,2,0.5), mfrow=c(1,3), mgp=c(1.8,0.5,0), tcl=-0.4)

	for(i in 1:3){
		
		y <- get(paste('y', i, sep=''))
	
		plot(y~x, ylim=c(-2,10), type='n')
		mod2 <- lm(y ~ x + f)
		pmod2 <- predict(mod2)
		
		for(l in seq_along(levels(f))){
			xx <- x[unclass(f)==l]
			yy <- y[unclass(f)==l]
			pp <- pmod2[unclass(f)==l]
			lines(xx, pp, col=l)
			arrows(xx,pp, xx,yy, col=l, code=0)
		}
		points(y ~ x, col=f)
		text(1.5,9.5, sprintf('SS = %0.2f', sum(resid(mod2)^2)), adj=0, cex=1.2)
		title(main=expression(y == beta[1] + beta[2] *x + beta[3] *f[b] + beta[4] * f[c]))	
	}

dev.off()

# Simulate F 1,58

N <- 10000
ratio <- numeric(N)
sampleSize <- 60

for(i in seq_along(ratio)){
	y <- rnorm(sampleSize)
	x <- gl(3,20)
	ratio[i] <- anova(lm(y ~ x))[1,4]
}


# Create vectors to store results in
N <- 10000
sampleSize <- 40 # <<< try changing this value to 20 and 200

sample1 <- matrix(rnorm(n=N*sampleSize, mean=10, sd=2), nrow =N, ncol=sampleSize)
sample2 <- matrix(rnorm(n=N*sampleSize, mean=10, sd=2), nrow =N, ncol=sampleSize)

var1 <- apply(sample1, 1, var)
var2 <- apply(sample2, 1, var)

ratio <- var1/var2



pdf('FAnimate.pdf',height=1.5*w, width= 1.2*w)

	par(mar=c(3,3,0.5,0.5), mfrow=c(2,1), mgp=c(1.8,0.5,0), tcl=-0.4)

	curve(dnorm(x, mean=10, sd=2), xlim=c(2,18), ylim=c(0,0.33), lwd=4 ,col='gray', ylab='Density')
	usr1 <- par('usr')
	plot(1, ylim=c(0,1.3), xlim=c(0,3.5), type='n', xlab='Variance ratio', ylab='Density')
	usr2 <- par('usr')
	
	idx <-c(which.min(abs(ratio -1)), which.min(ratio),   which.max(ratio))
	labloc <- c(10,5,15)
	for(i in seq_along(idx)){
		
		ind <- idx[i]
		plot.new(); par(usr=usr1)
		lines(density(sample1[ind,]), col=i, lwd=2)
		lines(density(sample2[ind,]), col=i, lwd=2, lty=2)
		
		vals <- list(f=round(ratio[ind],2), x=round(var1[ind],2), y=round(var2[ind],2)) 
		text(labloc[i], 0.30, bquote(.(f) == frac(.(x), .(y)), where=vals), cex=0.8, col=i)

		plot.new(); par(usr=usr2)
		abline(v=vals$f, col=i, lwd=2)
	}

	# add frame with annotations for all curves for the animation
	plot.new(); par(usr=usr1)
	for(i in seq_along(idx)){		
		ind <- idx[i]
		lines(density(sample1[ind,]), col=i, lwd=2)
		lines(density(sample2[ind,]), col=i, lwd=2)
	}
	plot.new(); par(usr=usr2); abline(v=ratio[idx], col=1:3, lwd=2)

	for(x in seq(250,N, by=250)){
		plot.new(); plot.new(); par(usr=usr2)	
		h <- hist(ratio[1:x], breaks=seq(-0.05,3.55, by=0.1), plot=FALSE)
		h$density <- h$counts/N/0.1
		lines(h, freq=FALSE)
	}

#   plot.new(); plot.new(); par(usr=usr2)
#	curve(df(x, sampleSize-1, sampleSize-1), add=TRUE, col='red', lwd=2)

dev.off()


pdf('F_simulated.pdf', height=2/3*w, width=2*w)

	par(mar=c(3,3,2,0.5), mgp=c(1.8,0.5,0), tcl=-0.4)

	hist(ratio, breaks=seq(-0.05,3.55, by=0.1), xlab='Variance Ratio', freq=FALSE, main='')

	abline(v=quantile(ratio, c(0.025, 0.975)), col='red', lwd=2)
	abline(v=quantile(ratio, c(0.005, 0.995)), col='red', lwd=2, lty=2)
	
	curve(df(x, sampleSize-1, sampleSize-1), add=TRUE, col='red', n=500)

dev.off()



## FOR PRACTICAL
x <- 1:4
y <- 4*x + 5 + c(0.50,-2,2.58,-1)

mod <- lm(y ~ x)
coef(mod)
model.matrix(mod)
resid(mod)
model.matrix(mod) %*% coef(mod)
predict(mod)
model.matrix(mod) %*% coef(mod) + resid(mod)
print(y)

# HARDCORE MATHS
D <- model.matrix(mod)

t(D) %*% y

# coefficients
solve(t(D) %*% D) %*% t(D) %*% y
# predictions
D%*%solve(t(D) %*% D) %*% t(D) %*% y

# hat matrix yhat = hat * y
D%*%solve(t(D) %*% D) %*% t(D)


# anova
k <- 2; n <- 4
nk <- n * k
f <- gl(n,k, labels=c('Control','Manip','Treat 1','Treat 2'))
# y <- rnorm(n*k, mean=rep(c(3,3.5,6.5,8), each=k))
y <- c(1.58, 4.16, 4.26, 3.18, 6.79, 6.73, 6.33, 8.73)

yhat <- tapply(y,f,mean)

# contrasts - two alternative versions.
mod <- lm(y ~ f)

alt <- matrix(c(1/4,1/4,1/4,1/4, -1,1,0,0,0,0,-1,1,1/2,1/2,-1/2,-1/2), ncol=4)
crossprod(alt) # orthogonal
f2 <- C(f, solve(t(alt))[,-1])
mod2 <- lm(y ~ f2)

summary(mod)
summary(mod2)

# saturated model
f3 <- gl(8,1)
mod3 <- lm(y ~ f3)


x <- seq(along=y)-0.5
mid <- c(1,3,5,7)

pdf('Anova.pdf', height=w, width=w)

	par(mar=c(3,3,0.5,0.5), mgp=c(1.8,0.5,0), tcl=-0.4)

	plot(y ~ x, xaxt='n', xlab='', xlim=c(0,nk), ylim=c(0,max(y)), col=unclass(f), pch=21, cex=1.4, lwd=1.4)
	axis(side=1, at=mid,  labels=levels(f))
	
	gap <- 0.2
	arrows(c(0,2,4,6) + gap, yhat, c(2,4,6,8) - gap, yhat, col=1:4, code=0, lwd=2)


dev.off()


pdf('AnovaModel1.pdf', height=w, width=w)

	par(mar=c(3,3,0.5,0.5), mgp=c(1.8,0.5,0), tcl=-0.4)

	plot(y ~ x, xaxt='n', xlab='', xlim=c(0,nk + 4), ylim=c(0,max(y)), col=unclass(f), pch=21, cex=1.4, lwd=1.4)
	axis(side=1, at=mid,  labels=levels(f))

	abline(h=c(0,yhat), col='grey')
	
	gap <- 0.2
	arrows(c(0,2,4,6) + gap, yhat, c(2,4,6,8) - gap, yhat, col=1:4, code=0, lwd=2)

    arrows2(nk + 0.5, 0 ,nk + 0.5, yhat[1])
    arrows2(nk + 1:3+0.5, yhat[1] , nk + 1:3 +0.5, yhat[-1])
    
    lab <- parse(text=paste('beta[',1:4,']', sep=''))
    text((nk + 0:3) + 0.9, yhat[1] + c(-cf[1], cf[-1])/2, lab, col='red', cex=1.2)

dev.off()

pdf('AnovaModel2.pdf', height=w, width=w)

	par(mar=c(3,3,0.5,0.5), mgp=c(1.8,0.5,0), tcl=-0.4)

	plot(y ~ x, xaxt='n', xlab='', xlim=c(0,nk + 4), ylim=c(0,max(y)), col=unclass(f), pch=21, cex=1.4, lwd=1.4)
	axis(side=1, at=mid,  labels=levels(f))

	abline(h=c(0,yhat), col='grey')
	
	gap <- 0.2
	arrows(c(0,2,4,6) + gap, yhat, c(2,4,6,8) - gap, yhat, col=1:4, code=0, lwd=2)

    arrows2(nk + 0.5, 0 ,nk + 0.5, yhat[1])
    arrows2(nk + 1:3+0.5, yhat[1] , nk + 1:3 +0.5, yhat[-1])
    
    lab <- parse(text=paste('beta[',1:4,']', sep=''))
  
  	cf <- coef(mod2)
	
	abline(h=mean(y), lty=2)
	abline(h=mean(y), lty=2)
	arrows(c(0,2,4,6), yhat, c(2,4,6,8), yhat, col=1:4, code=0, lwd=2)
    arrows2(9, 0 , 9, cf[1])

dev.off()




x <- rep((0:9)+0.5, times=3)
f <- gl(3,10, labels=LETTERS[1:3])
# y <- 0.25*x + unclass(f) + rnorm(30, sd=0.3)
y <-  c(1.05, 1.073, 1.924, 2.17, 1.836, 2.513, 2.593, 2.826, 
		3.106, 3.387, 2.113, 2.712, 2.364, 3.092, 2.617, 2.889, 3.225, 
		4.068, 3.736, 4.812, 3.297, 3.719, 3.378, 3.827, 4.364, 4.062, 
		4.339, 4.776, 5.492, 5.513)

mod <- lm(y ~ x + f)
pred <- predict(mod)
resid <- resid(mod)

cf <- as.list(coef(mod))
names(cf)[1] <- 'a'

predPoints <-  data.frame(x=c(2,5,8), f=LETTERS[3:1])
predPoints$y <- predict(mod, newdata=predPoints)

regrEnds <-  data.frame(x=rep(c(-2,12), times=3), f=rep(LETTERS[1:3], each=2))
regrEnds$y <- predict(mod, newdata=regrEnds)


pdf('ScatterplotSingle.pdf', height=w, width=6)

	par(mar=c(4,4,1,1), mgp=c(2.5,0.8,0), tcl=-0.4)

	plot(y ~ x, col=1, pch=21, cex=1.4, xlim=c(0,max(x)), ylim=c(0,max(y)), lwd=1.4)
	

dev.off()


pdf('ScatterplotGroup.pdf', height=w, width=6)

	par(mar=c(4,4,1,1), mgp=c(2.5,0.8,0), tcl=-0.4)

	plot(y ~ x, col=unclass(f), pch=21, cex=1.4, xlim=c(0,max(x)), ylim=c(0,max(y)), lwd=1.4)
	
	with(cf, abline(a= a, b=x, col=1))
	with(cf, abline(a= a + fB, b=x, col=2))
	with(cf, abline(a= a + fC, b=x, col=3))

dev.off()

pdf('CoefMarkup.pdf', height=w, width=6)

	par(mar=c(4,4,1,1), mgp=c(2.5,0.8,0), tcl=-0.4)

	plot(y ~ x, col='gray', pch=21, cex=1.4, xlim=c(0,max(x)), ylim=c(0,max(y)), lwd=1.4)
	
	with(cf, abline(a= a, b=x, col='grey'))
	with(cf, abline(a= a + fB, b=x, col='grey'))
	with(cf, abline(a= a + fC, b=x, col='grey'))
	
	abline(v=0, lty=2)
	abline(h=0, lty=2)
	abline(h=cf$a, lty=2)
	
	
	sep <- 0.05; labsep <- 0.4
	with(predPoints, {
		lo <- 0; hi <- cf$a
		arrows2(x, lo + sep, x, hi - sep)
	    text2(x + labsep, (lo+hi)/2, expression(alpha))
	})
	
	with(predPoints, {
		lo <- cf$a; hi <- y - c(cf$fC, cf$fB, 0)
		arrows2(x, lo + sep, x,  hi - sep)
		text2(x + labsep, (lo+hi)/2, expression(beta*x))
	})
	
	with(predPoints[-3,], {
	 lo <-  y - c(cf$fC, cf$fB); hi <- y
	 arrows2(x, lo + sep, x,  hi - sep)
	 text2(x + labsep, (lo+hi)/2 + c(0.5,0), c(expression(epsilon), expression(delta)))
	})
	
dev.off()

# more complex example model matrix
y <- rnorm(20)
x1 <- rnorm(20)
x2 <- rnorm(20)
x3 <- rnorm(20)
xf <- gl(4,5)

D <- model.matrix(y ~ x1 + x2 + x3 + xf)

# coefficients
solve(t(D) %*% D) %*% t(D) %*% y
# predictions
D%*%solve(t(D) %*% D) %*% t(D) %*% y



