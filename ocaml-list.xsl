<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">

  <xsl:template match="list">
    <fo:list-block font-weight="normal" font-size="10pt" text-align-last="left" line-height="12pt">
      <xsl:for-each select="item">
        <fo:list-item>
          <fo:list-item-label>
            <fo:block text-align-last="justify"
      font-size="10pt"
			font-weight="normal"
      line-height="12pt"
      language="ru">
              <xsl:text>&#x2022;</xsl:text>
            </fo:block>
          </fo:list-item-label>
          <fo:list-item-body text-align-last="justify"
      font-size="10pt"
			font-weight="normal"
      font-family="Times"
      line-height="12pt"
      language="ru">
               <xsl:apply-templates/>
           </fo:list-item-body>
        </fo:list-item>
      </xsl:for-each>
    </fo:list-block>
  </xsl:template>

  <xsl:template match="dict|command-option-group">
    <fo:list-block font-weight="normal" font-size="10pt" text-align-last="left">
      <xsl:apply-templates/>
    </fo:list-block>
  </xsl:template>
  <xsl:template match="dict-term">
    <fo:list-item-label>
       <fo:block font-weight="bold" font-size="10pt"  text-align-last="left" font-family="Times">
         <xsl:apply-templates/>
       </fo:block>
     </fo:list-item-label>
  </xsl:template>
  <xsl:template match="dict-art">
    <fo:list-item-body>
      <fo:block font-size="10pt"  font-weight="normal">
        <xsl:apply-templates/>
      </fo:block>
    </fo:list-item-body>
  </xsl:template>

  <xsl:template match="command-option">
    <fo:list-item>
      <xsl:apply-templates/>
    </fo:list-item>
  </xsl:template>
  
  <xsl:template match="c-option">
    <fo:list-item-label>
      <fo:block>
        <xsl:apply-templates/>
      </fo:block>
    </fo:list-item-label>
  </xsl:template>

  <xsl:template match="mc-option">
    <fo:inline font-weight="bold" font-family="Courier">
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>

  <xsl:template match="c-param">
    <fo:inline font-weight="bold" font-style="italic" font-family="Courier">
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>
  
  <xsl:template match="option-description">
    <fo:list-item-body>
      <fo:block>
        <xsl:apply-templates/>
      </fo:block>
    </fo:list-item-body>
  </xsl:template>
</xsl:stylesheet>
