<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="text" encoding="UTF-8" indent="yes" />
    
    <!-- Prefix definition -->
    <xsl:template name="prefixes">
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
        @prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; . &#10;
    </xsl:template>

    <xsl:template name="mainTemplate">
        <xsl:call-template name="prefixes"/>
        
        <!-- Not the best way to do it, but we wanted to keep the original ordering of items -->
        <xsl:for-each-group select="//customer" group-by="@id">
            <xsl:apply-templates select="."/>
        </xsl:for-each-group>
        
        <xsl:for-each-group select="//employee" group-by="@id">
            <xsl:apply-templates select="."/>
        </xsl:for-each-group>
        
        <xsl:for-each-group select="//brand" group-by="@id">
            <xsl:apply-templates select="."/>
        </xsl:for-each-group>
        
        <xsl:for-each-group select="//address" group-by="@id">
            <xsl:apply-templates select="."/>
        </xsl:for-each-group>
        
        <xsl:for-each-group select="//order" group-by="@id">
            <xsl:apply-templates select="."/>
        </xsl:for-each-group>
        
        <xsl:for-each-group select="//warehouse" group-by="@id">
            <xsl:apply-templates select="."/>
        </xsl:for-each-group>
        
        <xsl:for-each-group select="//product" group-by="@id">
            <xsl:apply-templates select="."/>
        </xsl:for-each-group>
    </xsl:template>
    
    <xsl:template match="/">
        <xsl:call-template name="mainTemplate"/>
    </xsl:template>
    
    <!-- Template to transform Customer -->
    <xsl:template match="customer">
        <xsl:value-of select="@id" /> a dpv:Customer ;
        foaf:name "<xsl:value-of select="name"/>"@<xsl:value-of select="name/@xml:lang" /> ;
        foaf:mbox &lt;mailto:<xsl:value-of select="email"/>&gt; ;
        uiot:registrationDate "<xsl:value-of select="registrationDate"/>"^^xsd:dateTime ;
        schema:identifier "<xsl:value-of select="identifier"/>"@<xsl:value-of select="name/@xml:lang"/> .&#10;
    </xsl:template>
    
    <!-- Template to transform Employee -->
    <xsl:template match="employee">
        <xsl:value-of select="@id" /> a schema:EmployeeRole ;
        foaf:name "<xsl:value-of select="name"/>"@<xsl:value-of select="name/@xml:lang" /> ;
        foaf:mbox &lt;mailto:<xsl:value-of select="email"/>&gt; ;
        schema:startDate "<xsl:value-of select="startingDate"/>"^^xsd:dateTime ;&#10;
    </xsl:template>
    
    <!-- Template to transform Address -->
    <xsl:template match="address">
        <xsl:value-of select="@id" /> a vcard:Address ;
        vcard:country-name "<xsl:value-of select="country"/>"@<xsl:value-of select="country/@xml:lang" /> ;
        vcard:locality "<xsl:value-of select="city"/>"@<xsl:value-of select="city/@xml:lang" /> ;
        vcard:street-address "<xsl:value-of select="streetLine"/>"@<xsl:value-of select="streetLine/@xml:lang" /> ;
        vcard:postal-code "<xsl:value-of select="postCode"/>"@<xsl:value-of select="postCode/@xml:lang" /> ;&#10;
    </xsl:template>
    
    <!-- Template to transform Warehouse -->
    <xsl:template match="warehouse" mode="#default">
        <xsl:value-of select="@id" /> a km4c:Warehouse_and_storage ;
        oo:capacity <xsl:value-of select="capacity"/> ;
        foaf:mbox [ rdf:_1 &lt;mailto:<xsl:value-of select="contact"/>&gt; ] .&#10;
    </xsl:template>
    
    <!-- Template to transform Product -->
    <xsl:template match="product" mode="#default">
        <xsl:value-of select="@id" /> a schema:Product ;
        schema:price <xsl:value-of select="price"/> ;
        schema:name "<xsl:value-of select="name"/>"@<xsl:value-of select="name/@xml:lang" /> ;
        schema:discount <xsl:value-of select="sale"/> ;
        seasto:valueAddedTax <xsl:value-of select="VAT"/> .&#10;
    </xsl:template>
    
    <!-- Template to transform Brand -->
    <xsl:template match="brand" mode="#default">
        <xsl:value-of select="@id" /> a schema:Brand ;
        schema:name "<xsl:value-of select="name"/>"@<xsl:value-of select="name/@xml:lang" /> ;
        schema:email &lt;mailto:<xsl:value-of select="companyEmail"/>&gt; .&#10;
    </xsl:template>
    
    <!-- Template to transform Order -->
    <xsl:template match="order" mode="#default">
        <xsl:value-of select="@id" /> a schema:Order ;
        schema:orderNumber <xsl:value-of select="orderNumber"/> ;
        schema:price <xsl:value-of select="totalPrice"/> .&#10;
    </xsl:template>
    
</xsl:stylesheet>