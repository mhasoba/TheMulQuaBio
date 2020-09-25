#!/user/bin/python3

""" The typical continuous time Lotka-Volterra model with density dependence simulated using scipy. """

# Imports packages, assigns names. 
import scipy as sc 
import scipy.integrate as integrate
import pylab as p #Contains matplotlib for plotting
import sys

# Define function, contains equations for Lotka-Volterra.
def dCR_dt(pops, t=0):
    """ Returns the growth rate of predator and prey populations at any given time step """
    
    R = pops[0]
    C = pops[1]
    dRdt = r*R*(1-R/K) - a*R*C 
    dCdt = -z*C + e*a*R*C
    
    return sc.array([dRdt, dCdt])

# Assign parameters, using arguments from command line a inputs.
r = float(sys.argv[1]) # Resource growth rate
a = float(sys.argv[2]) # Consumer search rate (determines consumption rate) 
z = float(sys.argv[3]) # Consumer mortality rate
e = float(sys.argv[4]) # Consumer production efficiency
K = float(sys.argv[5]) # Sets resource carrying capacity
 
# Now define time -- integrate from 0 to 500, using 1000 points:
t = sc.linspace(0, 500,  1000)

x0 = 10
y0 = 5 
z0 = sc.array([x0, y0]) # Initial conditions: 10 prey and 5 predators per unit area

pops, infodict = integrate.odeint(dCR_dt, z0, t, full_output=True)

infodict['message']     # >>> 'Integration successful.'

# Prints the stable population sizes from the end of the simulation.
print "For LV2.py"
print "Stable Resource population is: ", pops[-1,0]
print "Stable Consumer population is: ", pops[-1,1]

prey, predators = pops.T # Transpose the output.
f1 = p.figure() #Open empty figure object
p.plot(t, prey, 'g-', label='Resource density') # Plot
p.plot(t, predators  , 'b-', label='Consumer density')
p.grid()
p.legend(loc='best')
p.xlabel('Time')
p.ylabel('Population')
p.title('Consumer-Resource population dynamics')
p.text((t[-1]/2),1,"r = %r, a = %r, z = %r, e = %r, K = %r" % (r, a, z, e, K), horizontalalignment='center', verticalalignment='bottom') # Plots the values of r, a, z, e and K on the graph. located half way along x axis and at 1 on y axis.
#p.show()
f1.savefig('../Results/LV2_plot.pdf') #Save figure
