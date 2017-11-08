"""
	A script that filters Oaks' data from an input csv file.
"""

import csv
import sys
import doctest

#Define function
def is_an_oak(name):
    """ Returns True if name starts with 'quercus '
    
    >>> is_an_oak('Quercus cerris')
    True
    
    >>> is_an_oak('Quercuss cerris')
    False
    
    >>> is_an_oak('Fagus sylvatica')
    False
    """
    
    # Return true if the species' name -in lowercase-
    # starts with 'quercus' and a space.
    return name.lower().startswith('quercus ')

print(is_an_oak.__doc__)

def main(argv): 
    f = open('../Data/TestOaksData.csv','rb')
    g = open('../Results/JustOaksData.csv','wb')
    taxa = csv.reader(f)
    csvwrite = csv.writer(g)
    oaks = set()
    
    for row in taxa:
        print row
        print "The genus is", row[0]
        
        # Fixed the bugs by passing the whole
        # species name, rather than the genus only.
        if is_an_oak(row[0] + row[1]):
            print row[0]
            print 'FOUND AN OAK!'
            print " "
            csvwrite.writerow([row[0], row[1]])   
    
    return 0
    
if (__name__ == "__main__"):
    status = main(sys.argv)

doctest.testmod()
