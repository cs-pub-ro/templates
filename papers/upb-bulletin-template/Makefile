BASENAME = paper
PDF = $(addsuffix .pdf, $(BASENAME))
DVI = $(addsuffix .dvi, $(BASENAME))
TEX = $(addsuffix .tex, $(BASENAME))
BIB = $(addsuffix .bib, $(BASENAME))
IMG = $(patsubst img/%.dia, img/%.pdf, $(wildcard img/*.dia))
LATEX = latex
PDFLATEX = pdflatex
BIBTEX = bibtex
DIA = dia
EPSTOPDF = epstopdf

.PHONY: all clean $(PDF)

all: $(PDF)

$(DVI): $(TEX) $(BIB) src/ $(IMG)
	$(LATEX) $<
	$(BIBTEX) $(BASENAME)
	# Twice, so TOC is also updated
	$(LATEX) $<
	$(LATEX) $<

$(PDF): $(TEX) $(BIB) src/ $(IMG)
	$(PDFLATEX) $<
	$(BIBTEX) $(BASENAME)
	# Twice, so TOC is also updated
	$(PDFLATEX) $<
	$(PDFLATEX) $<

img/%.eps: img/%.dia
	$(DIA) -e $@ $<

img/%.pdf: img/%.eps
	$(EPSTOPDF) $<

clean:
	-rm -f *~ *.aux *.log *.blg *.bbl *.out
	-rm -f src/*.aux
