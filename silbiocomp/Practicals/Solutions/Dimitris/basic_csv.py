"""
	Read and write from/to csv files.
"""
import csv

# Read a file containing:
# 'Species', 'Infraorder', 'Family', 'Distribution', 'Body mass male (Kg)'
f = open('../Data/testcsv.csv', 'rb')

csvread = csv.reader(f)
for row in csvread:
	print row
	print "The species is", row[0]

f.close()

# write a file containing only species name and Body mass
f = open('../Data/testcsv.csv', 'rb')
g = open('../Data/bodymass.csv', 'wb')

csvread = csv.reader(f)
csvwrite = csv.writer(g)
for row in csvread:
	print row
	csvwrite.writerow([row[0], row[4]])

f.close()
g.close()
