<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="text" encoding="UTF-8" indent="no" />
    <xsl:import href="toRdf-1.xslt"/>

    <!-- Prefix definition -->
    <xsl:template match="/">
        <xsl:call-template name="prefixes"/>

        <xsl:apply-templates select="//employee"/>
        <xsl:apply-templates select="//address"/>
        <xsl:apply-templates select="//warehouse"/>
        <xsl:apply-templates select="//product"/>
        <xsl:apply-templates select="//brand"/>
    </xsl:template>

    

</xsl:stylesheet>