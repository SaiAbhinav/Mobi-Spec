<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html> 
            <body>                                      
                <table class="table table-hover" border="0">
                    <thead class="bg-dark text-white">
                        <tr>
                            <th>Id</th>
                            <th>Name</th> 
                            <th>Count</th>                                                       
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="brands/brand">
                            <tr>
                                <td>
                                    <xsl:value-of select="id"/>
                                </td>
                                <td>
                                    <xsl:value-of select="name"/>
                                </td>  
                                <td>
                                    <xsl:value-of select="count"/>
                                </td>                                                                
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>                                             
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

