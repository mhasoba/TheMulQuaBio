#!/usr/bin/env python

from lmfit import minimize, Parameters, Parameter, report_fit
import scipy as sc
from matplotlib import pylab as pl

data = sc.genfromtxt("../Data/ClimateData.csv",dtype = None, delimiter = ',')
headers = data[0,:] #~ extract headers...
data = sc.array(sc.delete(data,0,0)) #~ ...and delete them from data array
Years = data[:, 0].astype(int)
Temperatures = data[:, 3].astype(float)
x = sc.arange(len(Years)) #~ pseudo-timepoints to feed to SinMod 

# define objective function: returns the array to be minimized
def SinMod(params, x, data):
    """ model sine wave, subtract data"""
    Shift = params['Shift'].value
    Amp = params['Amp'].value
    Len = params['Len'].value
    Phase = params['Phase'].value

    model = Shift + Amp * sc.sin((2 * sc.pi * x / Len) + Phase)
    
    return model - data

# create a set of Parameters
params = Parameters()
params.add('Amp',   value= 5,  min=0)
params.add('Shift', value= 10.0, min=5, max=15) #you can add bounds
params.add('Len', value= 12.0) # Sensitive to this parameter!
params.add('Phase', value= 1.0)

# do fit (you can try different algorithms, such as lestsq, nelder, etc)

result = minimize(SinMod, params, args=(x, Temperatures),method="leastsq")

# calculate final result
final = Temperatures + result.residual

# write error report
report_fit(result.params)

# Plot results
try: # poor use of try!
    pl.close('all')
    pl.ion()
    fig = pl.plot(x, Temperatures, '+k--')
    pl.plot(x, final, 'r')
    pl.title('lmfit to Climatic fluctuations')
    pl.xlabel('Time')
    pl.ylabel('Temperature ($^\circ$C)')
except:
    pass
