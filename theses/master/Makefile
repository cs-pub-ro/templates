# too many dependencies, marking targets as .PHONY
# to be revised in the future

PDFLATEX = pdflatex
BIBTEX = bibtex
MAKEINDEX = makeindex

BASENAME = thesis
PDF = $(addsuffix .pdf, $(BASENAME))
TEX = $(addsuffix .tex, $(BASENAME))
IDX = $(addsuffix .idx, $(BASENAME))
NLO = $(addsuffix .nlo, $(BASENAME))
NLS = $(addsuffix .nls, $(BASENAME))
IST = nomencl.ist
EXTRA_EXTENSIONS = .aux .log .lof .lot .bbl .out .toc .idx .ind .ilg \
		   .nlo .nls .blg
CLEAN_FILES = $(addprefix $(BASENAME), $(EXTRA_EXTENSIONS))

.PHONY: all

all: $(PDF) clean-tmp

.PHONY: $(PDF)
$(PDF):
	$(PDFLATEX) -interaction=scrollmode --src-specials $(TEX)
	$(BIBTEX) $(BASENAME)
#	$(MAKEINDEX) $(NLO) -s $(IST) -o $(NLS)
	$(PDFLATEX) -interaction=scrollmode --src-specials $(BASENAME)
#	$(MAKEINDEX) $(IDX)
	@echo; echo; echo
	@echo "****************************************************"
	@echo "***** Ignore errors above. Check errors below. *****"
	@echo
	$(PDFLATEX) -interaction=scrollmode --src-specials $(BASENAME)

.PHONY: clean-tmp
clean-tmp:
	-rm -f $(CLEAN_FILES)
	-find . -name "*.aux" -exec rm -f {} \;
	-find . -name "*~" -exec rm -f {} \;

.PHONY: clean
clean: clean-tmp
	-rm -f $(PDF)
