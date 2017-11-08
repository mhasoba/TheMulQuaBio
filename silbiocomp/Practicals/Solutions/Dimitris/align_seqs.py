"""
	A script that reads two sequences from a csv file, aligns them
	and returns the best alignment's details.
"""

import csv
import pickle

# These are the two sequences to match
#seq2 = "ATCGCCGGATTACGGG"
#seq1 = "CAATTCGGAT"

def align_seqs(csvfile):
    """
    A function that aligns two input DNA sequences and retrieves the 
    best alignment.
    """

    # Open a csv file for reading.
    f = open(csvfile,'rb')
    sequences = csv.reader(f)
    
    # Open a file for output.
    g = open('../Results/best_alignment.p','wb')
    
    # Read the first row of the csv file
    # and store the sequences.
    for row in sequences:
		seq1 = row[0]
		seq2 = row[1]
    
    # Close the file.
    f.close()
    
    # assign the longest sequence 
    # to s1, and the shortest to s2
    # l1 is the length of the longest,
    # l2 that of the shortest
    l1 = len(seq1)
    l2 = len(seq2)
    if l1 >= l2:
	s1 = seq1
	s2 = seq2
    else:
	s1 = seq2
	s2 = seq1
	l1, l2 = l2, l1 # swap the two lengths
	
    # now try to find the best match (highest score)
    my_best_align = None
    my_best_score = -1

    for i in range(l1):
	z = calculate_score(s1, s2, l1, l2, i)
	if z > my_best_score:
	    my_best_align = "." * i + s2
	    my_best_score = z

    # Create a dictionary of the results.
    BestResult = {}
    
    # Store the best alignment.
    BestResult["alignment"] = my_best_align + "\n" + s1
    print "Best alignment:" + "\n" + BestResult["alignment"]
    
    # Store the score of the best alignment.
    BestResult["score"] = my_best_score
    print "\nBest score: " + str(BestResult["score"])

    # Dump the results to the output file and
    # close it.
    pickle.dump(BestResult, g)
    g.close()

    return BestResult

# function that computes a score
# by returning the number of matches 
# starting from arbitrary startpoint
def calculate_score(s1, s2, l1, l2, startpoint):
    """
    This function computes the score of the alignment.
    """
	
    # startpoint is the point at which we want to start
    matched = "" # contains string for alignement
    score = 0
    for i in range(l2):
        if (i + startpoint) < l1:
            # if it's matching the character
            if s1[i + startpoint] == s2[i]:
                matched = matched + "*"
                score = score + 1
            else:
                matched = matched + "-"
    return score

align_seqs("../Data/seqs.csv")
