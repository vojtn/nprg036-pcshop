<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="text" encoding="UTF-8" indent="no" />
    <xsl:import href="toRdf-1.xslt"/>

    <!-- Prefix definition -->
    <xsl:template match="/">
        @base &lt;http://example.org/&gt; .
        @prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt; .
        @prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .
        @prefix foaf: &lt;http://xmlns.com/foaf/0.1/&gt; .
        @prefix schema: &lt;http://schema.org/&gt; .
        @prefix dpv: &lt;https://w3c.github.io/dpv/2.0/&gt; .
        @prefix iol: &lt;http://www.ontologydesignpatterns.org/ont/dul/IOLite.owl#&gt; .
        @prefix vcard: &lt;http://www.w3.org/2006/vcard/ns#&gt; .
        @prefix km4c: &lt;http://www.disit.org/km4city/schema#&gt; .
        @prefix uiot: &lt;http://www.w3id.org/urban-iot/core#&gt; .
        @prefix oo: &lt;http://purl.org/openorg/&gt; .
        @prefix seasto: &lt;https://w3id.org/seas/&gt; .
        @prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .

        <xsl:apply-templates select="//employee"/>
        <xsl:apply-templates select="//address"/>
        <xsl:apply-templates select="//warehouse"/>
        <xsl:apply-templates select="//product"/>
        <xsl:apply-templates select="//brand"/>
    </xsl:template>

    

</xsl:stylesheet>