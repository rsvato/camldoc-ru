<?xml version="1.0" encoding="windows-1251"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0"  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:fotex="http://www.tug.org/fotex"
  >
	<xsl:template match="part">
		<fo:block break-before="page" break-after="page" font-family="Helvetica" font-size="24pt" font-weight="bold"
		text-align-last="center">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="bookinfo">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="title">
		<fo:block font-family="Helvetica" font-size="24pt" font-weight="bold"
		text-align-last="center">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="subtitle">
		<fo:block font-size="20pt" font-weight="bold"
		text-align-last="center">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="authors">
		<fo:block text-align="center" font-size="18pt" font-weight="bold">
			<xsl:apply-templates select="main-author"/><fo:block/>
			(а также
			 	<xsl:for-each select="sec-author">
					<xsl:if test="position() = last()">
					и 
					</xsl:if>
					<xsl:apply-templates/><xsl:if test="position() &lt; last() - 1">,<xsl:text>&#0160;</xsl:text>
					</xsl:if>
				</xsl:for-each>)
		</fo:block>
	</xsl:template>
	<xsl:template name="NumberParts">
		<xsl:number count="part"/>
	</xsl:template>
	<xsl:template name="NumberChaps">
		<xsl:number level="any" count="//part/chap"/>
	</xsl:template>
</xsl:stylesheet>
