<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
  <xsl:template name="NumberSection">
    <xsl:number level="multiple" count="section[@name]|subsection[@neednumber=1]"/>
  </xsl:template>
  <xsl:template name="NumberNote">
    <xsl:number level="single" count="note"/>
  </xsl:template>
</xsl:stylesheet>
