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
                            <th>Reviewed On</th> 
                            <th>Reviewed By</th>                                                       
                            <th>Review</th>
                            <th>Time</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="reviews/review">
                            <tr>
                                <td>
                                    <xsl:value-of select="id"/>
                                </td>
                                <td>
                                    <xsl:value-of select="mobile"/>
                                </td>  
                                <td>
                                    <xsl:value-of select="user"/>
                                </td>
                                <td>
                                    <xsl:value-of select="text"/>
                                </td>
                                <td>
                                    <xsl:value-of select="time"/>
                                </td>                                                                
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>                                             
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

