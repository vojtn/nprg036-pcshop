<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html lang="en">
            <head>
                <title>List customers and their orders</title>
            </head>
            <body>
                <h1>Orders</h1>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="order">
        <h4>Order number <xsl:value-of select="orderNumber"/>:</h4>  
        <ul>
            <li>
                <strong>Price: </strong> <xsl:value-of select="totalPrice"/> EUR
            </li>
            <li>
                <strong>Customer: </strong> <xsl:value-of select="customer/name"/>
                <ul>
                    <li>
                        <strong>Email:</strong><xsl:value-of select="customer/email"/>
                    </li>
                    <li>
                        <strong>Registration Date:</strong> 
                        <time datetime="{registrationDate}">
                            <xsl:value-of select="registrationDate"/>
                        </time>
                    </li>
                    <strong>Billing address:</strong>
                    <ul>
                        <li>
                            <strong>Country:</strong> <xsl:value-of select="customer/address/country"/>
                        </li>
                        <li>
                            <strong>City:</strong> <xsl:value-of select="customer/address/city"/>
                        </li>
                        <li>
                            <strong>Street Line:</strong> <xsl:value-of select="customer/address/streetLine"/>
                        </li>
                        <li>
                            <strong>Post Code:</strong> <xsl:value-of select="customer/address/postCode"/>
                        </li>
                    </ul>
                </ul>
            </li>
            <li>
                <strong>Products: </strong> <xsl:value-of select="name"/>
                <xsl:apply-templates select="product"/>
            </li>
            <li>
                <strong>Shipping address: </strong>
                <ul>
                    <li>
                        <strong>Country: </strong> <xsl:value-of select="address/country"/>
                    </li>
                    <li>
                        <strong>City: </strong> <xsl:value-of select="address/city"/>
                    </li>
                    <li>
                        <strong>Street Line: </strong> <xsl:value-of select="address/streetLine"/>
                    </li>
                    <li>
                        <strong>Post Code: </strong> <xsl:value-of select="address/postCode"/>
                    </li>
                </ul>
            </li>
        </ul>
    </xsl:template>

    <xsl:template match="product">
        <ul>
            <strong>Product name: </strong> <xsl:value-of select="name"/>
            <ul>
                <li>Price: <xsl:value-of select="price"/> EUR</li>
                <li>Sale: <xsl:value-of select="sale"/></li>
                <li>VAT: <xsl:value-of select="VAT"/></li>
            </ul>
        </ul>
    </xsl:template>

    <xsl:template match="text()"/>
</xsl:stylesheet>
