<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0"  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:fotex="http://www.tug.org/fotex"
  >
  <xsl:template match="bnf">
    <fo:table  space-before.optimum="14pt" space-after.optimum="14pt">
      <fo:table-column column-number="1" fotex:column-align="r" column-width="25%"/>
      <fo:table-column column-number="2" fotex:column-align="l" column-width="75%"/>
      <fo:table-body>
        <fo:table-row>
          <fo:table-cell>
            <fo:block>
              <xsl:apply-templates select="term"/>
              <xsl:text>::=</xsl:text>
            </fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block>
              <xsl:apply-templates select="def"/>
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
      </fo:table-body>
    </fo:table>
  </xsl:template>
  <xsl:template match="def">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="term">
    <fo:inline font-family="Courier" color="#800000" font-style="italic">
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>
  <xsl:template match="value">
    <fo:inline font-family="Courier" color="#000080">
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>
  <xsl:template match="group">
    <xsl:text>(&#160;</xsl:text><xsl:apply-templates/><xsl:text>&#160;)</xsl:text>
  </xsl:template>
  <xsl:template match="repetitive">
    <xsl:text>{&#160;</xsl:text><xsl:apply-templates/> <xsl:text>&#160;}</xsl:text>
  </xsl:template>
  <xsl:template match="repetitive[@count &gt; 0]">
    <xsl:text>{&#160;</xsl:text><xsl:apply-templates/> <xsl:text>&#160;}+</xsl:text>
  </xsl:template>
  <xsl:template match="or[@multiline=0]">
    <xsl:for-each select="choice">
      <xsl:apply-templates/> 
      <xsl:if test="position() != last()">
        |
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="or[@multiline=1]">
    <xsl:for-each select="choice">
      <xsl:apply-templates/> 
      <xsl:if test="position() != last()">
        <fo:block/><xsl:text>|</xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="optional">
    <xsl:text>[&#160;</xsl:text><xsl:apply-templates/> <xsl:text>&#160;]</xsl:text>
  </xsl:template>
</xsl:stylesheet>
