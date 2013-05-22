<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="data" name="sidebar" mode="sidebar">
		
		<!--<form action="/search/" method="get">
		    <label>Search:<br/><input type="text" name="keywords" /></label>
		    <input type="hidden" name="sort" value="score-recency" />
		    <input type="hidden" name="per-page" value="10" />
		    <input type="hidden" name="sections" value="articles,comments,categories" />
		</form>-->
		
		<h3>Categories</h3>
		<!--only display unique categories-->
		<xsl:for-each select="archive-months/year/month/entry/categories/item[not(.=preceding::item)]">
			<xsl:sort/>
			<xsl:variable name="category" select="./@handle"/>
			<a href="{$root}/category/{$category}"><xsl:value-of select="."/></a><br/>
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
			</xsl:call-template></a><br/>
		</xsl:for-each>
		
	</xsl:template>
</xsl:stylesheet>