#!/usr/bin/python

"""some control flow exercises. """
__author__ = 'Your Name (your.name@imperial.ac.uk)'
__version__= '0.0.1'

# imports
import sys

# How many times will 'hello' be printed?

# 1) prints hello 14 times
for i in range(3, 17):
	print 'hello'
		
# 2) prints hello 4 times
for j in range(12):
	if j % 3 == 0:
		print 'hello' 

# 3) prints hello 5 times
for j in range(15):
	if j % 5 == 3:
		print 'hello'
	elif j % 4 == 3:
		print 'hello'
 
# 4) prints hello 5 times
z = 0
while z != 15:
	print 'hello' 
	z = z + 3

# 5) # prints hello 8 times
z = 12
while z < 100:
	if z == 31:
		for k in range(7):
			print 'hello'
	elif z == 18:
		print 'hello'
	z = z + 1

def foo1(x): 
	""" square roots a number x"""
	return x ** 0.5

def foo2(x, y):
	"""" Find which is larger a number x or a larger y"""
	if x > y:
		return x
	return y
	
def foo3(x, y, z):
	""" Compares numbers 1st and 2nd number in a set of 3 and swaps them 
	round if 1st is greater then 2nd.  Repeats this for 2nd and 3rd 
	number taking into account previous changes. On some sets will sort
	numbers in ascending order on first use. On all sets will sort 
	numbers in ascending order on second use"""
	if x > y:
		tmp = y
		y = x
		x = tmp
	if y > z:
		tmp = z
		z = y
		y = tmp
	return [x, y, z]

def foo4(x):
	"""takes number x and multiples it by all numbers between 1 and x)"""
	result = 1
	for i in range(1, x +1):
		result = result * i
	return result

# does same as foo4 but seems unable to deal with larg x ( x > 1000)
def foo5(x): 
	"""takes number x and multiplies it by all numbers between 1 and x.
	lesss efficient then foo4 as is a recursive function"""
	if x == 1:
		return 1
	return x *foo5 (x-1)
	
#main functions tests functions when script is run but not when imported
def main(argv):
	print foo1(22)
	print foo2(33,29)
	print foo3(120,150,110)
	print foo4(121)
	print foo5(10)
	return 0

if (__name__== "__main__"): # makes sure main function is called from commandline.
	status = main(sys.argv)
	sys.exit(status)
