""" The typical continuous time Lotka-Volterra model simulated using scipy """

import scipy as sc
import scipy.integrate as integrate
import matplotlib.pylab as p

def dCR_dt(pops, t=0):
    """ Returns the growth rate of consumer and resource populations at any given time step """
    
    R = pops[0]
    C = pops[1]
    dRdt = r * R - a * R * C 
    dCdt = -z * C + e * a * R * C
    
    return sc.array([dRdt, dCdt])

# Define parameters:
r = 1. # Resource growth rate
a = 0.1 # Consumer search rate (determines consumption rate) 
z = 1.5 # Consumer mortality rate
e = 0.75 # Consumer production efficiency

# Now define time -- integrate from 0 to 15, using 1000 points:
t = sc.linspace(0, 15,  1000)

R0 = 10
C0 = 5 
RC0 = sc.array([R0, C0]) # initial conditions: 10 resources and 5 consumers per unit area

pops, infodict = integrate.odeint(dCR_dt, RC0, t, full_output=True)

infodict['message'] # 'Integration successful.'

f1 = p.figure() # Open empty figure object

p.plot(t, pops[:,0], 'g-', label='Resource density') # Plot
p.plot(t, pops[:,1], 'b-', label='Consumer density')
p.grid()
p.legend(loc='best')
p.xlabel('Time')
p.ylabel('Population density')
p.title('Consumer-Resource population dynamics')
# p.show()
f1.savefig('../results/LV_model.pdf') # Save figure

f2 = p.figure()  # Open another empty figure object
p.plot(pops[:,0], pops[:,1],'r-') # Plot
p.grid()
p.xlabel('Resource density')
p.ylabel('Consumer density')
p.title('Consumer-Resource population dynamics')
# p.show()
f2.savefig('../results/LV_model_CR.pdf') # Save figure