<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format"
		xmlns:fotex="http://www.tug.org/fotex">
	<xsl:template match="abstract">
		<xsl:if test="abstract">
			<fo:block background-color="#efefef" padding-left="12pt" padding-right="12pt"
					margin-left="12pt"
					margin-right="12pt">
				<xsl:apply-templates/>
			</fo:block>
		</xsl:if>
	</xsl:template>
	<xsl:template match="session|command-session">
		<fo:block border-top-style="solid" border-top-width="1pt"
				border-top-color="black"
				border-bottom-style="solid" border-bottom-width="1pt"
				border-bottom-color="black"
				margin-left="6pt"
				margin-right="6pt"
				background-color="#efefef"
				space-before.optimum="12pt"
				space-before.minimum="6pt"
				space-after.optimum="12pt"
				font-size="8pt"
				font-weight="normal"
				orphans="2" widows="1"
				page-break-inside="auto"
				text-align-last="left">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="eval-step|command-line">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="input|user-input">
		<fo:block color="blue" font-family="Courier"
				linefeed-treatment="preserve"
				wrap-option="no-wrap" orphans="2" widows="1" page-break-inside="auto">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="response|system-response">
		<fo:block color="maroon" font-family="Courier"
				linefeed-treatment="preserve"
				wrap-option="no-wrap" orphans="2" widows="1" page-break-inside="auto">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="listing">
		<fo:block
				font-size="10pt"
				line-height="14pt"
				font-family="Courier"
				font-weight="normal"
				background-color="#EEEEEE"
				linefeed-treatment="preserve"
				wrap-option="no-wrap"
				text-align-last="start">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="thead/trow/tcell/para">
		<fo:block
				text-align="justify"
				text-align-last="start"
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
				text-align="justify"
				text-align-last="start"
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
				text-align="justify"
				text-align-last="start"
				font-size="10pt"
				font-weight="normal"
				font-family="Times"
				line-height="12pt"
				language="ru" orphans="2" widows="1">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="note">
		<fo:footnote>
			<fo:inline font-size="6pt" vertical-align="super">
				<xsl:call-template name="NumberNote"/>
			</fo:inline>
			<fo:footnote-body>
				<fo:list-block>
					<fo:list-item>
						<fo:list-item-label>
							<fo:block>
								<fo:inline font-size="6pt" vertical-align="super">
									<xsl:call-template name="NumberNote"/>
								</fo:inline>
							</fo:block>
						</fo:list-item-label>
						<fo:list-item-body>
							<xsl:apply-templates/>
						</fo:list-item-body>
					</fo:list-item>
				</fo:list-block>
			</fo:footnote-body>
		</fo:footnote>
	</xsl:template>
</xsl:stylesheet>
