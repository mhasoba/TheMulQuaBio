""" Python code for a Fractal Fern the IFS defined in Table 3.8.3 of 
Michael Barnsley's "Fractals Everywhere" just type "Fern" in the Matlab 
command window to run it"""

import random
import numpy as np
import matplotlib.pyplot as plt
 
## clear all
iterations = 10000 ##number of iterations
## recall, the transformations are of the form A*[x,y]+t
## and, there are four such transformations ...
A1 = np.array([0, 0, 0, 0.16]) 
A2 = np.array([0.85, 0.04, -0.04, 0.85]), 
A3 = np.array([0.2, -0.26, 0.23, 0.22]) 
A4 = np.array([-0.15, 0.28, 0.26, 0.24]) 
t1 = np.array([0, 0]) 
t2 = np.array([0, 1.6]) 
t3 = np.array([0, 1.6]) 
t4 = np.array([0, 0.44]) 
## here are the probabilities with which each transformation is applied
## notice that p1+p2+p3+p4 = 1
p1 = 0.01 
p2 = 0.85 
p3 = 0.07 
p4 = 0.07 
## the initial point
x = np.empty([0, 0])
y = np.empty([0, 0])

x[1] = 0 
y[1] = 0 

## but, let's write the (x,y) points as a vector, v
v = np.array([0, 0]) ## here is the intial point 
import ipdb; ipdp.set_trace() 

# for n = 2:iterations
 # ## choose a random number, k, between 0 and 1
 # k = rand 
 # ## depending on your random number ...
 # ## do one of the four transformations to get a new point
 # if k<p1 
   # v = A1*v+t1 
 # elseif k<p1+p2
   # v = A2*v+t2 
 # elseif k<p1+p2+p3
   # v = A3*v+t3 
 # else
   # v = A4*v+t4 
 # end
 # ## now, go back and define your (x,y) point as elements of the vector v
 # x(n) = v(1) 
 # y(n) = v(2) 
# end
# ##now, let's plot all those (x,y) points that we just computed! 
# ## opengl software ##this is a fix to ensure that Matlab won't crash :)
# hold off
# plot(x,y,'.','Color',[0.5 0.5 0],'Markersize',1)
# ## uncomment the next two lines to see the initial point in red
# ## hold on
# ## plot(x(1),y(1),'r*','Markersize',4)
# axis('equal','off') 
# set(gcf, 'color','white') 
