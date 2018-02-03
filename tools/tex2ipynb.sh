#!/bin/bash

# Requires notedown (intall using sudo pip install)
for f in *.tex; 
    do  
        echo "Converting $f"; 
        # convert -density 500 -resize 800 -background white -alpha remove "$f"  "$(basename "$f" .pdf).png";
        pandoc "$f" -o "$(basename "$f" .tex).md"
        f="$(basename "$f" .tex).md"
        notedown "$f" > "$(basename "$f" .md).ipynb"
    done

rm -f {*~,*.md}