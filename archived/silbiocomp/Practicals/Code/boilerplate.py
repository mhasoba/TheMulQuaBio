#!/usr/bin/python

"""Description of this program 
	you can use several lines"""

__author__ = 'Samraat Pawar (s.pawar@imperial.ac.uk)'
__version__ = '0.0.1'

# imports
import sys # module to interface our program with the operating system

# constants can go here


# functions can go here
def main(argv):
		print 'This is a boilerplate' # NOTE: indented using two tabs or 4 spaces
		return 0

if __name__ == "__main__": #makes sure the "main" function is called from commandline  
		status = main(sys.argv)
		sys.exit(status)
