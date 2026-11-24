LATEX = xelatex
TEX   = term-paper

all: $(TEX).pdf

$(TEX).pdf: $(TEX).tex logo.png
	$(LATEX) -interaction=nonstopmode -halt-on-error $(TEX).tex
	$(LATEX) -interaction=nonstopmode -halt-on-error $(TEX).tex

clean:
	rm -f *.aux *.log *.out *.toc *.fls *.fdb_latexmk *.synctex.gz

.PHONY: all clean
