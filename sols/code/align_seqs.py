#!/usr/bin/python

"""Takes the file sequences.csv in the sandbox which contains two 
sequences seperated by a comma and aligns the two sequences. The best 
alignment and it's corresponding score is saved in the file 
bestalignment.csv which is found in the results directory.  """

__author__ = 'Your Name (your.name@imperial.ac.uk)'
__version__= '0.0.1'

#import modules
import csv

# opens files with sequences and use csvread to easily manipulate file 
# as a csv file

csvread = csv.reader(open('../Sandbox/sequences.csv','rb'))

# extract first sequence and second sequence as two seperate objects
for row in csvread:
	seq1 = row[0]
	seq2 = row[1]


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
    print("." * startpoint + matched)
    print("." * startpoint + s2)
    print(s1)
    print(score)
    print("")

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
        
#opens result file and writes best alignment and best score into file
g = open('../Results/best_alignment.txt','wb')
g.write('best alignment: ' + my_best_align + '\n' + 'best score: ' + str(my_best_score))

g.close()
