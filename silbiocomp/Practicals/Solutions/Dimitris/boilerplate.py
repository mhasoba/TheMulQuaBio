#!/usr/bin/python

"""
A script that just prints some text.
"""

__author__ = 'Dimitrios - Georgios Kontopoulos (d.kontopoulos13@imperial.ac.uk)'
__version__ = '0.0.1'

# imports
import sys # module to interface our program with the operating system

# constants can go here

# functions can go here
def main(argv):
    """
    The main function that prints the text.
    """
    print 'This is a boilerplate' # NOTE: indented using 4 spaces
    return 0

if (__name__ == "__main__"): #makes sure the "main" function is called from commandline
   status = main(sys.argv)
   sys.exit(status)
