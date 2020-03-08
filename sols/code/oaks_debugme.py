#!usr/bin/python

"""Function used to see if an argument is an oak tree or not."""
	
__author__ = 'Your Name (YourName@email.address)'
__version__ = '0.0.1'

import csv
import sys
import pdb
import doctest

#Define function
def is_an_oak(name):
    """ Returns True if name is starts with 'quercus '
        >>> is_an_oak('quercus ')
        True
        >>> is_an_oak('Fagus sylvatica')
        False
        >>> is_an_oak('Quercuss')
        False
        >>> is_an_oak('quercustjklds')
        False
    """
    
    if name.lower().startswith('quercus'): # fixed the typo 'quercs'
        lowername = name.lower() # if the argument starts with 'quercus', then set the lowercase argument to be a new variable, lowername
        if len(lowername) == 7: # if the argument matches quercus and has length 7, then it must be exactly, 'quercus', so return True
            return True
        elif len(lowername) == 8: # if the argument matches quercus and has length 8, then it might be because there is a space after quercus, in which case we want it to return True...however, if there is anything other than a space, we want it to return False
            if lowername == 'quercus ':
                return True
            else:
                return False
        else: # otherwise, if the length is greater than 8, there is no possible way that it could be 'quercus', so return False
            return False
    else:
        return False # if the name doesn't start with quercus, return False

def main(argv): 
    f = open('../data/TestOaksData.csv','r') # opens the TestOaksData file for reading
    g = open('../data/JustOaksData.csv','w') # opens the JustOaksDta file for writing to
    taxa = csv.reader(f) # assign the variable taxa to whatever is read from the TestOaksData.csv file
    csvwrite = csv.writer(g) # assign the variable csvwrite to whatever is to be written into JustOaksData.csv
    oaks = set() # initialize an empty set called oaks
    for row in taxa: # for every row in the csv.reader, taxa
        print(row) 
        print("The genus is", row[0])
        print(" ") 
        if is_an_oak(row[0]): # if using the value of the row[0] of TestOaksData as an argument for the function 'is_an_oak' returns True
            print(row[0])
            print('FOUND AN OAK!\n')
            csvwrite.writerow([row[0], row[1]]) # add this value to the JustOaksData.csv  
    
    return 0
    
if (__name__ == "__main__"):
    status = main(sys.argv)

doctest.testmod()