<?xml version="1.0" encoding="windows-1251"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fotex="http://www.tug.org/fotex"
  xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xsl:output encoding="utf-8" method="xml" indent="yes"/>
  <xsl:preserve-space elements="listing user-input system-response"/>

  
  <xsl:variable name="fo:layout-master-set">
    <fo:layout-master-set>
      <fo:simple-page-master
        master-name="default-page-master"
        page-height="29.7cm"
        page-width="21cm"
        margin-top="1.5cm" margin-bottom="1.5cm" margin-left="2.5cm" margin-right="2.5cm"
        orphans="2" widows="2"
        >
        <fo:region-before extent="0cm" border-color="black" border-width="2pt"/>
        <fo:region-body margin-top="36pt" margin-bottom="24pt"/>
        <fo:region-after extent="0cm"/>
      </fo:simple-page-master>
    </fo:layout-master-set>
  </xsl:variable>  

  <xsl:template match="/">
    <fo:root>
      <xsl:copy-of select="$fo:layout-master-set"/>
      <fo:page-sequence master-reference="default-page-master">
        <fo:static-content flow-name="xsl-region-before">
          <fo:block
            font-size="8pt"
            text-align-last="right"
            space-before.optimum="10pt"
            space-after.optimum="18pt"
            font-style="italic"
            font-family="Times"
            >
            <fo:retrieve-marker retrieve-class-name="chap-head"/>
          </fo:block>
        </fo:static-content>
        <fo:static-content flow-name="xsl-region-after">
          <fo:block>
            <fo:page-number/>
          </fo:block>
        </fo:static-content>
        <fo:flow flow-name="xsl-region-body">
          <fo:block space-before.optimum="10pt"
            space-after.optimum="18pt">
            <xsl:apply-templates/>
          </fo:block>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
  <!-- includes -->
  <xsl:include href="ocaml-toc-fo.xsl"/>
  <xsl:include href="ocaml-book-fo.xsl"/>
  <xsl:include href="chapter-sections-fo.xsl"/>
  <xsl:include href="chapter-numbering.xsl"/>
  <xsl:include href="ocaml-list.xsl"/>
  <xsl:include href="ocaml-bnf-fo.xsl"/>
  <xsl:include href="ocaml-tables-fo.xsl"/>
  <xsl:include href="ocaml-inline-elements-fo.xsl"/>
  <xsl:include href="ocaml-block-elements-fo.xsl"/>
  <xsl:include href="ocaml-code-fo.xsl"/>
  <!-- end includes -->
 </xsl:stylesheet>
