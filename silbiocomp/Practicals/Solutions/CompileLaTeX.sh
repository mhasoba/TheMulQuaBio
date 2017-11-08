#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Needs the latex filename (without the *.tex extension) as input!"
    exit 1
fi

rm ../Results/$1.pdf # remove existing pdf

pdflatex -halt-on-error -output-directory ../Results $1.tex
bibtex $1
pdflatex -halt-on-error -output-directory ../Results $1.tex
pdflatex -halt-on-error -output-directory ../Results $1.tex
  

#Now open pdf if file exists and is non-empty
if [ -s ../Results/$1.pdf ] 
then
	evince ../Results/$1.pdf &
else
	echo "$1.pdf is empty!"
fi

## Cleanup
rm -f ../Results/*~
rm -f ../Results/*.aux
rm -f ../Results/*.blg
rm -f ../Results/*.log
rm -f ../Results/*.nav
rm -f ../Results/*.out
rm -f ../Results/*.snm
rm -f ../Results/*.toc
rm -f ../Results/*.vrb
rm -f ../Results/*.bbl
rm -f ../Results/*.dvi
rm -f ../Results/*.lot
rm -f ../Results/*.lof
