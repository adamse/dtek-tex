default: install

installdir = $(shell kpsewhich --var-value TEXMFHOME)/tex/latex/dtek

install:
	mkdir -p $(installdir)
	cp dtek.cls dtekprotokoll.cls dtekkallelse.cls dteklogo.pdf $(installdir)
