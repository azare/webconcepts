<?xml version="1.0" encoding="UTF-8"?>
<!-- This XSLT transforms https://github.com/dret/webconcepts into JSON. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" xmlns:sedola="http://github.com/dret/sedola">
    <xsl:output name="json" method="text" encoding="UTF-8"/>
    <!-- -->
    <xsl:template name="xml2json">
        <xsl:result-document href="{$concepts-dir}/concepts.json" format="json">
            <xsl:text>{&#xa;</xsl:text>
            <xsl:for-each select="$concepts/concepts/concept">
                <xsl:sort select="title-singular"/>
                <xsl:value-of select="concat('&quot;', title-singular, '&quot;: {&#xa;')"/>
                <xsl:text>  }</xsl:text>
                <xsl:if test="position() ne last()">
                    <xsl:text>,</xsl:text>
                </xsl:if>
                <xsl:text>&#xa;</xsl:text>
            </xsl:for-each>
            <xsl:text>}</xsl:text>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>