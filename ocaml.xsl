<?xml version="1.0" encoding="koi8-r"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output encoding="windows-1251" method="html" indent="yes"
		doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
		doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
	<xsl:preserve-space elements="listing user-input system-response"/>
	<xsl:template match="/">
          <html>
            <head>
              <meta name="keywords" content="Ocaml, Objective Caml, Caml, functional programming, функциональное программирование"/>
	      <link rel="stylesheet" type="text/css" href="./ocaml-html.css"/>
            <title>
              <xsl:value-of select="/chapter/@number"/>. <xsl:value-of select="/chapter/@name"/>
            </title>
          </head>
          <body>
            <xsl:apply-templates select="chapter"/>
	<div id="counter" style="position:relative;margin-top:15px" align="center">
	<!--Rating@Mail.ru COUNTER--><a target="_top" href="http://top.mail.ru/jump?from=656088"><img src="http://top.list.ru/counter?id=656088;t=217" border="0" height="31" width="88" alt="пЕИРХМЦ@Mail.ru"/></a><!--/COUNTER-->
	</div>
          </body>
        </html>
      </xsl:template>
      <!-- TOPLEVEL ELEMENT -->
      <xsl:template match="chapter">
        <div id="main-matters">
          <a>
            <xsl:attribute name="name">
              <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
            <h1>
              Глава <xsl:value-of select="@number"/>. 
            <xsl:value-of select="@name"/>
          </h1>
        </a>
        <xsl:apply-templates select="abstract"/>
        <xsl:apply-templates select="main-matters"/>
        <xsl:if test="//note">
          <h3>Примечания</h3>
          <xsl:call-template name="notes"/>
        </xsl:if>
      </div>
      <div id="navigation">
        <xsl:call-template name="toc"/>
      </div>
    </xsl:template>
    <!-- PARA -->
    <xsl:template match="para">
      <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="abstract">
      <xsl:if test="abstract">
        <div style="padding-left:20px;padding-right:20px" id="abstract">
          <xsl:apply-templates/>
        </div>
      </xsl:if>
    </xsl:template>
    <xsl:template match="main-matters">
      <xsl:apply-templates select="section"/>
    </xsl:template>
    <xsl:template match="section">
      <xsl:if test="@name">
        <a>
          <xsl:attribute name="name">
            <xsl:value-of select="generate-id(.)"/>
          </xsl:attribute>
          <h2>
            <xsl:value-of select="//chapter/@number"/>.<xsl:call-template name="NumberSection"/>
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="@name"/>
          </h2>
        </a>
      </xsl:if>
      <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="subsection">
      <a>
        <xsl:attribute name="name">
          <xsl:value-of select="generate-id(.)"/>
        </xsl:attribute>
        <h3>
          <xsl:variable name="nn">
            <xsl:value-of select="@neednumber"/>
          </xsl:variable>
          <xsl:if test="$nn &gt; 0">
            <xsl:value-of select="//chapter/@number"/>.<xsl:call-template name="NumberSection"/>
            <xsl:text>&#160;</xsl:text>
          </xsl:if>
          <xsl:value-of select="@name"/>
        </h3>
      </a>
      <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="subsubsection">
      <a>
        <xsl:attribute name="name">
          <xsl:value-of select="generate-id(.)"/>
        </xsl:attribute>
        <h4>
          <xsl:value-of select="@name"/>
        </h4>
      </a>
      <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="command|keyword">
      <code>
        <xsl:apply-templates/>
      </code>
    </xsl:template>
    <xsl:template match="session|command-session">
      <div style="border:black solid thin;padding-left:40px;padding-right:40px;left=20px;right=20px;background-color:#eee"
        >
        <xsl:apply-templates/>
      </div>
    </xsl:template>
    <xsl:template match="eval-step|command-line">
      <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="user-input|input">
      <xsl:variable name="prompt">
        <xsl:choose>
          <xsl:when test="count(@prompt) &gt; 0">
            <xsl:value-of select="@prompt"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>#</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <span style="color:blue"><pre>
      <xsl:apply-templates/>
    </pre></span>
  </xsl:template>
  <xsl:template match="system-response|response">
    <span style="color:maroon">
      <pre>
        <xsl:apply-templates/>
      </pre>
    </span>
  </xsl:template>
  <xsl:template match="lb">
    <br/>
  </xsl:template>
  <xsl:template match="tab">
    <xsl:text>&#160;</xsl:text>
    <xsl:text>&#160;</xsl:text>
    <xsl:text>&#160;</xsl:text>
  </xsl:template>
  <xsl:template match="listing">
    <div style="border:black solid thin;padding-left:40px;padding-right:40px;left=20px;right=20px;background-color:#eee"
      >
      <pre>
        <xsl:apply-templates/>
      </pre>
    </div>
  </xsl:template>
  <xsl:template name="toc">
    <xsl:for-each select="//section">
      <xsl:if test="@name">
        <a class="toc">
          <xsl:attribute name="href">#<xsl:value-of select="generate-id(.)"/></xsl:attribute>
          <xsl:value-of select="@name"/>
        </a>
        <br/><br/>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="emph">
    <i><xsl:apply-templates/></i>
  </xsl:template>
  <xsl:template match="sub">
    <sub><span style="font-size:-2"><xsl:apply-templates/></span></sub>
  </xsl:template>
  <xsl:template match="list">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>
  <xsl:template match="item">
    <li><xsl:apply-templates/></li>
  </xsl:template>
  <xsl:template match="note">
    <sup><span style="font-size:-2"><a>
    <xsl:attribute name="href">#<xsl:value-of select="generate-id()"/></xsl:attribute>
    <xsl:call-template name="NumberNote"/></a></span></sup>
  </xsl:template>
  <xsl:template match="list[type='plain']">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>
  <xsl:template match="list[type='numeric']">
    <ol>
      <xsl:apply-templates/>
    </ol>
  </xsl:template>
  <xsl:template match="power">
    <xsl:apply-templates/><sup><span style="font-size:-2"><xsl:value-of select="@pow"/></span></sup>
  </xsl:template>
  <xsl:template match="index">
    <xsl:apply-templates/><sub><span style="font-size:-2"><xsl:value-of select="@ind"/></span></sub>
  </xsl:template>
  <xsl:template match="table">
    <table style="width:80%" align="center">
      <xsl:apply-templates/>
    </table>
  </xsl:template>
  <xsl:template match="thead">
    <thead>
      <xsl:apply-templates select="trow">
        <xsl:with-param name="head" select="1"/>
      </xsl:apply-templates>
    </thead>
  </xsl:template>
  <xsl:template match="tbody">
    <tbody>
      <xsl:apply-templates select="trow">
        <xsl:with-param name="head" select="0"/>
      </xsl:apply-templates>
    </tbody>
  </xsl:template>
  <xsl:template match="trow">
    <xsl:param name="head" select="1"/>
    <tr>
      <xsl:apply-templates select="tcell">
        <xsl:with-param name="head" select="$head"/>
      </xsl:apply-templates>
    </tr>	
  </xsl:template>
  <xsl:template match="tcell">
    <xsl:param name="head" select="0"/>
    <xsl:choose>
      <xsl:when test="$head = 1">
        <th><xsl:apply-templates/></th>
      </xsl:when>
      <xsl:otherwise>
        <td><xsl:apply-templates/></td>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="bnf">
    <table class="bnf">
      <tr>
        <td valign="top" align="right" width="20%">
          <xsl:apply-templates select="term"/>
        </td>
        <td valign="top" align="center" width="5%">
          <span style="font-family:monospace">::=</span>
        </td>
        <td valign="top" align="left">
          <xsl:apply-templates select="def"/>
        </td>
      </tr>
    </table>
  </xsl:template>
  <xsl:template match="term">
    <span class="term"><xsl:apply-templates/></span>
  </xsl:template>
  <xsl:template match="value">
    <span class="value"><xsl:apply-templates/></span>
  </xsl:template>
  <xsl:template match="def">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="group">
    ( <xsl:apply-templates/> )
  </xsl:template>
  <xsl:template match="repetitive">
    { <xsl:apply-templates/> }
  </xsl:template>
  <xsl:template match="repetitive[@count &gt; 0]">
    { <xsl:apply-templates/> }<sup>+</sup>
  </xsl:template>
  <xsl:template match="or[@multiline=0]">
    <xsl:for-each select="choice">
      <xsl:apply-templates/> 
      <xsl:if test="position() != last()">
        |
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="or[@multiline=1]">
    <xsl:for-each select="choice">
      <xsl:apply-templates/> 
      <xsl:if test="position() != last()">
        <br/>|
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="optional">
    [ <xsl:apply-templates/> ]
  </xsl:template>
  <xsl:template match="command-option-group|dict">
    <dl compact="compact">
      <xsl:apply-templates/>
    </dl>
  </xsl:template>
  <xsl:template match="c-option">
    <dt>
      <xsl:apply-templates/>
    </dt>
  </xsl:template>
  <xsl:template match="command-option">
      <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="mc-option">
    <span style="font-weight:bold;font-family:monospaced">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
  <xsl:template match="c-param">
    <span style="font-weight:bold;font-style:italic">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
  <xsl:template match="option-description">
    <dd>
      <xsl:apply-templates/>
    </dd>
  </xsl:template>
  <xsl:template match="dict-term">
    <dt>
      <strong>
        <xsl:apply-templates/>
      </strong>
    </dt>
  </xsl:template>
  <xsl:template match="dict-art">
    <dd>
      <xsl:apply-templates/>
    </dd>
  </xsl:template>
  <xsl:template name="notes">
    <xsl:for-each select="//note">
      <div style="border: black solid thin;padding:10px 10px 10px 10px">
        <a>
          <xsl:attribute name="name">
            <xsl:value-of select="generate-id()"/>
          </xsl:attribute>
          <p style="font-weight:bold">Примечание <xsl:call-template name="NumberNote"/></p>
          <xsl:apply-templates/>
        </a>
      </div>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="NumberSection">
    <xsl:number level="multiple" count="section[@name]|subsection[@neednumber=1]"/>
  </xsl:template>
  <xsl:template name="NumberNote">
    <xsl:number level="single" count="note"/>
  </xsl:template>
</xsl:stylesheet>
