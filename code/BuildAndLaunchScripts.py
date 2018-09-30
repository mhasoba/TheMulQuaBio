#!/usr/bin/python
#######################################################
## THINGS TO MODIFY
DataFile = "Test35_household_12364_21.txt"
NR = 12364 # Number of rows
NC = 21 # Number of columns

MinLinks = 56 # Minimum number of links to use
MaxLinks = 70 # Maximum number of links to use

NumberSteps = '1000000' # Note: use a string!

AndOr = 'both' # (possible values: 'and', 'or', 'both')
MinSeed = 1 # smallest seed to use
MaxSeed = 5 # largest seed to use
## END THINGS TO MODIFY
#########################################################
import os
import sys
import time

# Build scripts
for L in range(MinLinks, MaxLinks + 1):
    for S in range(MinSeed, MaxSeed + 1):
        # Choose a name for the job
        JNAME = 'H' + DataFile[0:5] + '-' + str(L) + '-' + str(S)
        # Open the file for writing
        f = open(JNAME + ".sh", "w")
        # Build the line to run the program
        launchstrand = "python FindHierarchy-Dictionary.py %s %d %s And %d MaxLik None" %(DataFile, L, NumberSteps, S)
        launchstror = "python FindHierarchy-Dictionary.py %s %d %s Or %d MaxLik None" %(DataFile, L, NumberSteps, S)
        if AndOr == 'both':
            f.write("#!/bin/bash\n#PBS -N %s \n#PBS -d . \n#PBS -j oe \n#PBS -S /bin/bash \n%s\n%s\n" % (JNAME, launchstrand, launchstror))
        elif AndOr == 'and':
            f.write("#!/bin/bash\n#PBS -N %s \n#PBS -d . \n#PBS -j oe \n#PBS -S /bin/bash \n%s\n" % (JNAME, launchstrand))
        elif AndOr == 'or':
            f.write("#!/bin/bash\n#PBS -N %s \n#PBS -d . \n#PBS -j oe \n#PBS -S /bin/bash \n%s\n" % (JNAME, launchstror))
        # Close the file
        f.close()
        
        # Now submit the script
        os.system('qsub %s' % JNAME + ".sh")
        # And wait 3 seconds to let the queue handle the submission
        time.sleep(1)

