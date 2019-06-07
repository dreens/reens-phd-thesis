full:
	make draft
	pdflatex reens-full
	bibtex reens-full || true
	pdflatex reens-full
	make figs
	pdflatex reens-full
	open -a TexShop reens-full.pdf

int:
	make draft
	pdflatex introduction
	bibtex introduction || true
	pdflatex introduction
	make figs
	pdflatex introduction
	open -a TexShop introduction.pdf

back:
	make draft
	pdflatex background
	bibtex background || true
	pdflatex background
	make figs
	pdflatex background
	open -a TexShop background.pdf

sourc:
	make draft 
	pdflatex sourcing
	bibtex sourcing || true
	pdflatex sourcing
	make figs
	pdflatex sourcing
	open -a TexShop sourcing.pdf

skim:
	make draft
	pdflatex skimming
	bibtex skimming || true
	pdflatex skimming
	make figs
	pdflatex skimming
	open -a TexShop skimming.pdf

focus:
	make draft
	pdflatex focusing
	bibtex focusing || true
	pdflatex focusing
	make figs
	pdflatex focusing
	open -a TexShop focusing.pdf

slow:
	make draft
	pdflatex slowing
	bibtex slowing || true
	pdflatex slowing
	make figs
	pdflatex slowing
	open -a TexShop slowing.pdf

trap:
	make draft
	pdflatex trapping
	bibtex trapping || true
	pdflatex trapping
	make figs
	pdflatex trapping
	open -a TexShop trapping.pdf

col:
	make draft
	pdflatex colliding
	bibtex colliding || true
	pdflatex colliding
	make figs
	pdflatex colliding
	open -a TexShop colliding.pdf

draft:
	cp chappreambleD.tex chappreamble.tex

figs:
	cp chappreambleF.tex chappreamble.tex

supp:
	pdflatex ${sname}
	bibtex ${sname}||true
	pdflatex ${sname}
	pdflatex ${sname}
	open -a TexShop ${sname}.pdf

clean:
	rm -f *.{ps,pdf,log,aux,out,dvi,bbl,blg,brf,lof,lot,toc}

all:
	make clean
#	make figs
	make pdf
	make supp
	make diff
