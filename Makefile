PROCESSOR=xsltproc
MASTERSTYLE=bookinfo.xsl
BOOKFILE=bookinfo.xml

html:
	$(PROCESSOR) $(MASTERSTYLE) $(BOOKFILE) > index.html

pdf:
	- echo 'Not implemented'

clean:
	rm *.html

all: html

