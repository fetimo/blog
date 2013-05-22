<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:import href="../utilities/master.xsl"/>
	<xsl:import href="../utilities/format-date.xsl"/>
	
	<xsl:template match="data" mode="main">
		
		<xsl:choose>
			<xsl:when test="$article = ''"><!--main page-->
				<section class="accompanied">
					<xsl:for-each select="posts/entry">
						<xsl:sort select="date" order="descending"/>
						<article>
							<xsl:variable name="post-title" select="title/@handle"/>
							<h2><a href="{$root}/post/{$post-title}"><xsl:value-of select="title"/></a></h2>
							<p class="date">
								<xsl:call-template name="format-date">
									<xsl:with-param name="date" select="date"/>
									<xsl:with-param name="format" select="'M D, Y'"/>
								</xsl:call-template>
							</p>
							<em>
								<xsl:choose>
									<xsl:when test="categories != ''">
										About <xsl:for-each select="categories/item">
											<xsl:if test="position()=last() and count(../item) &gt; 1">and
											</xsl:if>
											<xsl:value-of select="."/>
											
											<xsl:if test="position()!=last()">,
											</xsl:if>
											
										</xsl:for-each>,
									</xsl:when>
									<xsl:otherwise>
										This post is a black sheep and hasn't been categorised, also
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="@comments = 0">
										there are no comments (yet!).
									</xsl:when>
									<xsl:when test="@comments = 1">
										there is 1 comment.
									</xsl:when>
									<xsl:otherwise>
										there are <xsl:value-of select="@comments"/> comments.
									</xsl:otherwise>
								</xsl:choose>
							</em>
						</article>
					</xsl:for-each>
					<aside>
						<xsl:call-template name="sidebar"/>
					</aside>
				</section>
			</xsl:when>
			
			<xsl:otherwise><!--single post-->
				<section>
					<article class="solo">
						<xsl:variable name="post-title" select="post/entry/title/@handle"/>
						<xsl:variable name="post-title-display" select="post/entry/title"/>
						<h2><xsl:value-of select="$post-title-display"/></h2>
						<p class="date">
							<xsl:call-template name="format-date">
								<xsl:with-param name="date" select="post/entry/date"/>
								<xsl:with-param name="format" select="'M D, Y'"/>
							</xsl:call-template>
						</p>
						<xsl:copy-of select="post/entry/body/*"/>
						<br/>
						<xsl:choose>
							<xsl:when test="categories != ''">
								Posted in <xsl:for-each select="post/entry/categories/item">
								<xsl:value-of select="."/>,&#160;			
								</xsl:for-each>.
							</xsl:when>
							<xsl:otherwise>
								This post is a black sheep and hasn't been categorised.
							</xsl:otherwise>
						</xsl:choose>
						<xsl:variable select="count(/data/comments/entry)" name="number-of-comments"/>
						<xsl:choose>
							<xsl:when test="$number-of-comments = 0">
								There are no comments (yet!).
							</xsl:when>
							<xsl:when test="$number-of-comments = 1">
								There is 1 comment.
							</xsl:when>
							<xsl:otherwise>
								There are <xsl:value-of select="$number-of-comments"/> comments.
							</xsl:otherwise>
						</xsl:choose>
						<form method="post" enctype="multipart/form-data">
							<input name="MAX_FILE_SIZE" type="hidden" value="5242880"/>
							<label>Name:
								<input name="fields[name]" type="text" placeholder="Your name" required="required"/>
							</label><br/>
							<textarea name="fields[comment]" rows="15" cols="100" required="required" placeholder="Your comment"></textarea><br/>
							<input name="fields[commented-on]" type="hidden" value="{$ds-post}"/>
							<input name="send-email[subject]" value="New blog comment" type="hidden"/>
							<input name="send-email[body]" value="fields[comment]" type="hidden"/>
							<input name="send-email[recipient]" value="tim" type="hidden"/>
							<input name="akismet[name]" value="name" type="hidden"/>
							<input name="akismet[comment]" value="comment" type="hidden"/>
							<input name="action[save-comment]" type="submit" value="Submit"/>
							<!--<input name="redirect" type="hidden" value="success/"/>-->
						</form>
					</article>
					
					<!--iterate over comments-->
					<xsl:if test="/data/comments/entry">
						<h3>Comments</h3>
						<xsl:for-each select="comments/entry">
							<p class="comment"><xsl:value-of select="name"/> said:<br/>
							<xsl:value-of select="comment"/></p>
						</xsl:for-each>
					</xsl:if>
				</section>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="data" name="sidebar" mode="sidebar">
		<!--<form action="/search/" method="get">
		    <label>Search:<br/><input type="text" name="keywords" /></label>
		    <input type="hidden" name="sort" value="score-recency" />
		    <input type="hidden" name="per-page" value="10" />
		    <input type="hidden" name="sections" value="articles,comments,categories" />
		</form>-->
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
		
		<h3>Categories</h3>
		<!--only display unique categories-->
		<xsl:for-each select="archive-months/year/month/entry/categories/item[not(.=preceding::item)]">
			<xsl:sort/>
			<xsl:variable name="category" select="./@handle"/>
			<a href="{$root}/category/{$category}"><xsl:value-of select="."/></a><br/>
		</xsl:for-each>
		
	</xsl:template>
	
</xsl:stylesheet>