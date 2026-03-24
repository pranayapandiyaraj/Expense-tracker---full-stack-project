<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Random" %>
<!DOCTYPE html>
<html>
<head>
    <title>Random Number Generator</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin-top: 50px; }
        .container { display: inline-block; padding: 20px; border: 1px solid #ddd; background: #fafafa; border-radius: 8px;}
        table { margin: 20px auto; border-collapse: collapse; width: 50%; border: 1px solid #ccc; }
        th, td { padding: 10px; text-align: center; border-bottom: 1px solid #cfcfcf; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Generate 10 Random Numbers</h2>
        <form method="POST">
            Min Range: <input type="number" name="min" required>
            Max Range: <input type="number" name="max" required>
            <input type="submit" value="Generate">
        </form>

        <%
            String minStr = request.getParameter("min");
            String maxStr = request.getParameter("max");
            
            if(minStr != null && maxStr != null) {
                try {
                    int min = Integer.parseInt(minStr);
                    int max = Integer.parseInt(maxStr);
                    
                    if(min >= max) {
                        out.println("<p style='color:red;'>Max must be greater than Min.</p>");
                    } else {
                        Random rand = new Random();
                        out.println("<table><tr><th>#</th><th>Random Number (" + min + " - " + max + ")</th></tr>");
                        for(int i = 1; i <= 10; i++) {
                            int randomNum = rand.nextInt((max - min) + 1) + min;
                            out.println("<tr><td>" + i + "</td><td>" + randomNum + "</td></tr>");
                        }
                        out.println("</table>");
                    }
                } catch(Exception e) {
                    out.println("<p style='color:red;'>Invalid Input!</p>");
                }
            }
        %>
    </div>
</body>
</html>
