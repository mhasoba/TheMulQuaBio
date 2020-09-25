#!/usr/bin/env python3

""" A python version of Vectorize1.R, sums all elements in a matrix
using loop or vectorization"""

__appname__ = 'Vectorize1.py'
__author__ = 'Hanyun Zhang (hanyun.zhang18@imperial.ac.uk)'
__version__ = '0.0.1'

# Import 
import numpy as np

# Create a 1000 * 1000 array
M = np.random.random_sample((1000,1000))


def SumAllElements(M):
	""" Sum all elements in a matrix """
	Tot = 0
	for i in range(M.shape[0]):
		for j in range(M.shape[1]):
			Tot = Tot + M[i][j]
	return Tot

## Calculate sum using loop
# Record the time taken
from timeit import default_timer as timer
start = timer()
total = SumAllElements(M)
end = timer()
timetaken = end - start
print ("Looping sum is ", total)
print ("Looping sum takes: ", timetaken)

## Calculate sum with vectorization
start = timer()
total = sum(map(sum, M))
end = timer()
timetaken = end - start
print ("Vectorized sum is ", total)
print ("Vectorized sum takes: ", timetaken)


	
	

