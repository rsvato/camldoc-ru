<?xml version="1.0" encoding="windows-1251"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0"  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:fotex="http://www.tug.org/fotex"
  >
  <xsl:template match="table">
    <fo:table>
      <xsl:call-template name="count-cols">
        <xsl:with-param name="content">
          <xsl:value-of select="descendant::node()"/>
        </xsl:with-param>
      </xsl:call-template>
    </fo:table>
  </xsl:template>
  <xsl:template name="count-cols">
    <xsl:param name="content"/>
    <xsl:message>
      <xsl:value-of select="$content"/>
    </xsl:message>
  </xsl:template>
</xsl:stylesheet>
