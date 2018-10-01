theme = theme/physt-white.css
highlighttheme = idea
themeoptions = --theme $(theme) --highlight-theme $(highlighttheme) --css fonts/fontawesome/fontawesome.css

all: notebook static  # print

static: slides-diana.md background.png
	rm -rf docs
	reveal-md slides-diana.md --static build $(themeoptions)
	cp -r theme build
	cp *png build
	cp *svg build
	cp -r fonts build
	mv build docs

notebook:
	jupyter nbconvert --execute code/talk.ipynb

print: slides-diana.md background.png
	reveal-md slides-diana.md --port 1989 --print slides.pdf $(themeoptions)

present: background.png
	reveal-md . --disable-auto-open $(themeoptions) -w

background.png: backgrounds.py
	python backgrounds.py
