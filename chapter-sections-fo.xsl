<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0"
  xmlns:fotex="http://www.tug.org/fotex"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
 <xsl:template match="section">
    <fo:block
      space-before.optimum="24pt"
      space-after.optimum="18pt"
      font-size="16pt"
      font-family="sans-serif"
      font-weight="bold"
      line-height="24pt"
      keep-with-next="true"
      language="ru"
      >
      <xsl:value-of select="ancestor::node()/@number"/>.<xsl:call-template name="NumberSection"/>
      <xsl:text>&#160;</xsl:text>
      <xsl:value-of select="@name"/>
      <fotex:bookmark
        fotex-bookmark-level="2"
        >
        <xsl:attribute name="fotex-bookmark-label">
          <xsl:value-of select="generate-id()"/>
        </xsl:attribute>
        <xsl:value-of select="@name"/>
      </fotex:bookmark>
    </fo:block>
    <xsl:apply-templates/>
  </xsl:template>
   <xsl:template match="subsection[@neednumber=1]">
    <fo:block
      space-before.optimum="14pt"
      space-after.optimum="12pt"
      font-size="14pt"
      font-family="sans-serif"
      font-weight="bold"
      line-height="16pt"
      keep-with-next="true">
      <xsl:value-of select="ancestor::node()/@number"/>.<xsl:call-template name="NumberSection"/>
      <xsl:text>&#160;</xsl:text>
      <xsl:value-of select="@name"/>
      <fotex:bookmark
        fotex-bookmark-level="3"
        >
        <xsl:attribute name="fotex-bookmark-label">
          <xsl:value-of select="generate-id()"/>
        </xsl:attribute>
        <xsl:value-of select="@name"/>
      </fotex:bookmark>
    </fo:block>
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="subsection">
    <fo:block
      space-before.optimum="14pt"
      space-after.optimum="12pt"
      font-size="14pt"
      font-family="sans-serif"
      font-weight="bold"
      line-height="16pt"
      keep-with-next="true">
      <xsl:value-of select="@name"/>
    </fo:block>
    <xsl:apply-templates/>
  </xsl:template>
   <xsl:template match="subsubsection">
    <fo:block
      space-before.optimum="12pt"
      space-after.optimum="6pt"
      font-size="12pt"
      font-family="sans-serif"
      font-weight="bold"
      line-height="16pt"
      keep-with-next="true">
      <xsl:value-of select="@name"/>
    </fo:block>
    <xsl:apply-templates/>
  </xsl:template>
</xsl:stylesheet>
