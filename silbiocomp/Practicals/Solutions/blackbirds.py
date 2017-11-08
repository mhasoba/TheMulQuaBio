import re

# Read the file
f = open('../Data/blackbirds.txt', 'r')
text = f.read()
f.close()

#################### Solution 1 #########################

# remove \t\n and put a space in
text = text.replace('\t',' ')
text = text.replace('Taxonomic Hierarchy', ' ')
tmp = text.replace('\n',' ').split('Kingdom ')
tmp.pop(0)

# note that there are "strange characters" (these are accents and
# non-ascii symbols) because we don't care for them, first transform
# to ASCII.

# Now write a regular expression my_reg that captures # the Kingdom, 
# Phylum and Species name for each species and prints it out neatly:

# my_reg = ??????

# Hint: you will probably want to use re.findall(my_reg, text)...
# Keep in mind that there are multiple ways to skin this cat!

for n in tmp:
	kingdom = re.findall(r'^\w*', n)
	phylum = re.findall(r'(?<=Phylum\s)\w*\s', n)
	species = re.findall(r'(?<=Species\s)\w*\s\w*', n)
	print(kingdom + phylum + species)

#################### Solution 2 #########################

# remove \t\n and put a space in
text_strip = ' '.join(re.sub(r'\n|\t', ' ', text).split())

# note that there are "strange characters" (these are accents and
# non-ascii symbols) because we don't care for them, let's transform
# to ASCII
#text = text.decode('ascii', 'ignore')

## Now write a regular expression that captures 
## the Kingdom, Phylum and Species name for each species

#y_reg = ??????

full_match = re.findall(r'(?<=\bKingdom\s)\w+\b|(?<=\bPhylum\s)\w+\b|(?<=\bSpecies\s)\w+\s\w+\b', text_strip)

#~ full_match2 = re.findall(r'((?<=\b(Kingdom|Phylum|Species)\s)\w+\b)', text_strip)

ans = []
for l in range(0, len(full_match), 3):
	spp = tuple()
	for i in range(3):
		spp += (full_match[i+l],)
	ans.append(spp)

print(ans)

#################### Solution 3 #########################


# remove \t\n and put a space in
text = text.replace('\t',' ')
text = text.replace('\n',' ')

# note that there are "strange characters" (these are accents and
# non-ascii symbols) because we don't care for them, let's transform
# to ASCII
text = text.decode('ascii', 'ignore')

## Now write a regular expression that captures 
## the Kingdom, Phylum and Species name for each species

my_reg = re.findall(r'(?<=Kingdom)\s\w+|(?<=Phylum)\s\w+|(?<=Species)\s\w+\s\w+', text)
a = my_reg.splitlines( 3=string.count('\n'));
print a

