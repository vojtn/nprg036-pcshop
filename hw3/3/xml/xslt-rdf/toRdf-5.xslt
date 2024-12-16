<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="text" encoding="UTF-8" indent="no" />
    <xsl:import href="toRdf-1.xslt"/>
    
    <xsl:template match="/">
        <xsl:call-template name="prefixes"/>
        <xsl:for-each-group select="//brand" group-by="@id">
            <xsl:apply-templates select="."/>
        </xsl:for-each-group>
        <xsl:for-each-group select="//product" group-by="@id">
            <xsl:apply-templates select="."/>
        </xsl:for-each-group>
    </xsl:template>
    
    <xsl:template match="brand" mode="#default">
        <xsl:value-of select="@id" /> a schema:Brand ;
        schema:name "<xsl:value-of select="name"/>"@<xsl:value-of select="name/@xml:lang" /> ;
        schema:email &lt;mailto:<xsl:value-of select="companyEmail"/>&gt; . &#10;
    </xsl:template>

    <xsl:template match="//product" mode="#default">
        <xsl:value-of select="@id" /> a schema:Product ;
        schema:price <xsl:value-of select="price"/> ;
        schema:name "<xsl:value-of select="name"/>"@<xsl:value-of select="name/@xml:lang" /> ;
        schema:discount <xsl:value-of select="sale"/> ;
        schema:brand <xsl:value-of select="../@id"/> ;
        seasto:valueAddedTax <xsl:value-of select="VAT"/> . &#10;
    </xsl:template>

</xsl:stylesheet>