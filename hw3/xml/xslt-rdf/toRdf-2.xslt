<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="text" encoding="UTF-8" indent="no" />
    <xsl:variable name="prefix">https://example.org/resource/</xsl:variable>
    <xsl:variable name="catalogIRI" select="concat($prefix, 'Customer')"/>

    <!-- Prefix definition -->
    <xsl:template match="/">
        @prefix dpv: &lt;https://w3c.github.io/dpv/2.0/&gt; .
        @prefix vcard: &lt;http://www.w3.org/2006/vcard/ns#&gt; .
        @prefix foaf: &lt;http://xmlns.com/foaf/0.1/&gt; .
        @prefix uiot: &lt;http://www.w3id.org/urban-iot/core#&gt; .
        @prefix schema: &lt;http://schema.org/&gt; .
        @prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .

        <xsl:apply-templates select="//customer"/>
        <xsl:apply-templates select="//customer/address"/>
    </xsl:template>

    <!-- Template to transform Customer -->
    <xsl:template match="customer">
        dpv:Cust<xsl:value-of select="position()" /> a dpv:Customer ;
            foaf:name "<xsl:value-of select="name"/>"@<xsl:value-of select="name/@xml:lang" /> ;
            foaf:mbox &lt;<xsl:value-of select="email"/>&gt; ;
            uiot:registrationDate "<xsl:value-of select="registrationDate"/>"^^xsd:dateTime ;
            schema:identifier <xsl:choose>
                    <xsl:when test="privileged = 'true'">
                        <xsl:text>"VIP"</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>"Standard"</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>@<xsl:value-of select="name/@xml:lang"/> .
    </xsl:template>

    <!-- Template to transform Address -->
    <xsl:template match="customer/address">
        vcard:Addr<xsl:value-of select="position()" /> a vcard:Address ;
            vcard:country-name "<xsl:value-of select="country"/>"@<xsl:value-of select="country/@xml:lang" /> ;
            vcard:locality "<xsl:value-of select="city"/>"@<xsl:value-of select="city/@xml:lang" /> ;
            vcard:street-address "<xsl:value-of select="streetLine"/>"@<xsl:value-of select="streetLine/@xml:lang" /> ;
            vcard:postal-code "<xsl:value-of select="postCode"/>"@<xsl:value-of select="postCode/@xml:lang" /> ;
    
        dpv:Cust<xsl:value-of select="position()" /> schema:location vcard:Addr<xsl:value-of select="position()" /> .
    </xsl:template>

</xsl:stylesheet>