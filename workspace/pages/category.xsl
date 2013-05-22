<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="../utilities/master.xsl"/>
	<xsl:import href="../utilities/format-date.xsl"/>
	<xsl:import href="../utilities/sidebar.xsl"/>
	<xsl:template match="data" mode="main">		
		<section class="accompanied">
			<xsl:choose>
				<xsl:when test="archive-months/year/month/entry/categories/item/@handle = $category">
					<xsl:for-each select="category-posts/entry">
						<xsl:sort select="date" order="descending"/>
						<article>
							<xsl:variable name="post-title" select="title/@handle"/>
							<h2><a href="{$root}/post/{$post-title}"><xsl:value-of select="title"/></a></h2>
							<time>
								<xsl:call-template name="format-date">
									<xsl:with-param name="date" select="date"/>
									<xsl:with-param name="format" select="'M D, Y'"/>
								</xsl:call-template>
							</time>
							<em>
								<xsl:choose>
									<xsl:when test="categories != ''">
										About <xsl:for-each select="categories/item">
											<xsl:if test="position()=last() and count(../item) &gt; 1">and
											</xsl:if>
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>,
									</xsl:when>
									<xsl:otherwise>
										This post is a black sheep and hasn't been categorised, also
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="count(/data/comments/entry/commented-on/item[@handle=$post-title]) = 0">
										there are no comments (yet!).
									</xsl:when>
									<xsl:when test="count(/data/comments/entry/commented-on/item[@handle=$post-title]) = 1">
										there is 1 comment.
									</xsl:when>
									<xsl:otherwise>
										there are <xsl:value-of select="count(/data/comments/entry/commented-on/item[@handle=$post-title])"/> comments.
									</xsl:otherwise>
								</xsl:choose>
							</em>
						</article>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>nope</xsl:otherwise>
			</xsl:choose>
			<aside>
				<xsl:call-template name="sidebar"/>
			</aside>
		</section>
	</xsl:template>
</xsl:stylesheet>