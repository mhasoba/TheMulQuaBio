""" Runs 5 lotka voltera models and profiles them accordingly """
	
import subprocess
import cProfile

r = 1.5 # float(sys.argv[1]) # Resource growth rate
a = 0.1 # float(sys.argv[2]) # Consumer search rate (determines consumption rate) 
z = 0.5 # float(sys.argv[3]) # Consumer mortality rate
e = 0.75 # float(sys.argv[4]) # Consumer production efficiency
k = 20. # float(sys.argv[5]) # Carrying capacity.

print "All variations of lotkar volterra are run and profiled using same parameters"
subprocess.os.system('ipython -m cProfile LV1.py 1.5 0.1 0.5 0.75')
subprocess.os.system('ipython -m cProfile LV2.py 1.5 0.1 0.5 0.75 20')
subprocess.os.system('ipython -m cProfile LV3.py 1.5 0.1 0.5 0.75 20')
subprocess.os.system('ipython -m cProfile LV4.py 1.5 0.1 0.5 0.75 20')
subprocess.os.system('ipython -m cProfile LV5.py 1.5 0.1 0.5 0.75 20')
