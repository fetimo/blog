<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:import href="../utilities/rss.xsl" />
	
	<xsl:template match="data">
		<xsl:call-template name="rss">
		    <xsl:with-param name="title" select="'News feed'" />
		    <xsl:with-param name="description" select="'The news feed for Fetimo'" />
		    <xsl:with-param name="link" select="concat($root, '/blog/')" />
		    <xsl:with-param name="link-feed" select="concat($root, '/blog/feed/')" />
		    <xsl:with-param name="language" select="'en'" />
		    <xsl:with-param name="items" select="rss/entry" />
		    <xsl:with-param name="item-contentnode" select="'body'" />
		    <xsl:with-param name="item-datenode" select="'date'" />
		    <xsl:with-param name="item-titlenode" select="'title'" />
		    <xsl:with-param name="item-link" select="concat($root, '/blog/$/')" />
		    <xsl:with-param name="item-link-part" select="'title/@handle'" />
		    <xsl:with-param name="timezone" select="'+0000'" />
		</xsl:call-template>
	</xsl:template>

</xsl:stylesheet>