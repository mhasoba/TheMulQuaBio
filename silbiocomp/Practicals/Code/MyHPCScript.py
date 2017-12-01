# -*- coding: utf-8 -*-
"""
Created on Wed Nov 02 16:20:48 2017

@author: Samraat Pawar

"""
import os # to get environment variables

home <- os.getenv('HOME')

i = int(os.getenv("PBS_ARRAY_INDEX"))

####Functions block start ####
def do_simulation(ar1, arg2, etc):
	results = ...
	return results
#### Functions block end ####

do_simulation(i)

save(results, file='home/MyProject/results_HPC.csv')