<?xml version="1.0" encoding="windows-1251"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0"  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:fotex="http://www.tug.org/fotex"
  >
  <xsl:template match="table">
    <fo:block  space-before.optimum="14pt" space-after.optimum="14pt">
      <fo:table border-color="black" border-width="1pt" border-style="solid" space-before.optimum="14pt" space-after.optimum="14pt" table-layout="fixed">
        <xsl:for-each select="tbody/trow[1]/tcell">
          <fo:table-column column-width="8cm">
            <xsl:attribute name="column-number">
              <xsl:value-of select="position()"/>
            </xsl:attribute>
            <xsl:attribute name="fotex:column-align">
              <xsl:text>p</xsl:text>
            </xsl:attribute>
          </fo:table-column>
        </xsl:for-each>
        <xsl:apply-templates/>
      </fo:table>
    </fo:block>
  </xsl:template>
  <xsl:template match="tcell">
    <fo:table-cell  padding-start="1pt" padding-end="1pt" padding-before="3pt" padding-after="3pt" border-style="solid" border-width="1pt" border-color="black">
      <xsl:apply-templates/>
    </fo:table-cell>
  </xsl:template>
  <xsl:template match="thead">
    <fo:table-header>
      <xsl:apply-templates/>
    </fo:table-header>
  </xsl:template>
  <xsl:template match="tbody">
    <fo:table-body>
      <xsl:apply-templates/>
    </fo:table-body>
  </xsl:template>
  <xsl:template match="trow">
    <fo:table-row>
      <xsl:apply-templates/>
    </fo:table-row>
  </xsl:template>
</xsl:stylesheet>
