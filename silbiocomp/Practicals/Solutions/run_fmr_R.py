# Import the commands module and run the fmr.R script.

import subprocess
#~ You can also use "commands" module
#~ This script should be in the same directory as 'fmr.R'

MyRScript = 'fmr.R'

p = subprocess.Popen("Rscript --verbose " + MyRScript, \
stdout=subprocess.PIPE, shell=True)

(output, err) = p.communicate()

if p.returncode == 0:
	print "*** Successful run! ***\n"
	print "The R output was:  \n", output
else:   
	print "*** Unsuccessful run! ***\n"

#####################################################
## Alternative solution using the commands module ## 
#####################################################

## Import the commands module and run the fmr.R script.
# import commands
# result = commands.getstatusoutput("Rscript --verbose fmr.R")
# 
##Check the exit status to see if the run was successful and print output
# if result[0] == 0:
	# print "*** Successful run! ***\n"
	# print result[1]
# else:
	# print "*** Run failed! ****\n"
	# print result[1]
