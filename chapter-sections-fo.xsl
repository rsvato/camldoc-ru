<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0"
  xmlns:fotex="http://www.tug.org/fotex"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
 <xsl:template match="section">
 	<xsl:if test="@name">
    <fo:block
      space-before.optimum="24pt"
      space-after.optimum="18pt"
      font-size="16pt"
      font-family="sans-serif"
      font-weight="bold"
      line-height="24pt"
      language="ru"
			text-align-last="left"
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
		</xsl:if>
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
			text-align-last="left"
     >
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
			text-align-last="left"
      >
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
			text-align-last="left"
     >
      <xsl:value-of select="@name"/>
    </fo:block>
    <xsl:apply-templates/>
  </xsl:template>
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
			text-align-last="left"
      break-before="page">
      Глава<xsl:text>&#160;</xsl:text>
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
</xsl:stylesheet>
