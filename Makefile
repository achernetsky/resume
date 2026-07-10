PDFNAME = CV_Aliaksandr_Charnetski
EXTPDFNAME = CV_Aliaksandr_Charnetski_Extended
LATEXNAME = resume.tex
PDFLATEX = pdflatex
RM = rm -f

.PHONY: all short extended clean

all: short extended

short: $(PDFNAME).pdf

extended: $(EXTPDFNAME).pdf

# Two passes so hyperref/moderncv bookmarks resolve cleanly.
$(PDFNAME).pdf: $(LATEXNAME)
	$(PDFLATEX) -jobname=$(PDFNAME) $(LATEXNAME)
	$(PDFLATEX) -jobname=$(PDFNAME) $(LATEXNAME)

$(EXTPDFNAME).pdf: $(LATEXNAME)
	$(PDFLATEX) -jobname=$(EXTPDFNAME) "\def\EXTENDED{}\input{$(LATEXNAME)}"
	$(PDFLATEX) -jobname=$(EXTPDFNAME) "\def\EXTENDED{}\input{$(LATEXNAME)}"

clean:
	$(RM) *.aux *.log *.out *.fdb_latexmk *.fls *.synctex.gz $(PDFNAME).pdf $(EXTPDFNAME).pdf
