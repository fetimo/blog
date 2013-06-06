<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="data" name="sidebar" mode="sidebar">
		<h3>Categories</h3>
		<!--only display unique categories-->
		<xsl:for-each select="archive-months/year/month/entry/categories/item[not(.=preceding::item)]">
			<xsl:sort/>
			<xsl:variable name="category" select="./@handle"/>
			<a href="{$root}/category/{$category}"><xsl:value-of select="."/></a>
		</xsl:for-each>		
		
		<h3>Archives</h3>
		<xsl:for-each select="archive-months/year">
			<xsl:sort select="@value" data-type="number" order="descending"/>
			<xsl:variable name="year">
				<xsl:call-template name="format-date">
					<xsl:with-param name="date" select="month/entry/date"/>
					<xsl:with-param name="format" select="'Y'"/>
				</xsl:call-template>
			</xsl:variable>
			<a href="{$root}/archive/{$year}"><xsl:call-template name="format-date">
				<xsl:with-param name="date" select="month/entry/date"/>
				<xsl:with-param name="format" select="'Y'"/>
			</xsl:call-template></a>
		</xsl:for-each>
		
		<form action="/search/" method="get" class="search-form">
		    <h3><label for="keywords">Search</label></h3>
		    <input type="text" name="keywords" id="keywords" />
		    <input type="hidden" name="per-page" value="10" />
		</form>
	</xsl:template>
</xsl:stylesheet>