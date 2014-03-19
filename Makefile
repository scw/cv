TEX := $(wildcard *.tex)
default: $(TEX:.tex=.pdf) text
%.pdf: %.tex
	latexmk -xelatex $<

.PHONY: clean
clean:
	rm -v *.aux *.log *.out *.fdb_latexmk *.txt *.pdf

.DELETE_ON_ERROR:

%.pdf %.aux %.idx: %.tex
	latexmk -xelatex $<
	while grep 'Rerun to get ' $*.log ; do latexmk -xelatex $< ; done

text:
	pandoc -o cv-scw.txt cv-scw.tex
