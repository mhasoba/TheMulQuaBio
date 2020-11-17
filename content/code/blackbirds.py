import re

# Read the file (using a different, more python 3 way, just for fun!)
with open('../data/blackbirds.txt', 'r') as f:
    text = f.read()

# replace \t's and \n's with a spaces:
text = text.replace('\t',' ')
text = text.replace('\n',' ')
# You may want to make other changes to the text. 

# In particular, note that there are "strange characters" (these are accents and
# non-ascii symbols) because we don't care for them, first transform to ASCII:

text = text.encode('ascii', 'ignore') # first encode into ascii bytes
text = text.decode('ascii', 'ignore') # Now decode back to string

# Now extend this script so that it captures the Kingdom, Phylum and Species
# name for each species and prints it out to screen neatly.

# Hint: you may want to use re.findall(my_reg, text)... Keep in mind that there
# are multiple ways to skin this cat! Your solution could involve multiple
# regular expression calls (slightly easier!), or a single one (slightly harder!)
# Here are some example outputs of possible solutions (These are not the only two ways to do this!): 
#
# Solution 1:
#
# ['Animalia', 'Chordata ', 'Euphagus carolinus']
# ['Animalia', 'Chordata ', 'Euphagus cyanocephalus']
# ['Animalia', 'Chordata ', 'Turdus boulboul']
# ['Animalia', 'Chordata ', 'Agelaius assimilis']
# ===============
# 
# Solution 2:
#
#  [('Animalia', 'Chordata', 'Euphagus carolinus'), ('Animalia', 'Chordata', 'Euphagus cyanocephalus'), ('Animalia', 'Chordata', 'Turdus boulboul'), ('Animalia', 'Chordata', 'Agelaius assimilis')]
# 