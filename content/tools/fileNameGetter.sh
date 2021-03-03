#!/bin/bash
# Prints the name of every file in a dir
# Made primarily to speed up making Feedback.py find expected files
# file name getter 


#search_dir = $1
#search_dir = "~/Documents/CMEE_Marking_2021/CMEE_Repos_2020-21/AmishaSurajBhojwani_ab2420/Week3/Code"
for entry in "$search_dir"/*
do
  echo "$entry"
done
