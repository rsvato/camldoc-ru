<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1"
                xmlns:saxon="http://saxon.sf.net">
        <!--xsl:param name="default.encoding" select="'windows-1251'"/>
        <xsl:param name="htmlhelp.encoding" select="'windows-1251'"/-->
        <xsl:param name="saxon.character.representation" select="'native'"/>
        <xsl:param name="chunker.output.encoding" select="'utf-8'"/>
        <xsl:param name="site.build" select="false"/>
        <xsl:param name="main.site">
                <xsl:text>./</xsl:text>
        </xsl:param>
        <xsl:output encoding="UTF-8" method="html" indent="yes" saxon:character-representation="native"/>

        <xsl:template match="/">
                <xsl:apply-templates select="bookinfo"/>
        </xsl:template>
        <xsl:template match="bookinfo">
                <html>
                        <head>
                                <title>
                                        <xsl:value-of select="//bookinfo/title"/>
                                </title>

                                <style type="text/css">
                                        <![CDATA[
                                        @import("assets/css/ocaml-html.css");
                                        ]]>
                                </style>
        <script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
        </script>
        <script type="text/javascript">
        _uacct = "UA-1250887-1";
        urchinTracker();
        </script>
                        </head>
                        <body>
                                <div style="margin-top:90px;margin-left:15px;margin-right:15px;background-color:#eee;padding-left:10px;">
                                        <xsl:apply-templates/>
                                </div>
                        </body>
                </html>
                <xsl:for-each select="//chap">
                        <xsl:variable name="chapn">
                                <xsl:value-of select="./chapter/@number"/>
                        </xsl:variable>
                        <xsl:variable name="chapf">
                                <xsl:value-of select="format-number($chapn, '00')"/>
                        </xsl:variable>
                        <xsl:document href="chapter{$chapf}.html">
                                <xsl:apply-templates/>
                        </xsl:document>
                </xsl:for-each>
        </xsl:template>
        <xsl:include href="ocaml.xsl"/>
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
                        <xsl:apply-templates select="main-author"/>
                        <br/>
                        (а также
                                <xsl:for-each select="sec-author">
                                        <xsl:if test="position() = last()">
                                        и
                                        </xsl:if>
                                <xsl:apply-templates/>
                                <xsl:if test="position() &lt; last() - 1">,<xsl:text>&#0160;</xsl:text>
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
                <xsl:apply-templates select="chap"/>
        </xsl:template>
        <xsl:template match="chap">
                <xsl:variable name="nf" select="@nf"/>
                <a>
                        <xsl:attribute name="href">
                                <xsl:value-of select="concat($main.site, @file)"/>
                        </xsl:attribute>
                        <h2>Глава <xsl:call-template name="NumberChaps"/>.
                        <xsl:value-of select="chapter/@name"/>
                                <xsl:if test="$nf &gt; 0">
                                        <span style="color:red">
                                        не закончено
                                </span>
                                </xsl:if>
                        </h2>
                </a>
                <ul>
                        <xsl:for-each select="./chapter/main-matters/section[@name]">
                                <li>
                                        <xsl:value-of select="@name"/>
                                </li>
                        </xsl:for-each>
                </ul>

        </xsl:template>
        <xsl:template match="advice">
          <div class="advice">
            <xsl:for-each select="child::*">
              <xsl:copy-of select="."/>
            </xsl:for-each>
          </div>
        </xsl:template>
        <xsl:template name="NumberParts">
                <xsl:number count="part"/>
        </xsl:template>
        <xsl:template name="NumberChaps">
                <xsl:number level="any" count="//part/chap"/>
        </xsl:template>
</xsl:stylesheet>
