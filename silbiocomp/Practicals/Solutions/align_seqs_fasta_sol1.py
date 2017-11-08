#!/usr/bin/python

"""Creates a file showing the best alignment of the two sequences inputted"""

__author__ = 'Your Name (your.name@imperial.ac.uk)'
__version__ = '0.0.1'


import sys

#Take these 2 files as example:
#~ '../../Week1/Data/fasta/407228326.fasta'
#~ '../../Week1/Data/fasta/407228412.fasta'

# Prepare sequence1
sequence1 = open(sys.argv[1])
seq1 = []
for row in sequence1:
	seq1.append(row)
sequence1.close

seq1.pop(0) #remove first element
seq1 = ''.join(seq1) # amalgamate into one block
seq1 = seq1.replace("\n", "") #remove new lines
##### sequence1 is ready to go!

# Repeat for sequence2
sequence2 = open(sys.argv[2])
seq2 = []
for row in sequence2:
	seq2.append(row)
sequence2.close

seq2.pop(0)
seq2 = ''.join(seq2)
seq2 = seq2.replace("\n", "")
##### sequence 2 is ready to go!

# assign the longest sequence s1, and the shortest to s2
# l1 is the length of the longest, l2 that of the shortest

l1 = len(seq1)
l2 = len(seq2)
if l1 >= l2:
    s1 = seq1
    s2 = seq2
else:
    s1 = seq2
    s2 = seq1
    l1, l2 = l2, l1 # swap the two lengths

# function that computes a score
# by returning the number of matches 
# starting from arbitrary startpoint
def calculate_score(s1, s2, l1, l2, startpoint):
    # startpoint is the point at which we want to start
    matched = "" # contains string for alignement
    score = 0
    for i in range(l2):
        if (i + startpoint) < l1:
            # if its matching the character
            if s1[i + startpoint] == s2[i]:
                matched = matched + "*"
                score = score + 1
            else:
                matched = matched + "-"

    # build some formatted output
    print "." * startpoint + matched           
    print "." * startpoint + s2
    print s1
    print score 
    print ""

    return score

calculate_score(s1, s2, l1, l2, 0)
calculate_score(s1, s2, l1, l2, 1)
calculate_score(s1, s2, l1, l2, 5)

# now try to find the best match (highest score)
my_best_align = None
my_best_score = -1

for i in range(l1):
    z = calculate_score(s1, s2, l1, l2, i)
    if z > my_best_score:
        my_best_align = "." * i + s2
        my_best_score = z

print my_best_align
print s1
print "Best score:", my_best_score



###Need to do a sys output
f = open('../Results/best_alignment', 'w')
f.write("The two sequences are: \n" + seq2 + "\n" + seq1 + "\n\n" + "The alignment with the highest score is: \n" + my_best_align + "\n" + s1 + "\n" + "and the score for this alignment is: " + str(my_best_score))
f.close()
