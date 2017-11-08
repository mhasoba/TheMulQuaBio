"""
	A script that populates lists with either list comprehension or
	conventional for loops.
"""


birds = ( ('Passerculus sandwichensis','Savannah sparrow',18.7),
          ('Delichon urbica','House martin',19),
          ('Junco phaeonotus','Yellow-eyed junco',19.5),
          ('Junco hyemalis','Dark-eyed junco',19.6),
          ('Tachycineata bicolor','Tree swallow',20.2),
         )

#(1) Write three separate list comprehensions that create three different
# lists containing the latin names, common names and mean body masses for
# each species in birds, respectively. Write the script here:

# Indicate that this is step 1.
print "Step #1:"

# Create the lists with list comprehension and display them.
LatinName = list([species[0] for species in birds])
print "Latin names:"
print LatinName

CommonName = list([species[1] for species in birds])
print "\nCommon names:"
print CommonName

MeanBodyMass = list([species[2] for species in birds])
print "\nMean body masses:"
print MeanBodyMass

#(2) Now do the same using conventional loops (you can choose to do this 
# before 1 !). 

## Write your script here:

# Indicate that this is step 2.
print "\nStep #2:"

# Create the three lists.
LatinName = []
CommonName = []
MeanBodyMass = []

# Use a for loop to insert entries to the lists.
for species in birds:
	LatinName.append(species[0])
	CommonName.append(species[1])
	MeanBodyMass.append(species[2])

# Print the results.
print "Latin names:"
print LatinName

print "\nCommon names:"
print CommonName

print "\nMean body masses:"
print MeanBodyMass
