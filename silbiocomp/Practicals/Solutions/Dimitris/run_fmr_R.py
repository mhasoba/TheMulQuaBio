"""
	A Python script that runs the fmr.R R script.
"""

# Import the commands module and run the fmr.R script.
import commands
result = commands.getstatusoutput("Rscript --verbose fmr.R")

# Check the exit status to see if the run was successful
# and print the output.
if result[0] == 0:
	print "*** Successful run! ***\n"
	print result[1]
else:
	print "*** Run failed! ****\n"
	print result[1]
