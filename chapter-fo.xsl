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
        margin-top="1.5cm" margin-bottom="1.5cm" margin-left="2.5cm" margin-right="2.5cm">
        <fo:region-before margin-right="0.6in" extent="0cm" border-color="black" border-width="2pt"/>
        <fo:region-body margin-top="36pt" margin-bottom="24pt" font-size="6pt" line-height="14pt"/>
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
            >
            <xsl:value-of select="//chapter/@name"/>
            <fo:display-rule color="#000000" line-thickness="1pt" length="16cm"
              rule-orientation="horizontal"
              />
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
  <xsl:include href="chapter-numbering.xsl"/>
  <xsl:include href="ocaml-list.xsl"/>
  <xsl:include href="chapter-sections-fo.xsl"/>
  <xsl:include href="ocaml-bnf-fo.xsl"/>
  <xsl:include href="ocaml-tables-fo.xsl"/>
  <xsl:include href="ocaml-inline-elements-fo.xsl"/>
  <!-- end includes -->
  <xsl:template match="chapter">
    <fo:block
      space-before.optimum="48pt"
      space-after.optimum="24pt"
      font-size="18pt"
      font-family="Helvetica"
      font-weight="bold"
      font-style="italic"
      color="#999999"
      line-height="24pt"
      break-before="page">
      Глава
      <xsl:value-of select="@number"/>.
      <xsl:value-of select="@name"/>
       <fotex:bookmark
        fotex-bookmark-level="1"
        >
        <xsl:attribute name="fotex-bookmark-label">
          <xsl:value-of select="generate-id()"/>
        </xsl:attribute>
        <xsl:value-of select="@name"/>
      </fotex:bookmark>
    </fo:block>
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="thead/trow/tcell/para">
    <fo:block
      text-align-last="justify"
      font-size="10pt"
      font-family="Times"
      line-height="12pt"
      language="ru"
      font-weight="bold"
      background-color="#efefef">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
   <xsl:template match="para" mode="thead">
    <fo:block
      text-align-last="justify"
      font-size="10pt"
      font-family="Times"
      line-height="12pt"
      language="ru"
      font-weight="bold"
      background-color="#efefef">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  <xsl:template match="para">
    <fo:block
      text-align-last="justify"
      font-size="10pt"
      font-family="Times"
      line-height="12pt"
      language="ru">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  <xsl:template match="listing">
    <fo:block
      font-size="10pt"
      line-height="14pt"
      font-family="Courier"
      background-color="#EEEEEE"
      linefeed-treatment="preserve"
      wrap-option="no-wrap"
      >
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
</xsl:stylesheet>
