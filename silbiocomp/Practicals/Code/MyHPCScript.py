# -*- coding: utf-8 -*-
"""
Created on Wed Dec 02 16:20:48 2015

@author: Samraat Pawar

"""
import os # need this to get environment variables

i = int(os.getenv("PBS_ARRAY_INDEX"))

do_simulation(i)

def do_simulation():
	...
	return ...
