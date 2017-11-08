""" The typical Lotka-Volterra Model simulated using scipy """

import scipy as sc 
import scipy.integrate as integrate

import pylab as p #Contains matplotlib for plotting
import sys
# import matplotlip.pylab as p #Some people might need to do this

def dR_dt(pops, t=0):
    """ Returns the growth rate of predator and prey populations at any 
    given time step """
    
    R = pops[0]
    C = pops[1]
    dRdt = r*R - a*R*C 
    dydt = -z*C + e*a*R*C
    
    return sc.array([dRdt, dydt])

# Define parameters:
r = float(sys.argv[1]) # Resource growth rate
a = float(sys.argv[2]) # Consumer search rate (determines consumption rate) 
z = float(sys.argv[3]) # Consumer mortality rate
e = float(sys.argv[4]) # Consumer production efficiency
K = float(sys.argv[5]) # Consumer production efficiency

# Now define time -- integrate from 0 to 100, using 1000 points:
t = sc.linspace(0, 100,  1000)

x0 = 10
y0 = 5 
z0 = sc.array([x0, y0]) # initials conditions: 10 prey and 5 predators per unit area

pops, infodict = integrate.odeint(dR_dt, z0, t, full_output=True)

infodict['message']     # >>> 'Integration successful.'
p.ion()
prey, predators = pops.T # What's this for?
f1 = p.figure() #Open empty figure object
p.plot(t, prey, 'g-', label='Resource density') # Plot
p.plot(t, predators  , 'b-', label='Consumer density')
p.grid()
p.legend(loc='best')
p.xlabel('Time')
p.ylabel('Population')
p.title('Consumer-prey population dynamics')
f1.savefig('../Results/prey_and_predators_1.pdf') #Save figure

# print final population values
print "For standard Lotkar voltar"
print "final predator population value is " +  str(pops[len(t) - 1 ,1])
print "final prey population value is " + str(pops[len(t) - 1,0])
