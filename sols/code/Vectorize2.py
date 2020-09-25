#!/usr/bin/env python3

""" A python version of Vectorize2.R, uses different ways 
to run the stochastic Ricker model"""

__appname__ = 'Vectorize2.py'
__author__ = 'Hanyun Zhang (hanyun.zhang18@imperial.ac.uk)'
__version__ = '0.0.1'

# Imports
import numpy as np

# Function
def matrix(numyears, p0):
    """ Create an empty matrix with random values assigned to the first row """
    N = np.zeros(shape = (numyears,len(p0[0])))
    N[0] = p0[0]
    return(N)
        
def stochrick(numyears = 100, p0 = np.random.random_sample((1,1000)), r=1.2, K=1, sigma=0.2):
    """ Calculate the Ricker model with looping """    
    N = matrix(numyears, p0)
    for pop in range(len(p0[0])):
        for yr in range(1, numyears):
            N[yr][pop] = N[yr-1][pop] * np.exp(r * (1-N[yr-1][pop]/K)) + np.random.normal(0, sigma, 1)
    return(N)


def stochrickvect(numyears = 100, p0 = np.random.random_sample((1,1000)), r=1.2, K=1, sigma=0.2):
    """ Calculate the Ricker model with vectorization """    
    N = matrix(numyears, p0)
    for yr in range(1, numyears):
        N[yr] = N[yr-1] * np.exp(r * (1-N[yr-1]/K)) + np.random.normal(0, sigma, 1) 
    return(N)

np.seterr(all='ignore') # The np.exp function rises a runtime warning because some outputs are
# too large for the dtype of the numpy array to store. The warning is ignored by numpy setting. 


## Calculate the Ricker model with loop
# Record the time taken
from timeit import default_timer as timer
start = timer()
data = stochrick()
end = timer()
timetaken = end - start
print ("Looping Stochastic Ricker takes:", timetaken)

# Calculate the vectorized Ricker iteration
# Record the time taken
start = timer()
data = stochrickvect()
end = timer()
timetaken = end - start
print ("Vectorized Stochastic Ricker takes:", timetaken)

