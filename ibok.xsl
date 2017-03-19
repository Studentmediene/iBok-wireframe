<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" doctype-system="about:legacy-compat"/>

	<xsl:template match="/">
		<html>
			<head>
				<meta charset="utf-8" />
				<title>iBok.no</title>
				<link rel="stylesheet" href="/css/index.css" />
				<script src="/js/Component.js"></script>
				<script src="/js/ConditionSlider.js"></script>
				<script src="/js/ParamValue.js"></script>
				<script src="http://127.0.0.1:35729/livereload.js?snipver=1"></script>
			</head>

			<body>
				<header>
					<a href="/index.xml">
						<h1><img src="/img/logo.svg" alt="iBok" /></h1>
					</a>
					<a href="/account.xml" class="button">Min konto</a>
				</header>

				<main>
					<xsl:apply-templates mode="content" select="." />
				</main>

				<footer>
					Copyright © Studentmediene i Trondheim
				</footer>
			</body>

		</html>
	</xsl:template>

	<!-- Innludes raw HTML where necessary -->
	<xsl:template match="raw" mode="content">
		<xsl:copy-of select="*" />
	</xsl:template>


	<!-- Confirmation pages -->
	<xsl:template match="confirmation" mode="content">
		<div class="confirmation">
			<xsl:copy-of select="*" />
		</div>
	</xsl:template>


	<!-- Book listing -->
	<xsl:template match="book-list" mode="content">
		<ul class="book-list">
			<xsl:for-each select="*">
				<li><xsl:apply-templates mode="listing" select="." /></li>
			</xsl:for-each>
		</ul>
	</xsl:template>


	<!-- Book styling -->
	<xsl:template match="book" mode="listing">
		<img src="https://ibok.no/static/books/{substring(isbn,12)}/{isbn}.jpg" />
		<h3><xsl:value-of select="title" /></h3>
		<p>ISBN: <xsl:value-of select="isbn" /></p>
	</xsl:template>


	<xsl:template match="book" mode="content">
		<h2><xsl:value-of select="title" /></h2>
		<img src="https://ibok.no/static/books/{substring(isbn,12)}/{isbn}.jpg" />
		<p>ISBN: <xsl:value-of select="isbn" /></p>

		<a href="/buy.xml?book_title={title}" class="big button">Kjøp</a>
		<a href="/sell.xml?book_title={title}" class="big button">Selg</a>

		<h3>Nypriser</h3>
		<ul class="external-prices">
			<li>
				<a href="https://bokkilden.no" class="button">
					<img
						src="https://ibok.no/static/img/bokkilden.png"
						alt="Bokkilden" />
					<span>180,-</span>
				</a>
			</li>

			<li>
				<a href="https://adlibris.no" class="button">
					<img
						src="https://ibok.no/static/img/adlibris.png?t=apr13"
						alt="Adlibris"/>
					<span>190,-</span>
				</a>
			</li>

			<li>
				<a href="https://tanum.no" class="button">
					<img
						src="https://ibok.no/static/img/tanum.png"
						alt="Tanum" />
					<span>200,-</span>
				</a>
			</li>

			<li>
				<a href="https://haugenbok.no" class="button">
					<img
						src="https://ibok.no/static/img/haugenbok.png"
						alt="Haugenbok" />
					<span>195,-</span>
				</a>
			</li>
		</ul>

	</xsl:template>


	<!-- Imports other XML files -->
	<xsl:template match="mylink" mode="listing">
		<a href="{@href}" class="button">
			<xsl:apply-templates select="document(@href)" mode="listing" />
		</a>
	</xsl:template>

</xsl:stylesheet> 
