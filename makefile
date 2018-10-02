#
# Build a PDF with all the notebooks 
#
TEMPLATE=chapter
NOTEBOOKS=00-Intro.ipynb \
          01-Unix.ipynb \
		  # etc - TODO

LATEXFILES=$(NOTEBOOKS:.ipynb=.tex)

.ipynb.tex:
	jupyter nbconvert --to latex --template $(TEMPLATE) $<

all: latexfiles buildpdf

latexfiles:
	for notebook in $(NOTEBOOKS) ; do \
		jupyter nbconvert --to latex --template $(TEMPLATE) $$notebook ; \
	done

buildpdf: latexfiles
	pdflatex SilBioComp.tex
    
