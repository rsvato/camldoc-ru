<?xml version="1.0" encoding="windows-1251"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0"  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:fotex="http://www.tug.org/fotex"
  >
  <xsl:template name="table-of-contents">
    <xsl:for-each select="//part">
      <fo:block text-align-last="justify"
        text-indent="-1em" start-indent="1em">
      <fo:inline padding-start="1em">
        <xsl:value-of select="./title"/>
        <fo:leader leader-pattern="dots"/>
        <fo:page-number-citation>
          <xsl:attribute name="ref-id">
            <xsl:value-of select="generate-id(.)"/>
          </xsl:attribute>
        </fo:page-number-citation>
      </fo:inline>
      <xsl:for-each select="./chap/chapter">
        <fo:block text-align-last="justify"
          text-indent="1em" start-indent="2em"
          >
          <fo:inline padding-start="2em">
            <xsl:value-of select="@name"/>
            <fo:leader leader-pattern="dots"/>
            <fo:page-number-citation>
              <xsl:attribute name="ref-id">
                <xsl:value-of select="generate-id(.)"/>
              </xsl:attribute>
            </fo:page-number-citation>
          </fo:inline>
        </fo:block>
      </xsl:for-each>
      </fo:block>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>