#!/bin/bash
# Author: Your Name your.name@imperial.ac.uk
# Script: csvtospace.sh
# Desc: substitute the commas in the file with spaces
#       saves the output into a .space file
# Arguments: 1-> comma delimited file
# Date: Oct 2014

echo "Creating a space delimited version of $1"

cat $1 | tr -s "," " " >> $1.space

exit

