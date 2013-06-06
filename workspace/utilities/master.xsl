<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="page-title.xsl"/>
<xsl:import href="format-date.xsl"/>
<xsl:output method="html" omit-xml-declaration="yes" indent="no" />
<xsl:variable name="is-logged-in" select="/data/events/login-info/@logged-in"/>
<xsl:template match="/">
	<xsl:text disable-output-escaping="yes">&lt;</xsl:text>!DOCTYPE html<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
	<html lang="en">
		<head>
			<!-- Start Page Data -->
			<meta charset="utf-8" />
			<meta name="description" content="Web development blog by Tim Stone." />
			<meta name="author" content="Tim Stone"/>
			<meta name="robots" content="index, follow"/>
			<meta name="viewport" content="width=device-width, initial-scale=1" />
			<title><!--<xsl:call-template name="page-title"/>-->Tim Stone's Blog</title>
			<!-- End Page Data -->
			<link rel="shortcut icon" href="/favicon.ico" />
			<link rel="icon" type="images/png" href="/favicon.png" />
			<link href="{$workspace}/css/aestheti.css" rel="stylesheet" type="text/css" media="screen" />
			<link href='http://fonts.googleapis.com/css?family=Patua+One|Sorts+Mill+Goudy:400,400italic' rel='stylesheet' type='text/css' />
			<link rel="alternate" type="application/rss+xml" title="Tim's News Feed" href="http://fetimo.com/blog/rss-feed/"/>
			<!--[if lte IE 9]>
				<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
			<![endif]-->
			<!--Hey fellow source code explorer! Looking at a site's source is a great way to learn how it works, if you can't figure something out just ask me and I'll do my best to explain and help you-->
		</head>
		<body>
			<section class="social">
			    <section class="social-inner">
			        <h1>Linkies</h1>
			        <nav>
				        <a href="http://fetimo.com/">
				        	<img src="{$workspace}/images/home.svg" class="home" alt="Home icon" />
				        </a>
				        <a href="https://github.com/fetimo">GitHub</a>
				        <a href="http://www.last.fm/user/nitesshadow">Last.fm</a>
				        <a href="http://uk.linkedin.com/in/fetimo">LinkedIn</a>
				        <a href="https://twitter.com/timofetimo">Twitter</a>
			        </nav>
			    </section>
			    <section class="about">
			    	<h1>About</h1>
			    	<p>Hi, I'm a front–end developer working at <a href="http://redweb.com/">Redweb</a>. I also write for <a href="http://www.webdesignermag.co.uk/">Web Designer magazine</a> and co-host a local web/pub meet called <a href="http://bwmeet.co.uk/">B &amp; W Meet</a>.</p>
			    </section>
			</section>
			<img src="{$workspace}/images/link.svg" width="40" height="21" class="links button" alt="Opens dropdown of extra links" />
			
			<main id="container" role="main">
				<!-- Start Content -->
				<xsl:apply-templates mode="main"/>
				<!-- End Content -->
			</main>
			<!--<footer class="cf">
			</footer>-->
			<script src="{$workspace}/js/blog.js" defer="true" async="async"></script>
			<!-- Piwik -->
			<script>
			  var _paq = _paq || [];
			  _paq.push(["trackPageView"]);
			  _paq.push(["enableLinkTracking"]);
			
			  (function() {
			    var u=(("https:" == document.location.protocol) ? "https" : "http") + "://analytics.fetimo.com/";
			    _paq.push(["setTrackerUrl", u+"piwik.php"]);
			    _paq.push(["setSiteId", "1"]);
			    var d=document, g=d.createElement("script"), s=d.getElementsByTagName("script")[0]; g.type="text/javascript";
			    g.defer=true; g.async=true; g.src=u+"piwik.js"; s.parentNode.insertBefore(g,s);
			  })();
			</script>
			<!-- End Piwik Code -->
		</body>
	</html>
</xsl:template>
<xsl:strip-space elements="*"/>
</xsl:stylesheet>