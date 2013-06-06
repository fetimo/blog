<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:import href="../utilities/master.xsl"/>
	<xsl:import href="../utilities/format-date.xsl"/>

<xsl:template match="data" mode="main">
	<h1><xsl:value-of select="$page-title"/></h1>
	<xsl:choose>
		<xsl:when test="search/pagination/@total-entries &gt; 0">
			<xsl:choose>
				<xsl:when test="search/pagination/@total-entries = 1">
					<p>Here's 1 result for <xsl:value-of select="search/@keywords"/>:</p>
				</xsl:when>
				<xsl:otherwise>
					<p>Here are <xsl:value-of select="search/pagination/@total-entries"/> results for <xsl:value-of select="search/@keywords"/>:</p>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:when>
		<xsl:otherwise>
			<p>Sorry, there were no search results for <xsl:value-of select="search/@keywords"/>.</p>
		</xsl:otherwise>
	</xsl:choose>
		
	<ol class="search-results">
		<xsl:for-each select="search/entry">
			<li>
				<xsl:variable name="post" select="@id"/>
				<xsl:for-each select="/data/search-result-articles/entry">
					<xsl:if test="$post = @id">
						<xsl:variable name="title" select="title/@handle"/>
						<h3><a href="{$root}/post/{$title}"><xsl:value-of select="title"/></a></h3>
					</xsl:if>
				</xsl:for-each>
				<xsl:copy-of select="excerpt/p"/>
			</li>
		</xsl:for-each>
	</ol>
	<xsl:if test="search/pagination/@total-pages &gt; 1">
		<div class="pagination">
			<xsl:variable name="next" select="search/pagination/@current-page + 1"/>
			<xsl:variable name="previous" select="search/pagination/@current-page - 1"/>
			<xsl:variable name="keyword" select="search/@keywords"/>
			<xsl:variable name="per-page" select="search/pagination/@entries-per-page"/>
			
			<xsl:if test="$previous &gt; 0">
				<a href="{$root}/search/?keywords={$keyword}&amp;page={$previous}&amp;per-page={$per-page}">previous page</a>
			</xsl:if>
			<xsl:if test="$next &lt;= search/pagination/@total-pages">
				<a href="{$root}/search/?keywords={$keyword}&amp;page={$next}&amp;per-page={$per-page}">next page</a>
			</xsl:if>
		</div>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>