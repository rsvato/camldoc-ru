<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0"  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:fotex="http://www.tug.org/fotex"
  >
  <xsl:template match="command|filename|keyword">
    <fo:inline font-family="Courier">
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>
	<xsl:template match="emph">
		<fo:inline font-style="italic">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="power">
		<fo:inline font-size="6pt" baseline-shift="super">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="sub">
		<fo:inline font-size="6pt" baseline-shift="sub">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="tab">
		<xsl:text>&#160;</xsl:text>
		<xsl:text>&#160;</xsl:text>
		<xsl:text>&#160;</xsl:text>
	</xsl:template>
	<xsl:template match="lb">
		<fo:block/>
	</xsl:template>
	<xsl:template match="index">
		<xsl:apply-templates/><fo:inline baseline-shift="super" font-size="6pt"><xsl:value-of select="@ind"/></fo:inline>
	</xsl:template>
</xsl:stylesheet>
