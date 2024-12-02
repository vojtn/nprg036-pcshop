<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="text" encoding="UTF-8" />
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
    </xsl:template>

    <!-- Template to transform Customer -->
    <xsl:template match="customer">
        dpv:Cust<xsl:value-of select="@id" /> a dpv:Customer ;
            foaf:name "<xsl:value-of select="name"/>"@<xsl:value-of select="name/@xml:lang" /> ;
            foaf:mbox &lt;<xsl:value-of select="email"/>&gt;
            uiot:registrationDate "<xsl:value-of select="registrationDate"/>"^^xsd:dateTime ;
            schema:identifier 
                <xsl:variable name="privileged" select="privileged"/>
                <xsl:choose>
                    <xsl:when test="$privileged">
                        "VIP"
                    </xsl:when>
                    <xsl:otherwise>
                        "Normal?"
                    </xsl:otherwise>
                </xsl:choose>
            @<xsl:value-of select="name/@xml:lang"/> .
    </xsl:template>

</xsl:stylesheet>