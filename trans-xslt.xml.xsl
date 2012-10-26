<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/document">
		<html>
			<head>
			<style type="text/css">
			html body {
				height:100%;
				margin:0px;
				padding:0px;
			}
			</style>
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
						<p style="position:absolute; bottom:0">
						Pictures:<br/>
							<xsl:for-each select="groupdescription/pictures">
								<div style="width:30%;>
								<xsl:variable name="idpict" select="picture/@id" ></xsl:variable>				
									<xsl:if test="picture/@id = /document/pictures/picture/@id" >
										
										<xsl:value-of select='/document/pictures/picture/picturedescription/copyrightyears'/><br/>
										<xsl:variable name="src" select='/document/pictures/picture/picturedescription/@src'/>
										<img src="{$src}"></img><br/>
										<xsl:value-of select='/document/pictures/picture/picturedescription/scientificname'/><br/>
										<xsl:value-of select='/document/pictures/picture/picturedescription/sex'/><br/>
										<xsl:value-of select='/document/pictures/picture/picturedescription/specimencondition'/><br/>
									</xsl:if>
									
									
								</div>
							</xsl:for-each>
						</p>
					</div>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>