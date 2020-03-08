"""
	A script that populates lists either with list comprehension or
	conventional for loops, according to specific criteria.
"""

# Average UK Rainfall (mm) for 1910 by month
# http://www.metoffice.gov.uk/climate/uk/datasets
rainfall = (('JAN',111.4),
            ('FEB',126.1),
            ('MAR', 49.9),
            ('APR', 95.3),
            ('MAY', 71.8),
            ('JUN', 70.2),
            ('JUL', 97.1),
            ('AUG',140.2),
            ('SEP', 27.0),
            ('OCT', 89.4),
            ('NOV',128.4),
            ('DEC',142.2),
           )

# (1) Use a list comprehension to create a list of month,rainfall tuples where
# the amount of rain was greater than 100 mm.
 
## Write your script here:

# Indicate that this is step 1.
print("Step #1:")

# Create and display the list with list comprehension.
Greaterthan100mm = list([entry for entry in rainfall if entry[1] > 100])
print("Months and rainfall values when the amount of rain was greater than 100mm:")
print(Greaterthan100mm)

# (2) Use a list comprehension to create a list of just month names where the
# amount of rain was less than 50 mm. 

## Write your script here:

# Indicate that this is step 2.
print("\nStep #2:")

# Create the list with list comprehension and display it.
Lessthan50mm = list([entry[0] for entry in rainfall if entry[1] < 50])
print("Months when the amount of rain was less than 50mm:")
print(Lessthan50mm)

# (3) Now do (1) and (2) using conventional loops (you can choose to do 
# this before 1 and 2 !). 

## Write your script here:

# Indicate that this is step 3.
print("\nStep #3:")

# Create the two lists.
Greaterthan100mm = []
Lessthan50mm = []

# Use a for loop to insert entries to the lists.
for entry in rainfall:
	if entry[1] > 100: # amount of rain is greater than 100 mm
		Greaterthan100mm.append(entry)
	elif entry[1] < 50: # amount of rain is less than 50 mm
		Lessthan50mm.append(entry[0])

print("Months and rainfall values when the amount of rain was greater than 100mm:")
print(Greaterthan100mm)

print("\nMonths when the amount of rain was less than 50mm:")
print(Lessthan50mm)
