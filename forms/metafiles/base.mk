PDF = $(addsuffix .pdf, $(BASENAME))
TEX = $(addsuffix .tex, $(BASENAME))
PDFLATEX = pdflatex
STY_DIR = ../sty/

.PHONY: all clean

all: $(PDF)

$(PDF): $(TEX)
	TEXINPUTS=$(STY_DIR)//: $(PDFLATEX) $<
	# Twice, so TOC is also updated
	TEXINPUTS=$(STY_DIR)//: $(PDFLATEX) $<

clean:
	-rm -f *~ *.aux *.log *.blg *.bbl *.out
