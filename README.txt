$Id: README.txt,v 1.1 2004/06/23 12:59:09 rsvato Exp $
OVERVIEW

This is russian translation of OCaml User Guide and
Reference

NOTE
Files in package can use Windows-1251 and UTF-8 as source
encoding. KOI8-R support also may occur :)


BUILD INSTRUCTIONS

Currently xsltproc should work for xml -> html transformation.

Transformation itself runs as follows:
	
$ make

To get PDF version of user documentation you can use any
XSLT 1.0/1.1/2.0 comliant transformer and some FO processor
(passiveTeX will be the only choice for now). Stylesheet to use
ocaml-book-fo.xsl

LAYOUT

core.dtd					- Document type definition for chapter type
bookinfo.dtd			- Document type definition for book type
bookinfo.xml			- Main xml file
chapter??.xml			- Chapters translation
bookinfo.xsl			- Main HTML template
ocaml.xsl					- Chapter HTML template
ocaml.css					- Incomplete CSS file for Morphon editor
chapter-fo.xsl		- Mail FO template
ocaml-book-fo.xsl	- Book elements level FO template
ocaml-toc-fo.xsl	- FO template generating tabl pof contents
chapter-section-fo.xsl	- FO template for section level elements
chapter-numbering.xsl	- Section numbering
ocaml-list.xsl		- List-like elements
ocaml-bnf-fo.xsl	- BNF-like notations
ocaml-inline-elements-fo.xsl	- Inline formatting
ocaml-block-elements-fo.xsl	- Block elements
ocaml-code-fo.xsl	-	Code formatting

All your suggestions/blames/bugfixes you can send dicrectly
to me, Sviatoslav Reentenko <svr69@mail.ru> or to any of sites
supporting this translation. I know only http://ocaml.spb.ru
and http://www.sourceforge.net/projects/camlru. If you knows
other, please, share your knownledge with me :)
