Overview
=========

This is russian translation of OCaml User Guide and
Reference

Note
----------
Files in package can use Windows-1251 and UTF-8 as source
encoding (but it'unlike). KOI8-R support also may occur :)


Building instructions
==================

Currently xsltproc should work for xml -> html transformation.

Transformation itself runs as follows:

<pre>
$ make
</pre>

To get PDF version of user documentation you can use any
XSLT 1.0/1.1/2.0 comliant transformer and some FO processor
(passiveTeX will be the only choice for now). Stylesheet to use
is chapter-fo.xsl

Files
========
<table>
<tr>
<td>core.dtd</td><td>Document type definition for chapter type</td>
</tr>
<tr>
<td>bookinfo.dtd		</td><td> Document type definition for book type</td>
</tr>
<tr>
<td>bookinfo.xml		</td><td> Main xml file</td>
</tr>
<tr>
<td>chapter??.xml		</td><td> Chapters translation</td>
</tr>
<tr>
<td>bookinfo.xsl		</td><td> Main HTML template</td>
</tr>
<tr>
<td>ocaml.xsl			</td><td> Chapter HTML template</td>
</tr>
<tr>
<td>ocaml.css			</td><td> Incomplete CSS file for Morphon editor</td>
</tr>
<tr>
<td>chapter-fo.xsl		</td><td> Mail FO template</td>
</tr>
<tr>
<td>ocaml-book-fo.xsl	</td><td> Book elements level FO template</td>
</tr>
<tr>
<td>ocaml-toc-fo.xsl	        </td><td> FO template generating tabl pof contents</td>
</tr>
<tr>
<td>chapter-section-fo.xsl	</td><td> FO template for section level elements</td>
</tr>
<tr>
<td>chapter-numbering.xsl</td><td> Section numbering</td>
</tr>
<tr>
<td>ocaml-list.xsl	</td><td> List-like elements</td>
</tr>
<tr>
<td>ocaml-bnf-fo.xsl	       </td><td> BNF-like notations</td>
</tr>
<tr>
<td>ocaml-inline-elements-fo.xsl</td><td> Inline formatting</td>
</tr>
<tr>
<td>ocaml-block-elements-fo.xsl</td><td> Block elements</td>
</tr>
<tr>
<td>ocaml-code-fo.xsl</td><td> Code formatting</td>
</tr>
</table>


Final notes
-----------------

All your suggestions/blames/bugfixes you can send directly to me, Sviatoslav Reentenko <rsvato@gmail.com> or post directly with github instruments. The only site containing more or less up-to-date html version of this translation is http://ocaml.spb.ru. Hosting costs, so, if you want to support it, don't hesitate to contact me.

If you want to fix my errors, clone this, sent me pull request and I'll say you 'thanks'.
