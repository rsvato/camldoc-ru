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
							background-color:#fff;
							font-family:verdana,arial,sans-serif,*;
							font-size:10px;
						}
						a{
							color:black;
							text-decoration:none;
						}
						a:visited{
							color:black;
						}
						a:hover{
							color:#00e;
						}
					-->]]>
				</style>
			</head>
			<body>
				<div style="margin-top:90px;margin-left:15px;margin-right:15px;background-color:#eee;padding-left:10px;">
				<xsl:apply-templates select="title"/>
				<xsl:apply-templates select="subtitle"/>
				<xsl:apply-templates/>
				</div>
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
			(� �����
			 	<xsl:for-each select="sec-author">
					<xsl:if test="position() = last()">
					� 
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
			����� <xsl:call-template name="NumberParts"/>.
			<xsl:value-of select="title"/>
		</h1>
		<xsl:apply-templates select="chap"/>
	</xsl:template>
	<xsl:template match="chap">
		<a>
			<xsl:attribute name="href">
				<xsl:value-of select="@file"/>
			</xsl:attribute>
			<h2>����� <xsl:call-template name="NumberChaps"/>.
			<xsl:value-of select="chapter/@name"/></h2>
		</a>
		<ul>
			<xsl:for-each select="./chapter/main-matters/section">
				<li><xsl:value-of select="@name"/></li>
			</xsl:for-each>
		</ul>
	</xsl:template>
	<xsl:template name="NumberParts">
		<xsl:number count="part"/>
	</xsl:template>
	<xsl:template name="NumberChaps">
		<xsl:number level="any" count="//part/chap"/>
	</xsl:template>
</xsl:stylesheet>