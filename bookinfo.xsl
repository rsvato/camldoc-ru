<?xml version="1.0" encoding="windows-1251"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output encoding="windows-1251" method="html" indent="yes"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:value-of select="//bookinfo/title"/>
				</title>
				<style type="text/css">
					<![CDATA[<!--
						body{
							background:#fff;
							font-family:verdana,arial,sans-serif,*;
							font-size:10px;
						}
					-->]]>
				</style>
			</head>
			<body>
				<xsl:apply-templates select="title"/>
				<xsl:apply-templates select="subtitle"/>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="//bookinfo/title">
		<div style="text-align:center;font-size:24px;font-weight:bold">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	<xsl:template match="subtitle">
		<div style="text-align:center;font-size:18px;font-weight:bold">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	<xsl:template match="authors">
		<div style="text-align:center;font-size:18px;font-weight:bold">
			<xsl:apply-templates select="main-author"/><br/>
			(а также
			 	<xsl:for-each select="sec-author">
					<xsl:if test="position() = last()">
					и 
					</xsl:if>
					<xsl:apply-templates/><xsl:if test="position() &lt; last() - 1">,<xsl:text>&#0160;</xsl:text>
					</xsl:if>
				</xsl:for-each>)
		</div>
	</xsl:template>
	<xsl:template match="legal">
		<div style="text-align:center;font-size:12px;font-weight:bold">
			<xsl:text disable-output-escaping="yes">&#x00A9;</xsl:text>
			<xsl:value-of select="@year"/>
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	<xsl:template match="part">
		<h1>
			Часть <xsl:call-template name="NumberParts"/>.
			<xsl:value-of select="title"/>
		</h1>
		<xsl:apply-templates select="chapter"/>
	</xsl:template>
	<xsl:template match="chapter">
		<a>
			<xsl:attribute name="href">
				<xsl:value-of select="@file"/>
			</xsl:attribute>
			<h2>Глава <xsl:call-template name="NumberChaps"/>.
			<xsl:value-of select="chapter/@name"/></h2>
		</a>
	</xsl:template>
	<xsl:template name="NumberParts">
		<xsl:number count="part"/>
	</xsl:template>
	<xsl:template name="NumberChaps">
		<xsl:number level="any" count="//part/chapter"/>
	</xsl:template>
</xsl:stylesheet>
