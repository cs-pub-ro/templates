TEXFILES = sample.tex
HIGHLIGHT_C_OPTS = -L -l -f -t 8 -K footnotesize -c highlight.sty

all: $(TEXFILES)

sample.tex: sample.c
	highlight $(HIGHLIGHT_C_OPTS) -i $< -o $@

.PHONY: clean
clean:
	rm -f $(TEXFILES) highlight.sty *~
