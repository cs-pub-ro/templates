TEXFILES = sample.tex

ifeq (3, $(shell highlight --version | head -2 | tail -1 | rev | cut -d ' ' -f 1 | rev | cut -d '.' -f 1))
	GENERIC_HIGHLIGHT_OPTS = -O latex -l -f -t 8 -K footnotesize -c highlight.sty
	C_HIGHLIGHT_OPTS = -O latex -l -f -t 8 -K footnotesize -c highlight.sty
	MK_HIGHLIGHT_OPTS = -O latex -l -f -t 8 -K footnotesize -S Make -c highlight.sty
	BASH_HIGHLIGHT_OPTS = -O latex -l -f -t 8 -K footnotesize -S Bash -c highlight.sty
else
	GENERIC_HIGHLIGHT_OPTS = -L -l -f -t 8 -K footnotesize -c highlight.sty
	C_HIGHLIGHT_OPTS = -L -l -f -t 8 -K footnotesize -c highlight.sty
	MK_HIGHLIGHT_OPTS = -L -l -f -t 8 -K footnotesize -S Make -c highlight.sty
	BASH_HIGHLIGHT_OPTS = -L -l -f -t 8 -K footnotesize -S Bash -c highlight.sty
endif


all: $(TEXFILES)

sample.tex: sample.c
	highlight $(C_HIGHLIGHT_OPTS) -i $< -o $@

.PHONY: clean
clean:
	rm -f $(TEXFILES) highlight.sty *~
