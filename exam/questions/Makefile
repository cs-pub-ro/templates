.PHONY: all
all: 5-code.tex

5-code.tex: 5-code.c
	highlight --style print -L -f -t 8 -K footnotesize -c highlight.sty -i $< -o $@
