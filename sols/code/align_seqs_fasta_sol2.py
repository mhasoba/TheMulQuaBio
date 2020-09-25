#!usr/bin/python

"""This module contains functions that are used for DNA sequence alignment calculations. There are functions used to convert .csv, .fasta and .txt files containing DNA sequences into output that can then be used by the other module's functions to calculate sequence alignment results.

Please be sure to read the descriptions of the required formatting of input files in the get_seqs_func functions for each of the corresponding input file types. The results may be inaccurate if the input files are formatted differently from the description."""
	
__author__ = 'Katie Hindson (kah15@ic.ac.uk)'
__version__ = '0.0.1'

import csv
import sys
import re	
import os

def csv_get_seqs_func(csv_filename):
	
	"""Takes a .csv file as input formatted to contain one DNA sequence as a single comma separated value and returns the sequence in  format easily inputted into align_seqs_func."""

	data = csv.reader(open(csv_filename, 'rb'))
	for row in data:
		csv_seq = row[0] # assign seq to be the first entry in the csv file
	return csv_seq # this returns the csv sequence
	csv_filename.close()
	

def fasta_get_seqs_func(fasta_filename):
	
	"""Takes a .fasta file (without any special formatting) as input. Strips the header and the whitespace within the file and returns the cleaned up sequence."""
	
	# this opens the fasta file, removes the header using readlines[1:], then instead of making a list with each line as an entry, it joins the read lines with a '' delimiter (i.e. no character delimiter). Then, using splitlines(), the new line characters after each line are removed, then these lines are joined again by a '' delimiter. This output is set to the fasta_seq1 variable.
	
	with open(fasta_filename, 'rb') as f:  
		fasta_seq = "".join("".join(f.readlines()[1:]).splitlines())
	
	
	##test to see if the code actually worked and the output was without a header or new lines
	#with open('../Results/fasta_sequences.txt','w') as fastachanges: 
	#	print >> fastachanges, fasta_seq   
	
		
	return fasta_seq

def txt_get_seqs_func(txt_filename):
	
	"""Takes a .txt files as input with the format of a DNA sequence starting at the first line of the file. There is no need to format the sequence so that it's only on one line, or to remove characters that are not part of the sequence; the code will correct for this.
	
	CAUTION: if using .txt files that have 'unknown bp' characters (ex. K, W in .fasta files) you must be sure to add these characters to the character exception lists on line 53 or else they will be removed and you will be misaligning your sequences."""
	
	with open(txt_filename, 'rb') as t:
		txt_seq_removelines = "".join("".join(t.readlines()).splitlines()) # removes new lines if there are any
	
	txt_seq = re.sub("[^ATGC]+", "", txt_seq_removelines) #removes any characters in the file that are not ATGC
		
	##test to see if the code actually worked and the output was what without any extra characters or new lines
	#with open('../Results/txt_sequences.txt','w') as txtchanges: 
		#print >> txtchanges, txt_seq1   
	
	return (txt_seq)
		
def align_seqs_func(seq1, seq2):
	
	"""This is a function composed of sub functions which, when run, finds the best alignment of two input DNA sequences, returns the best alignment results and records them in the bestalignment.txt file."""
		
	#this assigns the longest sequence of the two input sequences to the variable, s1 with length, l1 and the shortest sequence of the two input sequences to the variable, s2 with length, l2
	
	l1 = len(seq1)
	l2 = len(seq2)
	if l1 >= l2:
		s1 = seq1
		s2 = seq2
	else:
		s1 = seq2
		s2 = seq1
		l1, l2 = l2, l1 # swap the two lengths

	def calculate_score(s1, s2, l1, l2, startpoint):
		
		"""This function calculates the match score for the number of characters matched in the alignment between the two strings with the shorter of the two being aligned starting at some startpoint integer input. It also prints the resulting match."""
		
		# startpoint is the point at which we want to start
		matched = "" # contains string for alignement...is an empty string that will be filled with match symbols
		score = 0 # initializing a score variable
		for i in range(l2): # for the range of the shorter sequence
			if (i + startpoint) < l1:  # so long as the startpoint is before the last character in the seq1, run this, otherwise, exit
				if s1[i + startpoint] == s2[i]: # if the character that your counter is at is a matching character in the two sequences then:
					matched = matched + "*" # add a value of * to the string 'matched' at that character's position
					score = score + 1 # and add 1 to the score 
				else:
					matched = matched + "-" # otherwise add a value of - to the string 'matched' at that character's position

		# build some formatted output
		
		# removed the output into terminal from align_seqs.py because I didn't like it printing every match sequence in the terminal window...especially if the sequences were long

		return (score, matched)

	# now try to find the best match (highest score)
	my_best_align_sequence = None # initializes a value for the best alignment string value
	my_best_align_matches = None
	my_best_score = -1 # initializes a value for the best score value...must be -1 and not 0 because if we get a 0 score as the best alignment, then we want my_best_align to be assigned a value, not just kept empty...this will happen if we set it to be -1, because the lowest score we can get is 0

	for i in range(l1): # for every possible startpoint on s1, run through this loop
		(z, y) = calculate_score(s1, s2, l1, l2, i) # run the calculate_score function for each startpoint along s1
		if z > my_best_score: # if the output score from running the above line is greater than the current highest score being stored, then replace the current alignment being stored with the alignment that is being run through in the current iteration
			my_best_align_matches = "".join(("." * i + y).splitlines())
			# this saves the 'matched' output string information from the calculate_score function for the best alignment match. This means that it can later be printed above the best alignment sequence so that the matching characters' disctribution can be easily visualized. 
			my_best_align_sequence = "." * i + s2
			my_best_score = z


	with open('../Results/bestalignment.txt','a') as bestalignment: # opens nd appends a file with the listed outputs in the Results folder and using 'with' also closes it automatically
		print >> bestalignment, "Best alignment information for the input sequences: "
		print >> bestalignment, my_best_align_matches 
		print >> bestalignment, my_best_align_sequence # print the best alignment of s2 on s1
		print >> bestalignment, s1 
		print >> bestalignment, "Best score:" + str(my_best_score)

def main(argv):
	
	# takes user input and aligns DNA sequences based on selected input files
	
	print "For DNA alignment, if you would like to run the program using default inputs, please press 'd' then 'enter'. /n If you would like to run the program using your own files, you can use a combination of two files that are of .csv, .txt or .fasta types. Please enter the first file type you would like to use for the DNA sequence alignment ['csv', 'txt' or 'fasta'] and press enter: "
	file1type = raw_input()
	
	if file1type == "d":	
		align_seqs_func(fasta_get_seqs_func('../Data/FASTAfiles/407228326.fasta'), fasta_get_seqs_func('../Data/FASTAfiles/407228412.fasta'))
		print "The default sequences have been aligned! Please see the results appended to the file called 'bestalignment.txt' in the Results folder."
		
	else: 
		while file1type not in ["csv", "txt", "fasta"]: # if the user doesn't enter csv, txt or fasta, then they are prompted to keep choosing until they've entered one of the valid options
			print "I'm sorry, what you entered is not an option. Please select either 'csv', 'txt' or 'fasta' and press enter: "
			file1type = raw_input()
		
		print "Please enter the path of the file you would like to use and press enter: "
		filepath1 = raw_input()
			
		#  if the file path that the user entered does not exist, then the below is prompted until a valid filetype is entered, in which case, element = True
			
		element = False
		while element == False: 
			if not os.path.exists(filepath1): 
				print "I'm sorry, I did not find the file at, " + str(filepath1)
				print "Please enter the path of the file again: "
				filepath1 = raw_input()
			else:
				element = True
			
		print "Please enter the second file type you would like to use for the DNA sequence alignment ['csv', 'txt' or 'fasta'] and press enter: "
		file2type = raw_input()
		
		while file2type not in ["csv", "txt", "fasta"]: 
			print "I'm sorry, what you entered is not an option. Please select either 'csv', 'txt' or 'fasta' and press enter: "
			file2type = raw_input()
			
		print "Please enter the path of the second file you would like to use and press enter: "
		filepath2 = raw_input()
					
		element = False
		while element == False:
			if not os.path.exists(filepath2): 
				print "I'm sorry, I did not find the file at, " + str(filepath2)
				print "Please enter the path of the file again: "
				filepath2 = raw_input()
			else:
				element = True
			
		if file1type == "txt" and file2type == "txt":
			align_seqs_func(txt_get_seqs_func(filepath1), txt_get_seqs_func(filepath2))
		elif file1type == "txt" and file2type == "fasta":
			align_seqs_func(txt_get_seqs_func(filepath1), fasta_get_seqs_func(filepath2))
		elif file1type == "txt" and file2type == "csv":
			align_seqs_func(txt_get_seqs_func(filepath1), csv_get_seqs_func(filepath2))
		elif file1type == "fasta" and file2type == "txt":
			align_seqs_func(fasta_get_seqs_func(filepath1), txt_get_seqs_func(filepath2))	
		elif file1type == "fasta" and file2type == "fasta":
			align_seqs_func(fasta_get_seqs_func(filepath1), fasta_get_seqs_func(filepath2))
		elif file1type == "fasta" and file2type == "csv":
			align_seqs_func(fasta_get_seqs_func(filepath1), csv_get_seqs_func(filepath2))
		elif file1type == "csv" and file2type == "csv":
			align_seqs_func(csv_get_seqs_func(filepath1), csv_get_seqs_func(filepath2))
		elif file1type == "csv" and file2type == "fasta":
			align_seqs_func(csv_get_seqs_func(filepath1), fasta_get_seqs_func(filepath2))
		elif file1type == "csv" and file2type == "txt":
			align_seqs_func(csv_get_seqs_func(filepath1), txt_get_seqs_func(filepath2))
		
			
		print "Your sequences have been aligned! Please see the results appended to the file called 'bestalignment.txt' in the Results folder."

	##testing the functions for some default .csv, .txt and .fasta files
	
	#align_seqs_func(*csv_get_seqs_func('../Sandbox/sequences.csv')) 
	
	#align_seqs_func(fasta_get_seqs_func('../Data/FASTAfiles/407228326.fasta'), fasta_get_seqs_func('../Data/FASTAfiles/407228412.fasta'))
	
	#align_seqs_func(txt_get_seqs_func('../Sandbox/first.txt'), txt_get_seqs_func('../Sandbox/second.txt'))
	
	#align_seqs_func(fasta_get_seqs_func('../Data/FASTAfiles/407228326.fasta'), txt_get_seqs_func('../Sandbox/second.txt'))
	
	return 0
	
if (__name__=="__main__") : 
	status = main(sys.argv)
	sys.exit(status)
	
