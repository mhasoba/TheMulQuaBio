"""
	A script that creates a csv file from a tsv file of data, with a few
	changes.
"""

import sys, csv, re, os
from io import BytesIO

# Open the source file.
with open('../Data/biotraits.txt', "rb") as tsv:
	
	# Decode it from utf-16 and encode it to utf-8.
	conv = tsv.read().decode('utf-16').encode('utf-8')
	
	# Open the output file for writing.
	resulting = open('../Results/biotraits_csv.csv', "w")

	FirstRow = True

	# Start reading the input file, row by row.
	for row in csv.reader(BytesIO(conv), dialect="excel-tab"):
		
		# Keep track of the number of the fields.
		counter = 0
		
		# Go through every field.
		for element in row:
			
			# Convert the element to a string.
			element = str(element)
			
			# Split 'Citations' to 3 new fields for the first line.
			if FirstRow and counter == 63:
				resulting.write('Citations,Author_Names,Publication_Date,Publication_Name,')
				FirstRow = False
			
			# If it's not the first line of the file...
			elif counter == 63:
				
				# Keep the old Citations column, by replacing ',' with '_'.
				oldColumn = re.sub(r',', '_', element)
				resulting.write(oldColumn)
				resulting.write(",")
				
				# Use a regular expression to capture different parts.
				hits = re.search(r"^(.+)\s(\d{4}\.)\s(.+)$", element)
				
				# Go through the 3 captured parts.
				for hit in xrange(1,4):
					
					# Separate authors with ';', instead of ','.
					if hit == 1:
						nocomma = re.sub(r'\s*(,|&)\s*', ';', hits.group(hit))
					
					# Substitute ',' with '_'.
					else:
						nocomma = re.sub(r',', '_', hits.group(hit))
						
					# Write to the output file.
					resulting.write(nocomma)
					
					# Write a comma to separate fields.
					resulting.write(",")
			
			# For all other fields...
			else:
				
				# Substitute commas with underscores.
				nocomma = re.sub(r',', '_', element)
				resulting.write(nocomma)
				resulting.write(',')
			
			# Increment the counter.
			counter += 1;
			
		# Remove the last comma of the line.
		resulting.seek(-1, os.SEEK_END)
		resulting.truncate()
		
		# Print a newline to the file.
		resulting.write("\n")

	# Close the output file.
	resulting.close()
