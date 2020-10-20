#!/bin/bash
echo $#
if [[ -d $1 ]]
then
   echo $1
   cd $DIR
   for f in *.tif
      do
         echo "Converting $f";
         convert "$f" "$(basename "$f" .tif).png";
      done
else
   echo "no directory provided"
   exit
fi