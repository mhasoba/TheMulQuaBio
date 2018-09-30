#!/bin/bash

for f in *.tex; 
    do  
        echo "Converting $f"; 
        # convert -density 500 -resize 800 -background white -alpha remove "$f"  "$(basename "$f" .pdf).png";
        htlatex "$f" myconfig "xhtml, mathml, charset=utf-8" " -cunihtf -utf8";
    done
