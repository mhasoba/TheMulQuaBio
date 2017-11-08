"""
	Finding files using the subprocess.os module.
"""

# Use the subprocess.os module to get a list of files and directories in your ubuntu home/ directory 

import subprocess

#help(subprocess.os.listdir)

# try:

subprocess.os.listdir('../../')

#++++++++++++++++++
# Use subprocess.os.path together with list comprehensions or conventional 
#~loops and control flow statments to get a list of files and 
#~directories in your home/ that start with a 'C'

# Type your code here:

# Indicate that this is part 1.
print "Part #1:"

# Get the user's home directory.
home = subprocess.os.path.expanduser("~")

# Create a list to store the results.
FilesDirsStartingWithC = []

# Use a for loop to walk through the home directory.
for (dir, subdir, files) in subprocess.os.walk(home):
	
	# Check if subdirectories start with C.
	for temp_dir in subdir:
		
		# If the directory starts with C, add its path to the list.
		if temp_dir.startswith('C'):
			path = subprocess.os.path.join(dir, temp_dir)
			FilesDirsStartingWithC.append(path)

	# Check if files start with C.
	for f in files:
	
		# If the file starts with C, add its path to the list.
		if f.startswith('C'):
			path = subprocess.os.path.join(dir, f)
			FilesDirsStartingWithC.append(path)

# Display the results.
print FilesDirsStartingWithC

#++++++++++++++++++
# Get files and directories in your home/ that start with either an upper or lower
# case 'C'

# Type your code here:

# Indicate that this is part 2.
print "\nPart #2:"

# Create a list to store the results.
FilesDirsStartingWithCc = []

# Use a for loop to walk through the home directory.
for (dir, subdir, files) in subprocess.os.walk(home):
	
	# Check if subdirectories start with C or c.
	for temp_dir in subdir:
		
		# If the directory starts with C or c, add its path to the list.
		if temp_dir.startswith('C') or temp_dir.startswith('c'):
			path = subprocess.os.path.join(dir, temp_dir)
			FilesDirsStartingWithCc.append(path)

	# Check if files start with C.
	for f in files:
	
		# If the file starts with C, add its path to the list.
		if f.startswith('C') or f.startswith('c'):
			path = subprocess.os.path.join(dir, f)
			FilesDirsStartingWithCc.append(path)

# Display the results.
print FilesDirsStartingWithCc

#++++++++++++++++++
# Get only directories in your home/ that start with either an upper or 
#~lower case 'C' 
# Hint: look in subprocess.os and/or subprocess.os.path for helpful functions

# Type your code here:

# Indicate that this is part 3.
print "\nPart #3:"

# Create a list to store the results.
DirsStartingWithCc = []

# Use a for loop to walk through the home directory.
for (dir, subdir, files) in subprocess.os.walk(home):
	
	# Check if subdirectories start with C or c.
	for temp_dir in subdir:
		
		# If the directory starts with C or c, add its path to the list.
		if temp_dir.startswith('C') or temp_dir.startswith('c'):
			path = subprocess.os.path.join(dir, temp_dir)
			DirsStartingWithCc.append(path)

# Display the results.
print DirsStartingWithCc
