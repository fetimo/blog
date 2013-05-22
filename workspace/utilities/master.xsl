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
			<title><xsl:call-template name="page-title"/></title>
			<!-- End Page Data -->
			<link rel="shortcut icon" href="/favicon.ico" />
			<link rel="icon" type="images/png" href="/favicon.png" />
			<link href="{$workspace}/css/aestheti.css" rel="stylesheet" type="text/css" media="screen" />
			<link href='http://fonts.googleapis.com/css?family=Patua+One|Sorts+Mill+Goudy:400,400italic' rel='stylesheet' type='text/css' />
			<link rel="alternate" type="application/rss+xml" title="Tim's News Feed" href="http://fetimo.com/blog/rss-feed/"/>
			<!--[if lte IE 9]>
				<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
				<script>
					//getElementById('search').setAttribute("value","Search");
				</script>
			<![endif]-->
			<!--Hey fellow source code explorer! Looking at a site's source is a great way to learn how it works, if you can't figure something out just ask me through the contact form and I'll do my best to explain and help you-->
		</head>
		<body>
			<nav>
				<section class="social">
				    <section class="social-inner">
				        <h1>Linkies</h1>
				        <a href="http://fetimo.com/"><svg xml:space="preserve" enable-background="new 12.5 18.511 100 87.978" viewBox="12.5 18.511 100 87.978" y="0px" x="0px" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" inkscape:version="0.48.3.1 r9886" version="1.1">
				        <path d="
				        	M62.289,18.522c-0.422,0.049-0.814,0.24-1.113,0.542L13.042,67.199c-0.728,0.734-0.721,1.92,0.014,2.647
				        	c0.349,0.345,0.819,0.539,1.31,0.541h10.168v34.236c0.003,1.028,0.836,1.861,1.865,1.865h12.666h17.418h12.035h17.869h12.215
				        	c1.028-0.004,1.861-0.837,1.865-1.865V70.388h10.168c1.034-0.004,1.869-0.845,1.865-1.879c-0.002-0.491-0.196-0.961-0.541-1.31
				        	l-11.733-11.733V39.401c-0.003-1.028-0.837-1.861-1.865-1.865h-7.942c-1.028,0.004-1.861,0.837-1.865,1.865v4.392L63.824,19.064
				        	C63.422,18.659,62.856,18.459,62.289,18.522z" inkscape:radius="1.9445436" sodipodi:type="inkscape:offset" inkscape:original="M -97 1117.625 L -147 1167.625 L -134.5 1167.625 L -134.5 1205.125 L -121.34375 1205.125 L -103.25 1205.125 L -90.75 1205.125 L -72.1875 1205.125 L -59.5 1205.125 L -59.5 1167.625 L -47 1167.625 L -59.75 1154.875 L -59.75 1137.375 L -68 1137.375 L -68 1146.625 L -97 1117.625 z " id="path4520-9"/>
				        </svg></a>
				        <a href="https://github.com/fetimo">GitHub</a>
				        <a href="http://www.last.fm/user/nitesshadow">Last.fm</a>
				        <a href="http://uk.linkedin.com/in/fetimo">LinkedIn</a>
				        <a href="https://twitter.com/timofetimo">Twitter</a>
				    </section>
				</section>
				<svg xml:space="preserve" enable-background="new 0 0 100 52" viewBox="0 0 100 52" y="0px" x="0px" id="Layer_1" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg" class="button">
				    <path d="M47.807,33.138c0.008-0.009,0.016-0.019,0.024-0.026c-0.009,0.007-0.018,0.015-0.026,0.023  C47.805,33.136,47.806,33.137,47.807,33.138z" fill="none"/>
				    <path d="M53.048,49.8c-0.274-0.071-0.545-0.152-0.815-0.232c-0.002,0.001-0.005,0.003-0.007,0.003  C52.485,49.648,52.76,49.726,53.048,49.8z" fill="none"/>
				    <path d="M36.33,35.501h-0.004c0.204,0.522,0.496,1.114,0.783,1.651h0.013C36.838,36.612,36.574,36.062,36.33,35.501z" fill="none"/>
				    <path d="M37.108,37.152c0.291,0.544,0.577,1.029,0.758,1.332c-0.263-0.436-0.508-0.882-0.746-1.332H37.108z" fill="#3F8AD4"/>
				    <path d="M38.062,38.804h0.006c-0.048-0.079-0.1-0.152-0.147-0.231C38.008,38.717,38.062,38.804,38.062,38.804z" fill="#3F8AD4"/>
				    <path d="M51.812,49.445c-0.631-0.197-1.249-0.424-1.856-0.669c-0.003,0.002-0.007,0.003-0.009,0.004  C50.007,48.805,50.728,49.104,51.812,49.445z" fill="#3F8AD4"/>
				    <path d="M52.226,49.57c0.002,0,0.005-0.002,0.007-0.003c-0.106-0.03-0.213-0.057-0.318-0.091  C52.016,49.509,52.12,49.541,52.226,49.57z" fill="#3F8AD4"/>
				    <path d="M74.458,0.955H59.321c-1.307,0-2.591,0.1-3.845,0.293c-0.273,0.042-0.541,0.101-0.811,0.151  c4.646,2.666,8.469,6.605,10.987,11.343h1.238h8.346c7.322,0,13.257,5.937,13.257,13.259c0,7.321-5.936,13.258-13.257,13.258h-9.516  h-1.958h-1.905h-0.006h-3.171c-3.305,0-6.324-1.212-8.646-3.212c0,0-0.003,0.003-0.003,0.003c0-0.002-0.001-0.002-0.002-0.003  c-0.494-0.414-0.886-0.802-1.206-1.148c-0.7-0.764-1.011-1.303-1.011-1.303c0.001-0.002,0.002-0.002,0.002-0.003  c-0.001-0.001-0.002-0.002-0.002-0.003c-1.505-2.15-2.389-4.766-2.389-7.589c0-2.746,0.834-5.296,2.263-7.413  c0.041-0.06,0.086-0.117,0.127-0.176c-1.736-1.473-3.978-2.367-6.429-2.367h-5.041c-1.325,3.052-2.067,6.416-2.067,9.956  c0,3.538,0.737,6.903,2.061,9.955c0.244,0.561,0.509,1.111,0.792,1.651c0.237,0.45,0.482,0.896,0.746,1.332  c0.02,0.033,0.036,0.059,0.054,0.088c0.047,0.079,0.099,0.152,0.147,0.231c2.792,4.463,6.948,7.98,11.888,9.973  c0.608,0.245,1.226,0.472,1.856,0.669c0.034,0.011,0.068,0.022,0.103,0.031c0.105,0.034,0.212,0.061,0.318,0.091  c0.27,0.08,0.541,0.161,0.815,0.232c0.004,0,0.006,0.002,0.01,0.003c2,0.513,4.096,0.787,6.254,0.787h15.137  c13.832,0,25.044-11.213,25.044-25.044C99.502,12.169,88.29,0.955,74.458,0.955z" fill="#3F8AD4"/>
				    <path d="M25.542,51.045h15.137c1.308,0,2.592-0.101,3.846-0.294c0.273-0.042,0.542-0.1,0.811-0.151  c-4.646-2.665-8.47-6.604-10.987-11.342H33.11h-8.346c-7.322,0-13.257-5.936-13.257-13.259c0-7.322,5.935-13.257,13.257-13.257  h9.516h1.957h1.905h0.007h3.17c3.304,0,6.323,1.212,8.645,3.212l0.002-0.003c0.001,0.001,0.001,0.002,0.002,0.003  c0.495,0.413,0.887,0.801,1.206,1.148c0.701,0.762,1.011,1.302,1.011,1.302c0,0.001-0.001,0.002-0.002,0.003  c0.001,0,0.002,0.001,0.003,0.003c1.505,2.15,2.39,4.766,2.39,7.588c0,2.746-0.835,5.297-2.264,7.412  c-0.041,0.062-0.085,0.118-0.127,0.176c1.736,1.474,3.979,2.369,6.429,2.369h5.042c1.324-3.053,2.065-6.417,2.065-9.957  c0-3.539-0.737-6.903-2.061-9.955c-0.244-0.561-0.509-1.111-0.792-1.651c-0.237-0.451-0.482-0.898-0.746-1.332  c-0.02-0.033-0.036-0.06-0.053-0.089c-0.048-0.078-0.099-0.153-0.147-0.23c-2.792-4.463-6.949-7.981-11.888-9.973  c-0.608-0.245-1.226-0.471-1.856-0.67c-0.034-0.011-0.068-0.021-0.103-0.032c-0.105-0.032-0.212-0.059-0.318-0.089  c-0.27-0.081-0.541-0.162-0.816-0.232c-0.004-0.001-0.006-0.001-0.009-0.002c-2-0.515-4.095-0.788-6.255-0.788H25.542  c-13.832,0-25.044,11.212-25.044,25.044C0.498,39.832,11.71,51.045,25.542,51.045z" fill="#3F8AD4"/>
				    <path d="M53.058,49.803c-0.003-0.001-0.006-0.003-0.01-0.003C53.052,49.8,53.055,49.802,53.058,49.803z" fill="#3F8AD4"/>
				    <path d="M51.812,49.445c0.034,0.011,0.068,0.022,0.103,0.031C51.881,49.468,51.847,49.456,51.812,49.445z" fill="#3F8AD4"/>
				    <path d="M47.805,33.141c0,0,0.311,0.539,1.011,1.303c0.005-0.006,0.01-0.012,0.016-0.015  c-0.369-0.407-0.709-0.84-1.025-1.291C47.807,33.139,47.806,33.139,47.805,33.141z" fill="#3F8AD4"/>
				    <path d="M37.92,38.572c-0.018-0.029-0.034-0.055-0.054-0.088C37.885,38.514,37.902,38.542,37.92,38.572z" fill="#3F8AD4"/>
				    <path d="M48.832,34.429c-0.006,0.003-0.011,0.009-0.016,0.015c0.319,0.347,0.711,0.734,1.206,1.148  c0.001-0.002,0.002-0.003,0.002-0.003C49.604,35.227,49.204,34.84,48.832,34.429z" fill="#3F8AD4"/>
				    <path d="M50.027,35.592c0.001-0.003,0.004-0.006,0.012-0.015c-0.004,0.004-0.01,0.008-0.015,0.012  C50.025,35.589,50.026,35.59,50.027,35.592z" fill="#3F8AD4"/>
				    <rect height="0.004" width="0.004" fill="#3F8AD4" y="35.59" x="50.022"/>
				</svg>
			</nav>
			<div id="container">
				<!-- Start Content -->
				<xsl:apply-templates mode="main"/>
				<!-- End Content -->
			</div>
			<footer class="cf">

			</footer>
			<script src="{$workspace}/js/blog.js"></script>
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