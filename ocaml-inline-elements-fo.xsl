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
</xsl:stylesheet>
