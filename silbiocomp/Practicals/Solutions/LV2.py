#!/user/bin/python

"""This program runs a simulated Lotka-Volterra Model using the python
   package 'scipy'. Users first input values for Prey Growth Rate (r),
   Predator Search Rate (a), Predator Mortality Rate (m) and Predator
   production efficiancy (e), along with time (t) and the program
   runs the model, producing a graph of the system, saved to the 
   'Results' directory"""
	
import scipy as sc
import scipy.integrate as integrate
from numpy import *
import pylab as p

def dx_dt(z, t=0):
	""" Returns the growth rate of predator and prey populations at any
	given time step """
	
	x = z[0]
	y = z[1]
	k = 100
	#~ k # For defining paramters using a promt interface
	
	dxdt = r*x*(1-(x/k)) - a*x*y
	dydt = -m*y + e*a*x*y
	
	return sc.array([ dxdt, dydt])
	
# Define parameters:

import sys

#~ print 'Number of arguments:', len(sys.argv), 'arguments.'
#~ print 'Argument List:', str(sys.argv)

arg_names = ['r', 'a', 'm', 'e']

r = float(sys.argv[1])
a = float(sys.argv[2])
m = float(sys.argv[3])
e = float(sys.argv[4])

T = float(sys.argv[5])
t = sc.linspace(0, T, 100)

mystring2 = ' '.join(["r =", str(r), ", a =", str(a), ", m =", str(m), ", e =", str(e), ", t =", str(T)])
print mystring2

#~ r = 1
#~ a = 0.75
#~ m = 0.5
#~ e = 0.1

# ALTERNATIVE: Define paramters using a prompt interface:
# (Note: Must remove set value for k to work)

#~ var0 = raw_input("Please enter a value for the carrying capacity: ")
#~ print "you entered", var0
#~ k= float(var0)
#~ 
#~ var1 = raw_input("Please enter a value for r (Prey growth rate): ")
#~ print "you entered", var1
#~ r = float(var1)
#~ 
#~ var2 = raw_input("Please enter a value for a (Predator search rate): ")
#~ print "you entered", var2
#~ a = float(var2)
#~ 
#~ var3 = raw_input("Please enter a value for m (Predator mortality rate): ")
#~ print "you entered", var3
#~ m = float(var3)
#~ 
#~ var4 = raw_input("Please enter a value for e (Predator production efficiency): ")
#~ print "you entered", var4
#~ e = float(var4)

#~ # Defining time by integrating from 0 to the user input, using 1000 points:
#~ var5 = raw_input("Please enter a value for time: ")
#~ print "you entered", var5
#~ T = float(var5)
#~ 
#~ t = sc.linspace(0, T, 1000)#

T = float(sys.argv[5])
t = sc.linspace(0, T, 100)

x0 = 10
y0 = 5
z0 = sc.array([x0, y0]) 
                      
z, infodict = integrate.odeint(dx_dt, z0, t, full_output=True)

infodict['message']   

import matplotlib.pyplot as plt                  

prey, predators = z.T 
f1= p.figure() # Open empty figure object / canvas

ax = f1.add_subplot(111)
p.text(0.983, 0.02, mystring2, fontsize=15, bbox=dict(facecolor = 'white'), horizontalalignment = 'right', verticalalignment = 'bottom', transform = ax.transAxes)
p.plot(t, prey, 'g-', label = 'Prey density')#Plots the graph with label
p.plot (t, predators , 'b-', label = 'Predator density') #b- specifies
# colour, i.e. b- is blue, -g is green
p.grid()
p.legend(loc='best')
p.xlabel('Time', fontsize = 15)
p.ylabel('Population', fontsize = 15)
p.title('Predator-Prey Population Dynamics')
p.show() # Shows what has been produced
f1.savefig('../Results/prey_and_predators_1.pdf') # Save figure
