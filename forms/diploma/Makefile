BASENAME = fisa-diploma
PDF = $(addsuffix .pdf, $(BASENAME))
DVI = $(addsuffix .dvi, $(BASENAME))
TEX = $(addsuffix .tex, $(BASENAME))
LATEX = latex
PDFLATEX = pdflatex

.PHONY: all clean

all: $(PDF)

$(DVI): $(TEX)
	$(LATEX) $<
	# Twice, so TOC is also updated
	$(LATEX) $<

$(PDF): $(TEX)
	$(PDFLATEX) $<
	# Twice, so TOC is also updated
	$(PDFLATEX) $<

clean:
	-rm -f *~ *.aux *.log *.blg *.bbl *.out
