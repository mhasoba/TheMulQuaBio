#!/bin/bash
cat $1 > $3
cat $2 >> $3
echo "Merged File is"
cat $3
