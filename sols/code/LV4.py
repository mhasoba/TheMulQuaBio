#!/usr/bin/python

""" A script that simulates the discrete-time Lotka-Volterra model with random gaussian fluctuations."""

__author__ = "Your Name (y.name@ic.ac.uk)"
__version__ = "0.0.1"

import scipy as sc 
import scipy.stats as scs
import scipy.integrate as integrate
import pylab as p #Contains matplotlib for plotting
import sys


def dR_dt(x,y, t=0):
    """ Returns the growth rate of predator and prey populations at any given time step with a random fluctuation"""
    # the model
    R = x
    C = y
    eps = float(scs.norm.rvs(0,1,1)) # generates a random variable from a standard gaussian distr 
    dR = R*(1 + (r+eps)*(1-(R/K))) - a*C*R
    dC = C - z*C + e*a*R*C
    
    return sc.array([[dR, dC ]])

if len(sys.argv) >= 5: # Allows uses to input arguments else uses defaults
	r = float(sys.argv[1])
	a = float(sys.argv[2])
	z = float(sys.argv[3])
	e = float(sys.argv[4])
elif len(sys.argv) == 4:
	r = float(sys.argv[1])
	a = float(sys.argv[2])
	z = float(sys.argv[3])
	e = 0.75
elif len(sys.argv) == 3:	
	r = float(sys.argv[1])
	a = float(sys.argv[2])
	z = 1.5
	e = 0.75
elif len(sys.argv) == 2:	
	r = float(sys.argv[1])
	a = 0.1
	z = 1.5
	e = 0.75
else:
# Define parameters:
	r = 1. # Resource growth rate
	a = 0.1 # Consumer search rate (determines consumption rate) 
	z = 1.5 # Consumer mortality rate
	e = 0.75 # Consumer production efficiency

# Now define time -- integrate from 0 to 15, using 1000 points:
t = sc.linspace(0, 15,  15)
K = 100
x0 = 10
y0 = 5
z0 = sc.array([x0, y0]) # initials conditions: 10 prey and 5 predators per unit area
pops = sc.array([[x0,y0]])
x = z0[0]
y = z0[1]
n= len(t) # get length of t

for i in t[1:n]: # initial conditions already included in pops
	
	new = dR_dt(x,y,i) # 2*1 array
	if new[0,0] < 0: # doesn't allow density to drop below 0
		new[0,0] = 0
	if new[0,1] < 0:
		new[0,1] = 0
	pops = sc.concatenate((pops,new),axis=0) 
	x = float(new[0,0])  # rounds values so doesn't exceed memory
	y = float(new[0,1])



prey, predators = pops.T # Transposes to form correct format 

final_prey = prey[-1]
final_predator = predators[-1]
f1 = p.figure() #Open empty figure object
p.plot(t, prey, 'g-', label='Resource density') # Plot
p.plot(t, predators  , 'b-', label='Consumer density')
p.annotate( 'Constants: r = %r , a = %r , z = %r , e = %r , K = %r' %(r,a,z,e,K), xy=(20,5), color = "red") 
p.annotate('Final prey = %.5s , Final predators = %.5s' %(final_prey,final_predator), xy=(25,2), color = "purple")
p.grid()
p.legend(loc='best')
p.xlabel('Time')
p.ylabel('Population')
p.title('Consumer-Resource population dynamics')
p.show()
f1.savefig('../Results/prey_and_predators_4.pdf') #Save figure