<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="text" encoding="UTF-8" indent="no" />
    <xsl:import href="toRdf-1.xslt"/>
    
    <xsl:template match="/">
        <xsl:call-template name="mainTemplate"/>
    </xsl:template>
    
</xsl:stylesheet>