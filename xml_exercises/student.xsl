<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Student Marks Report</title>
                <style>
                    table { border-collapse: collapse; width: 60%; margin: 20px auto; }
                    th, td { border: 1px solid #aaa; padding: 10px; text-align: center; }
                    th { background-color: #4CAF50; color: white; }
                </style>
            </head>
            <body style="font-family: Arial;">
                <h2 style="text-align:center;">Student Marks HTML Report</h2>
                <table>
                    <tr>
                        <th>Roll No</th>
                        <th>Name</th>
                        <th>Subject</th>
                        <th>Marks</th>
                    </tr>
                    <xsl:for-each select="students/student">
                        <tr>
                            <td><xsl:value-of select="rollno"/></td>
                            <td><xsl:value-of select="name"/></td>
                            <td><xsl:value-of select="subject"/></td>
                            <td><xsl:value-of select="marks"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
