<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="text()[contains(.,'youtube.com/watch?v=') or contains(.,'youtube.com/v/') or contains(.,'vimeo.com/')]" mode="html">
        <xsl:param name="video" select="."/>
        <xsl:param name="video-id">
            <xsl:choose>
                <xsl:when test="contains($video,'youtube.com/watch?v=')">
                    <xsl:value-of select="substring-after($video,'youtube.com/watch?v=')"/>
                </xsl:when>
                <xsl:when test="contains($video,'youtube.com/v/')">
                    <xsl:value-of select="substring-after($video,'youtube.com/v/')"/>
                </xsl:when>
                <xsl:when test="contains($video,'vimeo.com')">
                    <xsl:value-of select="substring-after($video,'vimeo.com/')"/>
                </xsl:when>
            </xsl:choose>
        </xsl:param>
        <xsl:param name="width" select="'100%'"/>
        <xsl:param name="height" select="'500'"/>
        <xsl:param name="color" select="'ffffff'"/>
        <xsl:param name="title" select="'1'"/>
        <xsl:param name="byline" select="'0'"/>
        <xsl:param name="portrait" select="'0'"/>
        <xsl:param name="frameborder" select="'0'"/>

        <div class="video-container">
            <xsl:choose>
                <xsl:when test="contains($video,'youtube.com')">
                    <iframe class="youtube-player" type="text/html" width="{$width}" height="{$height}" src="http://www.youtube.com/embed/{$video-id}" frameborder="0">
                        <xsl:comment> YouTube Player </xsl:comment>
                    </iframe>
                </xsl:when>
                <xsl:when test="contains($video,'vimeo.com')">
                    <iframe class="vimeo-player" type="text/html" width="{$width}" height="{$height}" src="http://player.vimeo.com/video/{$video-id}?title={$title}&amp;byline={$byline}&amp;portrait={$portrait}&amp;color={$color}" frameborder="{$frameborder}">
                        <xsl:comment> Vimeo Player </xsl:comment>
                    </iframe> 
                </xsl:when>
            </xsl:choose>
        </div>

    </xsl:template>


</xsl:stylesheet>