# HOWTO Geneating PDF from Sphinxdoc

Note: pandoc can natively create pdf. It also works with several makrdown formats like PHP Extra.

## Guides

* https://www.youtube.com/watch?v=MLsD0MWM3bQ
* https://vimalkvn.com/create-sphinx-pdf/

## Install Equired Packages

```bash
sudo apt install fonts-freefont-otf latexmk python3-venv \
texlive-fonts-recommended texlive-latex-recommended \
texlive-latex-extra texlive-lang-greek \
tex-gyre texlive-xetex
```

## Generate PDF File

```bash
make latexpdf
```
