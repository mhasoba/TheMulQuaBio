#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Needs one file name as input!"
    exit 1
fi
NumLines=`wc -l < $1`
echo "The file $1 has $NumLines lines"
echo
exit 0
