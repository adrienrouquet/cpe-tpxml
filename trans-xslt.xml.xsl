<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/document">
		<html>
			<head>
<!-- 			<style type="text/css"> -->
<!-- 			html body { -->
<!-- 				height:100%; -->
<!-- 				margin:0px; -->
<!-- 				padding:0px; -->
<!-- 			} -->
<!-- 			</style> -->
			</head>
			<body>
				<xsl:for-each select="/document/groups/group">	
					<div style="border:black solid 0.2em; margin:1em;">
						<h1>
							<xsl:value-of select='groupdescription/name' />
						</h1>
						<hr/>
						<p>
							Other Names:
								<ul>
									<xsl:for-each select="groupdescription/othernames" >
										<li><xsl:value-of select='othername' /></li>
									</xsl:for-each>
								</ul>
						</p>
						<p>
							Description:<br/>
							<div>
								<xsl:value-of select='groupdescription/description'/>
							</div>
						</p>
						<p>
						Pictures:<br/>
							<table>
								<xsl:for-each select="groupdescription/pictures/picture">
									<xsl:variable name="idpict" select="@id" />
									<xsl:for-each select="/document/pictures/picture" >
										<xsl:if test="@id = $idpict" >
												<td>
												<xsl:value-of select='picturedescription/copyrightyears'/><br/>
												<xsl:variable name="src" select='picturedescription/@src'/>
												<img src="{$src}"></img><br/>
												<xsl:value-of select='picturedescription/scientificname'/><br/>
												<xsl:value-of select='picturedescription/sex'/><br/>
												<xsl:value-of select='picturedescription/specimencondition'/><br/>
												</td>
										</xsl:if>
									</xsl:for-each>
								</xsl:for-each>
							</table>
						</p>
					</div>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>