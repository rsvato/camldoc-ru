<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">

  <xsl:template match="list">
    <fo:list-block font-weight="normal"
      font-size="10pt"
      space-before="6pt" space-after="6pt">
      <xsl:for-each select="item">
        <fo:list-item space-after="1em">
          <fo:list-item-label end-indent="label-end()">
            <fo:block text-align="start"
              font-size="10pt"
              font-weight="normal"
              line-height="12pt"
              language="ru">
              <xsl:text>&#x2022;</xsl:text>
            </fo:block>
          </fo:list-item-label>
          <fo:list-item-body keep-together="auto" start-indent="body-start()">
            	<xsl:apply-templates/>
          </fo:list-item-body>
        </fo:list-item>
      </xsl:for-each>
    </fo:list-block>
  </xsl:template>
  
  <xsl:template match="dict|command-option-group">
		<fo:block text-align-last="start">
      <xsl:apply-templates/>
		</fo:block>	
  </xsl:template>

  <xsl:template match="dict-term">
      <fo:block font-weight="bold" font-size="10pt"  text-align="justify" font-family="Times">
        <xsl:apply-templates/>
      </fo:block>
  </xsl:template>

  <xsl:template match="dict-art">
    <fo:block start-indent="2em">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  
  <xsl:template match="command-option">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="c-option">
		<fo:block text-align="justify">
     <xsl:apply-templates/>
		</fo:block> 
  </xsl:template>

  <xsl:template match="mc-option">
    <fo:inline font-weight="bold" font-family="Courier" font-size="10pt" >
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>

  <xsl:template match="c-param">
    <fo:inline font-weight="bold" font-style="italic" font-family="Courier" font-size="10pt">
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>
  
  <xsl:template match="option-description">
    <fo:block start-indent="2em">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
</xsl:stylesheet>
