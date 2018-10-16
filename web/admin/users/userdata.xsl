<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html> 
            <body>                                      
                <table class="table table-hover" border="0">
                    <thead class="bg-dark text-white">
                        <tr>
                            <th>Email</th>
                            <th>Username</th>                            
                            <th>Gender</th>
                            <th>DOB</th>
                            <th>Address</th>
                            <th>Preferences</th>
                            <th>Nationality</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="users/user">
                            <tr>
                                <td>
                                    <xsl:value-of select="email"/>
                                </td>
                                <td>
                                    <xsl:value-of select="username"/>
                                </td>                                
                                <td>
                                    <xsl:value-of select="gender"/>
                                </td>
                                <td>
                                    <xsl:value-of select="dob"/>
                                </td>
                                <td>
                                    <xsl:value-of select="address"/>
                                </td>
                                <td>
                                    <xsl:value-of select="preferences"/>
                                </td>
                                <td>
                                    <xsl:value-of select="nation"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>                                             
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

