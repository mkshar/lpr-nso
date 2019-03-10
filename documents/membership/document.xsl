<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY css SYSTEM "document.css">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="no" omit-xml-declaration="yes"/>
	
	<xsl:variable name="cr" select="'&#13;'"/>
	<xsl:variable name="tab" select="'&#9;'"/>

	<xsl:template match="br"><br/></xsl:template>
	
	<xsl:template match="jurisdiction">
		<xsl:element name="a">
			<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
			<xsl:value-of select="$cr"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<div class="document-jurisdiction">
				<xsl:apply-templates/>
				<xsl:value-of select="$tab"/>
			</div>
			<xsl:value-of select="$cr"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="name">
		<div class="name">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	
	<xsl:template match="title">
		<div class="document-title">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	
	<xsl:template match="history">
		<div class="controls">
			<button onclick="document.getElementById('history').style.display='none';">Скрыть историю редакций</button>
			<br/>
			<br/>
		</div>
		<table>
			<tr><th width="15%">Редакция</th><th width="15%">Дата</th><th width="15%">Автор</th><th>Описание</th></tr>
			<xsl:for-each select="revision">
				<tr>
					<td class="id">         <xsl:value-of select="@id"/>     </td>
					<td class="date">       <xsl:value-of select="@date"/>   </td>
					<td class="authors">    <xsl:value-of select="@authors"/></td>
					<td class="description"><xsl:value-of select="."/>       </td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	
	<xsl:template match="date">
		<span class="document-date">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	
	<xsl:template match="note">
		<div class="note">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	
	<xsl:template match="chapter-header">
		<div class="chapter-header">
			<xsl:value-of select="$cr"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:element name="a">
				<xsl:attribute name="name">
					<xsl:value-of select="id"/>
				</xsl:attribute>
			</xsl:element>
			<xsl:element name="a">
				<xsl:attribute name="href">#<xsl:value-of select="id"/></xsl:attribute>
				<span class="id"><xsl:value-of select="id"/></span>
			</xsl:element>
			<xsl:value-of select="$cr"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<span class="title"><xsl:value-of select="title"/></span>
			<xsl:value-of select="$cr"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
		</div>
		<xsl:comment>chapter-header</xsl:comment>
	</xsl:template>
	
	<xsl:template match="chapter">
		<div class="chapter">
			<xsl:apply-templates/>
		</div>
		<xsl:comment>chapter</xsl:comment>
	</xsl:template>
	
	<xsl:template match="articles">
		<div class="articles">
			<xsl:apply-templates/>
		</div>
		<xsl:comment>articles</xsl:comment>
	</xsl:template>
	
	<xsl:template match="subarticles">
		<xsl:value-of select="$tab"/>
		<xsl:value-of select="$tab"/>
		<xsl:value-of select="$tab"/>
		<xsl:value-of select="$tab"/>
		<xsl:value-of select="$tab"/>
		<xsl:value-of select="$tab"/>
		<div class="subarticles">
			<xsl:apply-templates/>
		</div>
		<xsl:comment>subarticles</xsl:comment>
		<xsl:value-of select="$cr"/>
	</xsl:template>
	
	<xsl:template match="article">
		<div class="article">
			<xsl:value-of select="$cr"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:element name="a">
				<xsl:attribute name="name">
					<xsl:value-of select="id"/>
				</xsl:attribute>
			</xsl:element>
			<xsl:element name="a">
				<xsl:attribute name="href">#<xsl:value-of select="id"/></xsl:attribute>
				<span class="id"><xsl:value-of select="id"/></span>
			</xsl:element>
			<xsl:value-of select="$cr"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<span class="text"><xsl:value-of select="text"/></span>
			<xsl:value-of select="$cr"/>
			<xsl:apply-templates select="subarticles"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
		</div>
		<xsl:comment>article</xsl:comment>
	</xsl:template>
	
	<xsl:template match="subarticle">
		<div class="subarticle">
			<xsl:value-of select="$cr"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:element name="a">
				<xsl:attribute name="name">
					<xsl:value-of select="id"/>
				</xsl:attribute>
			</xsl:element>
			<xsl:element name="a">
				<xsl:attribute name="href">#<xsl:value-of select="id"/></xsl:attribute>
				<span class="id"><xsl:value-of select="id"/></span>
			</xsl:element>
			<xsl:value-of select="$cr"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<span class="text"><xsl:value-of select="text"/></span>
			<xsl:value-of select="$cr"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="$tab"/>
		</div>
		<xsl:comment>subarticle</xsl:comment>
	</xsl:template>
	
	<xsl:template match="document-container">
		<html lang="ru">
			<xsl:value-of select="$cr"/>
			<xsl:value-of select="$tab"/>
			<head>
				<xsl:value-of select="$cr"/>
				<xsl:value-of select="$tab"/>
				<xsl:value-of select="$tab"/>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
				<xsl:value-of select="$cr"/>
				<xsl:value-of select="$tab"/>
				<xsl:value-of select="$tab"/>
				<meta name="viewport" content="width=device-width, initial-scale=1.0" />
				<xsl:value-of select="$cr"/>
				<xsl:value-of select="$tab"/>
				<xsl:value-of select="$tab"/>
				<title>
					<xsl:value-of select="document/name"/>
				</title>
				<xsl:value-of select="$cr"/>
				<xsl:value-of select="$cr"/>
				<xsl:comment>STYLESHEET</xsl:comment>
				<xsl:value-of select="$cr"/>
				<style type="text/css"><xsl:value-of select="$cr"/>&css;</style>
				<xsl:value-of select="$cr"/>
				<xsl:comment>END-OF-STYLESHEET</xsl:comment>
				<xsl:value-of select="$cr"/>
				<xsl:value-of select="$cr"/>
				<xsl:value-of select="$tab"/>
			</head>
			<xsl:value-of select="$cr"/>
			<xsl:value-of select="$tab"/>
			<body>
			
				<xsl:value-of select="$cr"/>
				<xsl:value-of select="$cr"/>
				<xsl:comment>DATA</xsl:comment>
				<xsl:value-of select="$cr"/>
				
				<div class="container">
					<xsl:value-of select="$cr"/>
					<xsl:value-of select="$tab"/>
					<div class="document">
						<xsl:value-of select="$cr"/>
						<xsl:value-of select="$tab"/>
						<xsl:value-of select="$tab"/>
						<div class="document-header">
						<xsl:apply-templates select="document/header"/>
						<xsl:value-of select="$tab"/>
						<xsl:value-of select="$tab"/>
						</div><xsl:comment>document-header</xsl:comment>
						<xsl:value-of select="$cr"/>
						<xsl:value-of select="$tab"/>
						<xsl:value-of select="$tab"/>
						<div class="document-body">
						<xsl:apply-templates select="document/body"/>
						</div><xsl:comment>document-body</xsl:comment>
						<xsl:value-of select="$cr"/>
						<xsl:value-of select="$tab"/>
					</div><xsl:comment>document</xsl:comment>
					<xsl:value-of select="$cr"/>
					<xsl:value-of select="$tab"/>
					<div class="history" id="history">
						<xsl:apply-templates select="history"/>
						<xsl:value-of select="$cr"/>
						<xsl:value-of select="$tab"/>
					</div><xsl:comment>history</xsl:comment>
					<xsl:value-of select="$cr"/>
				</div><xsl:comment>container</xsl:comment>
				<xsl:value-of select="$cr"/>
				<xsl:comment>END-OF-DATA</xsl:comment>
				
				<xsl:value-of select="$cr"/>
				<xsl:value-of select="$cr"/>
				<xsl:value-of select="$tab"/>
				
			</body>
			<xsl:value-of select="$cr"/>
		</html>
	</xsl:template>

</xsl:stylesheet>
