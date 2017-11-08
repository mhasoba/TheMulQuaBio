#!/usr/bin/env python
""" This code performs non-linear least squares fitting of different
unimodal functions to experimental thermal response curves."""
__author__ = 'Your Name (your.email.id@imperial.ac.uk)'
__version__ = '0.0.1'

# Scroll down to the section called "MAIN CODE" first.

from math import log, exp, pi
import scipy as sc 
from lmfit import Minimizer, minimize, Parameters, Parameter, report_fit, fit_report

#############################
# F  U  N  C  T  I  O  N  S #
#############################

def schoolf_eq(Temps, B0, E, E_l, T_l,E_h, T_h):
	"""Full schoolfield model for calculating trait values at a given temperature"""
	function = B0 * ??
	
	return ??

def schoolf(params, Temps, Data):
	"""Schoolfield model, to be called by schoolfield_model()"""
	B0 = params??
	E = params??
	.
	.
	.
	
	ModelPred = schoolf_eq(Temps, B0, E, E_l, T_l, E_h, T_h)
	return(ModelPred - TraitVals)

def schoolfield_model(datatest):
	"""NLLS fitting to the Schoolfield model; this function will 
	contain the lmfit.minimize calls to the schoolf() function. This is 
	where you can constrain the parameters."""

#	 Prepare the parameters and their bounds:
 
 	T_l_start = ??
	B0_start = ??
 
	#	 The datase containing temperatures and trait values.
	TraitVals = ??
	Temps = ??

#	 Define parameters
	params = Parameters()
	params.add('B0', value = B0_start, vary = True, min = -10, max = 1000)
	params.add('E', value=E_start, vary= True, min=0.0000000000000001, max=10)
	params.add('E_l', value=E_D_start, vary = True, min=0.0000000000000001, max=10)
	.
	.
	.
	
#	 Minimising the Model
	out = minimize(schoolf, params, args=(Temps, TraitVals),method="leastsq")
	par_out_school = out.params
#	 Calculates the r squared value to determine how well the model fits the data.
	r_squared_school = 1-out.residual.var()/sc.var(TraitVals)
	nvarys_school= out.nvarys
	ndata_school = out.ndata
	return(par_out_school, r_squared_school, nvarys_school, ndata_school,out.chisqr)
	

def AICrss(n, k, rss):
	"""Calculate the Akaike Information Criterion value, using:

	- n:   number of observations
	- k:   number of parameters
	- rss: residual sum of squares
	"""
	return n * log((2 * pi) / n) + n + 2 + n * log(rss) + 2 * k

def BICrss(n, k, rss):
	"""Calculate the Bayesian Information Criterion value, using:
	
	- n:   number of observations
	- k:   number of parameters
	- rss: residual sum of squares
	"""
	return n + n * log(2 * pi) + n * log(rss / n) + (log(n)) * (k + 1)

#~ ############################
#~ # M  A  I  N    C  O  D  E #
#~ ############################

def main(argv):
	"""Performs fitting to the Gaussian-Gompertz, Schoolfield and Cubic model,
	and returns the best fits as a csv file to ./Results/results.csv"""
	#Produce an error is there is no dataset provided.
	data = sc.genfromtxt(argv,dtype = None,delimiter = ',',deletechars='"')
	#input file "./Data/ThermResp_startvals.csv"
	# Define the Boltzmann constant (units of eV * K^-1).
	global k
	k = 8.617 * 10 ** (-5)

	#Open the csv file to write the output to.
	??
	results = open("../Results/results.csv", 'w')
	results_csv = csv.writer(results, delimiter=",")

	# Here you will run the lmfitting over all unique data series. you 
	# will have to use try and except as the fitting won't always work with each model.

if __name__ == "__main__":
	#The input file name will be the minimum input, but you can add more inputs if you want 
	main(sys.argv[1])		
