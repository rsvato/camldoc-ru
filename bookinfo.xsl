<?xml version="1.0" encoding="windows-1251"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1"
  xmlns:saxon="http://saxon.sf.net">
  <xsl:param name="default.encoding" select="'windows-1251'"></xsl:param>
<xsl:param name="htmlhelp.encoding" select="'windows-1251'"></xsl:param>
<xsl:param name="saxon.character.representation" select="'native'"/>
	 <xsl:param name="chunker.output.encoding" select="'windows-1251'"/>
	 <xsl:param name="site.build" select="false">
	<xsl:output encoding="windows-1251" method="html" indent="yes"/>
	
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
					<![CDATA[<!--
						body{
							background-color:#fff;
							font-family:verdana,arial,sans-serif,*;
							font-size:10px;
						}
						li{
							font-family:verdana,arial,sans-serif,*;
						}
						a{
							color:black;
							text-decoration:none;
						}
						a:visited{
							color:black;
						}
						a:hover{
							color:#00e;
						}
					-->]]>
				</style>
			</head>
			<body>
				<div style="margin-top:90px;margin-left:15px;margin-right:15px;background-color:#eee;padding-left:10px;">
				<xsl:apply-templates/>
				</div>
				<xsl:if test="${site.build} = 'true'">
				<div id="counter" style="position:relative;margin-top:15px" align="center">
                                  <xsl:text disable-output-escaping="yes"><![CDATA[
<!-- SpyLOG f:0211 -->
<script language="javascript"><!--
Mu="u5437.05.spylog.com";Md=document;Mnv=navigator;Mp=0;
Md.cookie="b=b";Mc=0;if(Md.cookie)Mc=1;Mrn=Math.random();
Mn=(Mnv.appName.substring(0,2)=="Mi")?0:1;Mt=(new Date()).getTimezoneOffset();
Mz="p="+Mp+"&rn="+Mrn+"&c="+Mc+"&t="+Mt;
if(self!=top){Mfr=1;}else{Mfr=0;}Msl="1.0";
//--></script><script language="javascript1.1"><!--
Mpl="";Msl="1.1";Mj = (Mnv.javaEnabled()?"Y":"N");Mz+='&j='+Mj;
//--></script><script language="javascript1.2"><!--
Msl="1.2";Ms=screen;Mpx=(Mn==0)?Ms.colorDepth:Ms.pixelDepth;
Mz+="&wh="+Ms.width+'x'+Ms.height+"&px="+Mpx;
//--></script><script language="javascript1.3"><!--
Msl="1.3";//--></script><script language="javascript"><!--
My="";My+="<a href='http://"+Mu+"/cnt?cid=543705&f=3&p="+Mp+"&rn="+Mrn+"' target='_blank'>";
My+="<img src='http://"+Mu+"/cnt?cid=543705&"+Mz+"&sl="+Msl+"&r="+escape(Md.referrer)+"&fr="+Mfr+"&pg="+escape(window.location.href);
My+="' border=0 width=88 height=31 alt='SpyLOG'>";
My+="</a>";Md.write(My);//--></script><noscript>
<a href="http://u5437.05.spylog.com/cnt?cid=543705&f=3&p=0" target="_blank">
<img src="http://u5437.05.spylog.com/cnt?cid=543705&p=0" alt='SpyLOG' border='0' width=88 height=31 >
</a></noscript>
<!-- SpyLOG -->&nbsp;
<!--Rating@Mail.ru COUNTER--><a target="_top" href="http://top.mail.ru/jump?from=656088"><img src="http://top.list.ru/counter?id=656088;t=217" border="0" height="31" width="88" alt="Рейтинг@Mail.ru"/></a><!--/COUNTER-->]]></xsl:text>

				</div>
				</xsl:if>
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
			<xsl:apply-templates select="main-author"/><br/>
			(а также
			 	<xsl:for-each select="sec-author">
					<xsl:if test="position() = last()">
					и 
					</xsl:if>
					<xsl:apply-templates/><xsl:if test="position() &lt; last() - 1">,<xsl:text>&#0160;</xsl:text>
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
				<xsl:value-of select="concat('http://ocaml.spb.ru/ref/', @file)"/>
			</xsl:attribute>
			<h2>Глава <xsl:call-template name="NumberChaps"/>.
			<xsl:value-of select="chapter/@name"/>
			<xsl:if test="$nf &gt; 0">
				<span style="color:red">
					не закончено
				</span>
			</xsl:if>
		</h2></a>
		<ul>
			<xsl:for-each select="./chapter/main-matters/section[@name]">
				<li><xsl:value-of select="@name"/></li>
			</xsl:for-each>
		</ul>
		
	</xsl:template>
	<xsl:template name="NumberParts">
		<xsl:number count="part"/>
	</xsl:template>
	<xsl:template name="NumberChaps">
		<xsl:number level="any" count="//part/chap"/>
	</xsl:template>
</xsl:stylesheet>
