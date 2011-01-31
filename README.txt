OVERVIEW
=========

This is russian translation of OCaml User Guide and
Reference

NOTE
----------
Files in package can use Windows-1251 and UTF-8 as source
encoding (but it'unlike). KOI8-R support also may occur :)


BUILD INSTRUCTIONS
==================

Currently xsltproc should work for xml -> html transformation.

Transformation itself runs as follows:
	
$ make

To get PDF version of user documentation you can use any
XSLT 1.0/1.1/2.0 comliant transformer and some FO processor
(passiveTeX will be the only choice for now). Stylesheet to use
is chapter-fo.xsl

LAYOUT
========

core.dtd			 - Document type definition for chapter type
bookinfo.dtd		 - Document type definition for book type
bookinfo.xml		 - Main xml file
chapter??.xml		 - Chapters translation
bookinfo.xsl		 - Main HTML template
ocaml.xsl			 - Chapter HTML template
ocaml.css			 - Incomplete CSS file for Morphon editor
chapter-fo.xsl		 - Mail FO template
ocaml-book-fo.xsl	 - Book elements level FO template
ocaml-toc-fo.xsl	         - FO template generating tabl pof contents
chapter-section-fo.xsl	 - FO template for section level elements
chapter-numbering.xsl - Section numbering
ocaml-list.xsl		- List-like elements
ocaml-bnf-fo.xsl	        - BNF-like notations
ocaml-inline-elements-fo.xsl	- Inline formatting
ocaml-block-elements-fo.xsl	- Block elements
ocaml-code-fo.xsl	- Code formatting

Final notes
-----------------

All your suggestions/blames/bugfixes you can send directly to me, Sviatoslav Reentenko <rsvato@gmail.com> or post directly with github instruments. The only site containing more or less up-to-date html version of this translation is http://ocaml.spb.ru. Hosting costs, so, if you want to support it, don't hesitate to contact me.

If you want to fix my errors, clone this, sent me pull request and I'll say you 'thanks'.
