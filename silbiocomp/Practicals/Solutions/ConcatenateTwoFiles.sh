#!/bin/bash
if [ "$#" -ne 3 ]; then
    echo "Needs three filenames (two files to be merged, and output filename) as inputs!"
    exit 1
fi
cat $1 > $3
cat $2 >> $3
echo "Merged File is:" $3
exit 0
