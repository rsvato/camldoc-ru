<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
  <xsl:output encoding="utf-8" method="html" indent="yes"
              doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
              doctype-system="http://www.w3.org/TR/html4/loose.dtd" />
  <xsl:preserve-space elements="listing user-input system-response" />
  <xsl:template match="chapter">
    <xsl:variable name="ch.count">
      <xsl:value-of select="count(ancestor::*//chap)" />
    </xsl:variable>
    <xsl:variable name="page.top">
      <xsl:text>http://ocaml.spb.ru/index.html</xsl:text>
    </xsl:variable>
    <xsl:variable name="page.previous">
      <xsl:choose>
        <xsl:when test="@number - 1 &gt; 0">
          <xsl:value-of
              select="concat('http://ocaml.spb.ru/chapter', format-number(@number - 1, '00'), '.html')" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$page.top" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="page.next">
      <xsl:choose>
        <xsl:when test="@number + 1 &lt; $ch.count">
          <xsl:value-of
              select="concat('http://ocaml.spb.ru/chapter', format-number(@number + 1, '00'), '.html')" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$page.top" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <html>
      <head>
        <meta name="descrition"
              content="Перевод официальной документации Objective Caml" />
        <meta name="keywords"
              content="Ocaml, Objective Caml, Caml, functional programming, функциональное программирование" />
        <link rel="up">
          <xsl:attribute name="href">
            <xsl:value-of select="$page.top" />
          </xsl:attribute>
        </link>
        <link rel="next" title="Следующая глава">
          <xsl:attribute name="href">
            <xsl:value-of select="$page.next" />
          </xsl:attribute>
        </link>
        <link rel="prev">
          <xsl:attribute name="href">
            <xsl:value-of select="$page.previous" />
          </xsl:attribute>
        </link>
        <link rel="stylesheet" type="text/css" href="assets/css/ocaml-html.css"/>
        <title>
          <xsl:value-of select="concat(@number, '. ', @name)"/>
        </title>
        <script src="assets/js/jquery-1.8.3.min.js"/>
        <script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
        </script>
        <script type="text/javascript">
          _uacct = "UA-1250887-1";
          urchinTracker();
        </script>
        <script type="text/javascript"><![CDATA[
          $(document).keydown(function(e) {
            if (e.keyCode == 39 && e.ctrlKey) {
            var next = $('link[rel=next]');
            if (next) {
              window.location.href = next.attr('href');
            }
            }
            if (e.keyCode == 37 && e.ctrlKey) {
              var prev = $('link[rel=prev]');
              if (prev) {
               window.location.href = prev.attr('href');
              }
            }
        });
        ]]></script>
      </head>
      <body>
        <div style="width:100%">
          <table class="cnt">
            <tr>
              <td align="left" style="padding-left:40px"
                  width="33%">
                <xsl:for-each
                    select="preceding::*/chapter">
                  <xsl:variable name="ps">
                    <xsl:value-of select="@number" />
                  </xsl:variable>
                  <xsl:variable name="pch">
                    <xsl:value-of
                        select="concat('chapter', format-number($ps, '00'), '.html')" />
                  </xsl:variable>
                  <a>
                    <xsl:attribute name="href">
                      <xsl:value-of select="$pch" />
                    </xsl:attribute>
                    <xsl:attribute name="title">
                      <xsl:text>Глава</xsl:text>
                      <xsl:value-of select="$ps" />
                    </xsl:attribute>
                    <img src="img/left-arrow.png">
                      <xsl:attribute
                          name="title">
                        <xsl:text>
                          Глава
                        </xsl:text>
                        <xsl:value-of
                            select="$ps" />
                      </xsl:attribute>
                      <xsl:attribute name="alt">
                        <xsl:text>
                          Глава
                        </xsl:text>
                        <xsl:value-of
                            select="$ps" />
                      </xsl:attribute>
                    </img>
                  </a>
                </xsl:for-each>
                <xsl:text>&#160;</xsl:text>
              </td>
              <td width="33%" align="center">
                <a href="toc.html" title="Содержание">
                  <img alt="navigation"
                       src="img/up-arrow.png" />
                </a>
              </td>
              <td align="right" style="padding-right:40px"
                  width="33%">
                <xsl:for-each
                    select="following::*/chapter">
                  <xsl:variable name="ps">
                    <xsl:value-of select="@number" />
                  </xsl:variable>
                  <xsl:variable name="pch">
                    <xsl:value-of
                        select="concat('chapter', format-number($ps, '00'), '.html')" />
                  </xsl:variable>
                  <a>
                    <xsl:attribute name="href">
                      <xsl:value-of select="$pch" />
                    </xsl:attribute>
                    <xsl:attribute name="title">
                      <xsl:text>Глава</xsl:text>
                      <xsl:value-of select="$ps" />
                    </xsl:attribute>
                    <img
                        src="img/right-arrow.png">
                      <xsl:attribute
                          name="title">
                        <xsl:text>
                          Глава
                        </xsl:text>
                        <xsl:value-of
                            select="$ps" />
                      </xsl:attribute>
                      <xsl:attribute name="alt">
                        <xsl:text>
                          Глава
                        </xsl:text>
                        <xsl:value-of
                            select="$ps" />
                      </xsl:attribute>
                    </img>
                  </a>
                </xsl:for-each>
                <xsl:text>&#160;</xsl:text>
              </td>
            </tr>
          </table>
        </div>
        <div id="main-matters">
          <a>
            <xsl:attribute name="name">
              <xsl:value-of select="generate-id(.)" />
            </xsl:attribute>
            <h1>
              Глава <xsl:value-of select="@number"/>.  <xsl:value-of select="@name" />
            </h1>
          </a>
          <xsl:if test="abstract">
            <xsl:apply-templates select="abstract" />
          </xsl:if>
          <xsl:apply-templates select="main-matters" />
          <xsl:if test="descendant-or-self::*/note">
            <h3>Примечания</h3>
            <xsl:call-template name="notes">
              <xsl:with-param name="notes">
                <xsl:value-of select="./note" />
              </xsl:with-param>
            </xsl:call-template>
          </xsl:if>
        </div>
        <div id="navigation">
          <xsl:call-template name="toc" />
        </div>
        <br clear="all"/>
      </body>
    </html>
  </xsl:template>
  <!-- PARA -->
  <xsl:template match="para">
    <p>
      <xsl:apply-templates />
    </p>
  </xsl:template>
  <xsl:template match="abstract">
    <div id="abstract">
      <xsl:apply-templates />
    </div>
  </xsl:template>
  <xsl:template match="main-matters">
    <xsl:apply-templates select="section" />
  </xsl:template>
  <xsl:template match="section">
    <xsl:if test="@name">
      <a>
        <xsl:attribute name="name">
          <xsl:value-of select="generate-id(.)" />
        </xsl:attribute>
        <h2>
          <xsl:value-of select="ancestor::*/chapter/@number" />.<xsl:call-template name="NumberSection" />
          <xsl:text>&#160;</xsl:text>
          <xsl:value-of select="@name" />
        </h2>
      </a>
    </xsl:if>
    <xsl:apply-templates />
  </xsl:template>
  <xsl:template match="subsection">
    <a>
      <xsl:attribute name="name">
        <xsl:value-of select="generate-id(.)" />
      </xsl:attribute>
      <h3>
        <xsl:variable name="nn">
          <xsl:value-of select="@neednumber" />
        </xsl:variable>
        <xsl:if test="$nn &gt; 0">
          <xsl:value-of select="ancestor::*/chapter/@number" />
          .
          <xsl:call-template name="NumberSection" />
          <xsl:text>&#160;</xsl:text>
        </xsl:if>
        <xsl:value-of select="@name" />
      </h3>
    </a>
    <xsl:apply-templates />
  </xsl:template>
  <xsl:template match="subsubsection">
    <a>
      <xsl:attribute name="name">
        <xsl:value-of select="generate-id(.)" />
      </xsl:attribute>
      <h4>
        <xsl:value-of select="@name" />
      </h4>
    </a>
    <xsl:apply-templates />
  </xsl:template>
  <xsl:template match="command|keyword">
    <code>
      <xsl:apply-templates />
    </code>
  </xsl:template>
  <xsl:template match="session|command-session">
    <div class="command-session">
      <xsl:apply-templates />
    </div>
  </xsl:template>
  <xsl:template match="eval-step|command-line">
    <xsl:apply-templates />
  </xsl:template>
  <xsl:template match="user-input|input">
    <xsl:variable name="prompt">
      <xsl:choose>
        <xsl:when test="count(@prompt) &gt; 0">
          <xsl:value-of select="@prompt" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>#</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <span style="color:blue">
      <pre>
        <xsl:apply-templates />
      </pre>
    </span>
  </xsl:template>
  <xsl:template match="system-response|response">
    <span style="color:maroon">
      <pre>
        <xsl:apply-templates />
      </pre>
    </span>
  </xsl:template>
  <xsl:template match="lb">
    <br />
  </xsl:template>
  <xsl:template match="tab">
    <xsl:text>&#160;</xsl:text>
    <xsl:text>&#160;</xsl:text>
    <xsl:text>&#160;</xsl:text>
  </xsl:template>
  <xsl:template match="listing">
    <div class="listing">
      <pre>
        <xsl:apply-templates />
      </pre>
    </div>
  </xsl:template>
  <xsl:template name="toc">
    <ul class="chapnav">
      <xsl:for-each select="node()/section">
        <xsl:if test="@name">
          <li>
            <a class="toc">
              <xsl:attribute name="href">#<xsl:value-of select="generate-id(.)" /></xsl:attribute>
              <xsl:value-of select="@name" />
            </a>
          </li>
        </xsl:if>
      </xsl:for-each>
    </ul>
  </xsl:template>
  <xsl:template match="emph">
    <i>
      <xsl:apply-templates />
    </i>
  </xsl:template>
  <xsl:template match="sub">
    <sub>
      <span style="font-size:8px">
        <xsl:apply-templates />
      </span>
    </sub>
  </xsl:template>
  <xsl:template match="list">
    <ul>
      <xsl:apply-templates />
    </ul>
  </xsl:template>
  <xsl:template match="item">
    <li>
      <xsl:apply-templates />
    </li>
  </xsl:template>
  <xsl:template match="note">
    <sup>
      <span style="font-size:-2">
        <a>
          <xsl:attribute name="href">
            #
            <xsl:value-of select="generate-id()" />
          </xsl:attribute>
          <xsl:call-template name="NumberNote" />
        </a>
      </span>
    </sup>
  </xsl:template>
  <xsl:template match="list[type='plain']">
    <ul>
      <xsl:apply-templates />
    </ul>
  </xsl:template>
  <xsl:template match="list[type='numeric']">
    <ol>
      <xsl:apply-templates />
    </ol>
  </xsl:template>
  <xsl:template match="power">
    <xsl:apply-templates />
    <sup>
      <span style="font-size:-2">
        <xsl:value-of select="@pow" />
      </span>
    </sup>
  </xsl:template>
  <xsl:template match="index">
    <xsl:apply-templates />
    <sub>
      <span style="font-size:-2">
        <xsl:value-of select="@ind" />
      </span>
    </sub>
  </xsl:template>
  <xsl:template match="table">
    <table style="width:80%" align="center">
      <xsl:apply-templates />
    </table>
  </xsl:template>
  <xsl:template match="thead">
    <thead>
      <xsl:apply-templates select="trow">
        <xsl:with-param name="head" select="1" />
      </xsl:apply-templates>
    </thead>
  </xsl:template>
  <xsl:template match="tbody">
    <tbody>
      <xsl:apply-templates select="trow">
        <xsl:with-param name="head" select="0" />
      </xsl:apply-templates>
    </tbody>
  </xsl:template>
  <xsl:template match="trow">
    <xsl:param name="head" select="1" />
    <tr>
      <xsl:apply-templates select="tcell">
        <xsl:with-param name="head" select="$head" />
      </xsl:apply-templates>
    </tr>
  </xsl:template>
  <xsl:template match="tcell">
    <xsl:param name="head" select="0" />
    <xsl:choose>
      <xsl:when test="$head = 1">
        <th>
          <xsl:apply-templates />
        </th>
      </xsl:when>
      <xsl:otherwise>
        <td>
          <xsl:apply-templates />
        </td>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="bnf">
    <table class="bnf">
      <tr>
        <td valign="top" align="right" width="20%">
          <xsl:apply-templates select="term" />
        </td>
        <td valign="top" align="center" width="5%">
          <span style="font-family:monospace">::=</span>
        </td>
        <td valign="top" align="left">
          <xsl:apply-templates select="def" />
        </td>
      </tr>
    </table>
  </xsl:template>
  <xsl:template match="term">
    <span class="term">
      <xsl:apply-templates />
    </span>
  </xsl:template>
  <xsl:template match="value">
    <span class="value">
      <xsl:apply-templates />
    </span>
  </xsl:template>
  <xsl:template match="def">
    <xsl:apply-templates />
  </xsl:template>
  <xsl:template match="group">
    (
    <xsl:apply-templates />
    )
  </xsl:template>
  <xsl:template match="repetitive">
    {
    <xsl:apply-templates />
    }
  </xsl:template>
  <xsl:template match="repetitive[@count &gt; 0]">
    {
    <xsl:apply-templates />
    }
    <sup>+</sup>
  </xsl:template>
  <xsl:template match="or[@multiline=0]">
    <xsl:for-each select="choice">
      <xsl:apply-templates />
      <xsl:if test="position() != last()">|</xsl:if>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="or[@multiline=1]">
    <xsl:for-each select="choice">
      <xsl:apply-templates />
      <xsl:if test="position() != last()">
        <br />
        |
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="optional">
    [
    <xsl:apply-templates />
    ]
  </xsl:template>
  <xsl:template match="command-option-group|dict">
    <dl compact="compact">
      <xsl:apply-templates />
    </dl>
  </xsl:template>
  <xsl:template match="c-option">
    <dt>
      <xsl:apply-templates />
    </dt>
  </xsl:template>
  <xsl:template match="command-option">
    <xsl:apply-templates />
  </xsl:template>
  <xsl:template match="mc-option">
    <span style="font-weight:bold;font-family:monospaced">
      <xsl:apply-templates />
    </span>
  </xsl:template>
  <xsl:template match="c-param">
    <span style="font-weight:bold;font-style:italic">
      <xsl:apply-templates />
    </span>
  </xsl:template>
  <xsl:template match="option-description">
    <dd>
      <xsl:apply-templates />
    </dd>
  </xsl:template>
  <xsl:template match="dict-term">
    <dt>
      <strong>
        <xsl:apply-templates />
      </strong>
    </dt>
  </xsl:template>
  <xsl:template match="dict-art">
    <dd>
      <xsl:apply-templates />
    </dd>
  </xsl:template>
  <xsl:template name="notes">
    <xsl:param name="notes" />
    <xsl:for-each select="descendant-or-self::*/note">
      <div class="note">
        <a>
          <xsl:attribute name="name">
            <xsl:value-of select="generate-id()" />
          </xsl:attribute>
          <p style="font-weight:bold">
            Примечание
            <xsl:call-template name="NumberNote" />
          </p>
          <xsl:apply-templates />
        </a>
      </div>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="NumberSection">
    <xsl:number level="multiple"
                count="section[@name]|subsection[@neednumber=1]" />
  </xsl:template>
  <xsl:template name="NumberNote">
    <xsl:number level="single" count="note" />
  </xsl:template>
  <xsl:template name="navigation">
    <xsl:param name="n" />
    <div style="width:100%">
      <table style="width:100%;border:none;padding:0px">
        <tr>
          <td align="left" style="padding-left:40px">
            <xsl:if test="preceding-sibling::*[0]">
              <xsl:variable name="ps">
                <xsl:value-of
                    select="preceding-sibling::*[0]/@number" />
              </xsl:variable>
              <xsl:variable name="pch">
                <xsl:value-of
                    select="concat('chapter', $ps)" />
              </xsl:variable>
              <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="$pch" />
                </xsl:attribute>
                <img src="img/left-arrow.png"
                     title="Назад" alt="Назад" style="border:none" />
              </a>
            </xsl:if>
            <xsl:text>&#160;</xsl:text>
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
</xsl:stylesheet>
