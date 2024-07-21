.PHONY: default view pdf clean cleanall macros

default: pdf

pdf: macros
	latexmk -pdf

view: macros
	if [ -f "main.pdf" ]; then \
	  cp main.pdf backup.pdf; \
	  rm main.pdf; \
	fi
	latexmk -pdf -pv
	cp main.pdf backup.pdf

clean:
	latexmk -c

cleanall:
	latexmk -C

macros:
	git submodule update --init --recursive
	git submodule foreach git pull origin master
