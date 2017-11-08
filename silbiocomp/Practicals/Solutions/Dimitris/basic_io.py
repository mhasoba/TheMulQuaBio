"""
	Reading files, writing files, storing objects and loading them again.
"""

#############################
# FILE INPUT
#############################
# Open a file for reading
f = open('../Data/test.txt', 'r')

# use "implicit" for loop:
# if the object is a file, python will cycle over lines
for line in f:
	print line, # the "," prevents adding a new line

# close the file
f.close()

# Same example, skip blank lines
f = open('../Data/test.txt', 'r')
for line in f:
	if len(line.strip()) > 0:
		print line,

f.close()

#############################
# FILE OUTPUT
#############################
# Save the elements of a list to a file
list_to_save = range(100)

f = open('../Data/testout.csv', 'w')
for i in list_to_save:
	f.write(str(i) + '\n') ## Add a new line at the end
	
f.close()

#############################
# STORING OBJECTS
#############################
# To save an object (even complex) for later user
my_dictionary = {"a key": 10, "another key": 11}

import pickle

f = open('../Data/testp.p', 'wb') ## note the b: accept binary files
pickle.dump(my_dictionary, f)
f.close()

## Load the data again
f = open('../Data/testp.p', 'rb')
another_dictionary = pickle.load(f)
f.close()

print another_dictionary
