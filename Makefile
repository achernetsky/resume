PDFNAME = CV_Aliaksandr_Charnetski
LATEXNAME = resume.tex
PDFLATEX = pdflatex
RM = rm -f

all: $(PDFNAME).pdf

$(PDFNAME).pdf: $(LATEXNAME)
	$(PDFLATEX) $(LATEXNAME)
	mv $(basename $(LATEXNAME)).pdf $(PDFNAME).pdf

.PHONY: clean
clean:
	$(RM) *.aux *.log *.out *.fdb_latexmk *.fls *.synctex.gz $(PDFNAME).pdf
