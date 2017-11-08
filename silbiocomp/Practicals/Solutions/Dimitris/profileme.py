"""
	A script for learning how to profile. It appears that xrange is much
	faster than range.
"""

def a_useless_function(x):
	"""
	A function that returns 0 after a 100000000 step loop.
	"""
	y = 0
	# eight zeros!
	for i in xrange(100000000):
		y = y + i
	return 0

def a_less_useless_function(x):
	"""
	A function that returns 0 after a 100000 step loop.
	"""
	y = 0
	# five zeros!
	for i in xrange(100000):
		y = y + i
	return 0

def some_function(x):
	"""
	A function that prints a value and returns 0 afer having called 
	the previous ones.
	"""
	print x
	a_useless_function(x)
	a_less_useless_function(x)
	return 0

some_function(1000)
