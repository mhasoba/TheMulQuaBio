"""
	A script that iterates over a tuple of tuples, using a for loop
	to print specific elements.
"""

birds = ( ('Passerculus sandwichensis','Savannah sparrow',18.7),
          ('Delichon urbica','House martin',19),
          ('Junco phaeonotus','Yellow-eyed junco',19.5),
          ('Junco hyemalis','Dark-eyed junco',19.6),
          ('Tachycineata bicolor','Tree swallow',20.2),
        )

# Birds is a tuple of tuples of length three: latin name, common name, mass.
# write a (short) script to print these on a separate line for each species
# Hint: use the "print" command! You can use list comprehension!

# Use a for loop to go through each species.
for bird in birds: 
	# Print the latin name, common name and mass in separate lines.
	print("Latin name: %s" % bird[0])
	print("Common name: %s" % bird[1])
	print("Mass: %.1f\n" % bird[2])
