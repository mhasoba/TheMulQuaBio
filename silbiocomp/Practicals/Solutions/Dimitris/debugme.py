"""
	A function that used to be buggy.
"""

def createabug(x):
	"""
		A function that created a bug by dividing by zero.
	"""
	
	y = x**4
	
	# Stop the script and debug it.
	#import pdb; pdb.set_trace()
	
	# Set z to 1 rather than zero.
	z = 1.
	
	y = y/z
	return y
	
print createabug(25)
