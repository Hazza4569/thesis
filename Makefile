LATEX    = latex
BIBTEX   = bibtex
DVIPS    = dvips

BASENAME = thesis

default: figures pdflatex

latex:
	latex  ${BASENAME}
	latex  ${BASENAME}
	bibtex ${BASENAME}
	latex  ${BASENAME}
	latex  ${BASENAME}
	dvipdf -sPAPERSIZE=a4 -dPDFSETTINGS=/prepress ${BASENAME}

pdflatex:
	pdflatex  ${BASENAME}
	pdflatex  ${BASENAME}
	bibtex    ${BASENAME}
	pdflatex  ${BASENAME}
	pdflatex  ${BASENAME}
	./doWordCount.sh

# convert eps to pdf
EPSFILE=$(wildcard  *.eps)
EPSFILE+=$(wildcard fig/*.eps)
EPSFILE+=$(wildcard fig/*/*.eps)
EPSFILE+=$(wildcard fig/*/*/*.eps)
EPSFILE+=$(wildcard fig/*/*/*/*.eps)
EPSFILE+=$(wildcard fig/*/*/*/*/*.eps)
PDFFILE=$(patsubst %.eps, %.pdf, $(EPSFILE))

figures:$(PDFFILE)
$(PDFFILE): %.pdf: %.eps 
	epstopdf $<

%.dvi:	%.tex 
	$(LATEX) $<

%.bbl:	%.tex *.bib
	$(LATEX) $*
	$(BIBTEX) $*

%.ps:	%.dvi
	$(DVIPS) $< -o $@

%.pdf:	%.tex
	$(PDFLATEX) $<

.PHONY: clean

#clean commands
clean:
	rm -f *.aux *.log *.bbl *.blg *.brf *.cb *.ind *.idx *.ilg  \
	      *.inx *.dvi *.toc *.out *~ ~* *.cb2 *.lof *.lot \
