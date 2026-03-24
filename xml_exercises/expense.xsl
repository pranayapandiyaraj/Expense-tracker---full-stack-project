<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Expense Tracker Report</title>
                <style>
                    table { border-collapse: collapse; width: 80%; margin: 20px auto; font-family: Arial;}
                    th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
                    th { background-color: #2c3e50; color: white; }
                    .income { color: green; font-weight: bold;}
                    .expense { color: red; font-weight: bold;}
                </style>
            </head>
            <body>
                <h2 style="text-align:center; font-family:Arial;">Monthly Financial Report</h2>
                <table>
                    <tr>
                        <th>Transaction ID</th>
                        <th>Type</th>
                        <th>Date</th>
                        <th>Description</th>
                        <th>Category</th>
                        <th>Amount ($)</th>
                    </tr>
                    <xsl:for-each select="expenses/transaction">
                        <tr>
                            <td><xsl:value-of select="@id"/></td>
                            <td>
                                <xsl:attribute name="class"><xsl:value-of select="@type"/></xsl:attribute>
                                <xsl:value-of select="@type"/>
                            </td>
                            <td><xsl:value-of select="date"/></td>
                            <td><xsl:value-of select="description"/></td>
                            <td><xsl:value-of select="category"/></td>
                            <td><xsl:value-of select="amount"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
