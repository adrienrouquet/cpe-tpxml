<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/document">
		<html>
			<body>
				<xsl:for-each select="//groups/group">	
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
						
					</div>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>