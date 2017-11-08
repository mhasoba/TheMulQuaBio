"""
	A script that uses a for loop to populate a dictionary.
"""
taxa = [ ('Myotis lucifugus','Chiroptera'),
         ('Gerbillus henleyi','Rodentia',),
         ('Peromyscus crinitus', 'Rodentia'),
         ('Mus domesticus', 'Rodentia'),
         ('Cleithrionomys rutilus', 'Rodentia'),
         ('Microgale dobsoni', 'Afrosoricida'),
         ('Microgale talazaci', 'Afrosoricida'),
         ('Lyacon pictus', 'Carnivora'),
         ('Arctocephalus gazella', 'Carnivora'),
         ('Canis lupus', 'Carnivora'), 
        ]

taxa_dic = {}

# write a short script to populate the dictionary taxa_dic 
# so that it maps order names to sets of taxa.
# E.g. 'Chiroptera' : set(['Myotis lucifugus']) etc.

## Write your script here:

# Using loops
for taxon in taxa:
	
    
	# If the dictionary key is already defined and is not "None":
	if taxon[1] in taxa_dic and not (taxa_dic[taxon[1]] is None):
		
		# Add the new species to the already existing set.
		taxa_dic[taxon[1]].add(taxon[0])
	else:
		
		# Otherwise, create a set with this species.
		taxa_dic[taxon[1]] = set([taxon[0]])
        
# Or use list comprehension!

for taxon in taxa:
	
    
	# If the dictionary key is already defined and is not "None":
	if taxon[1] in taxa_dic and not (taxa_dic[taxon[1]] is None):
		
		# Add the new species to the already existing set.
		taxa_dic[taxon[1]].add(taxon[0])
	else:
		
		# Otherwise, create a set with this species.
		taxa_dic[taxon[1]] = set([taxon[0]])

# Display the dictionary contents.
print "Dictionary contents:"
print taxa_dic
