<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/player.xsl"/>
	<xsl:import href="../utilities/master.xsl"/>
	<xsl:import href="../utilities/format-date.xsl"/>
	<xsl:import href="../utilities/sidebar.xsl"/>
	
	<xsl:template match="data" mode="main">
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
			</article>
			<hr/>
			<p>
				<xsl:choose>
					<xsl:when test="/data/post/entry/categories != ''">
						About <xsl:for-each select="post/entry/categories/item">
							<xsl:if test="position()=last() and count(../item) &gt; 1">and
							</xsl:if>
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">,
							</xsl:if>
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
			</p>
			<form method="post" enctype="multipart/form-data">
				<input name="fields[name]" type="text" placeholder="Your name" required="required"/><br/>
				<input name="fields[email]" type="email" placeholder="Your e-mail address (to prevent spam)" required="required"/>
				<br/>
				<textarea name="fields[comment]" rows="15" cols="100" required="required" placeholder="Your comment"></textarea><br/>
				<input name="MAX_FILE_SIZE" type="hidden" value="5242880"/>
				<input name="fields[commented-on]" type="hidden" value="{$ds-post}"/>
				<input name="send-email[subject]" value="New blog comment" type="hidden"/>
				<input name="send-email[body]" value="fields[comment]" type="hidden"/>
				<input name="send-email[recipient]" value="tim" type="hidden"/>
				<input name="akismet[author]" value="name" type="hidden"/>
				<input name="akismet[url]" value="comment" type="hidden"/>
				<input name="akismet[email]" value="email" type="hidden"/>
				<input name="action[save-comment]" type="submit" value="Submit"/>
				<!--<input name="redirect" type="hidden" value="success/"/>-->
			</form>
			<!--iterate over comments-->
			<xsl:if test="/data/comments/entry">
				<h3>Comments</h3>
				<xsl:for-each select="comments/entry">
					<div class="comment"><xsl:value-of select="name"/> said:<br/>
					<xsl:value-of select="comment" disable-output-escaping="yes"/></div>
				</xsl:for-each>
			</xsl:if>
		</section>
	</xsl:template>
</xsl:stylesheet>