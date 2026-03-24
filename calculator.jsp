<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP Calculator</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin-top: 50px; }
        .calc-container { display: inline-block; padding: 20px; border: 1px solid #ddd; background: #f9f9f9; border-radius: 8px;}
        input[type="number"], select { padding: 8px; margin: 10px; }
        input[type="submit"] { padding: 8px 15px; background: #007bff; color: white; border: none; cursor: pointer;}
    </style>
</head>
<body>
    <div class="calc-container">
        <h2>Simple JSP Calculator</h2>
        <form method="POST">
            <input type="number" step="any" name="num1" required placeholder="Number 1">
            <select name="operator">
                <option value="add">+</option>
                <option value="subtract">-</option>
                <option value="multiply">x</option>
                <option value="divide">/</option>
            </select>
            <input type="number" step="any" name="num2" required placeholder="Number 2">
            <br>
            <input type="submit" value="Calculate">
        </form>

        <%
            String num1Str = request.getParameter("num1");
            String num2Str = request.getParameter("num2");
            String operator = request.getParameter("operator");
            
            if(num1Str != null && num2Str != null && operator != null) {
                try {
                    double num1 = Double.parseDouble(num1Str);
                    double num2 = Double.parseDouble(num2Str);
                    double result = 0;
                    String opSymbol = "";
                    boolean error = false;
                    
                    switch(operator) {
                        case "add": result = num1 + num2; opSymbol = "+"; break;
                        case "subtract": result = num1 - num2; opSymbol = "-"; break;
                        case "multiply": result = num1 * num2; opSymbol = "x"; break;
                        case "divide": 
                            if(num2 == 0) { 
                                out.println("<h3 style='color:red;'>Error: Division by zero!</h3>");
                                error = true;
                            } else {
                                result = num1 / num2; opSymbol = "/"; 
                            }
                            break;
                    }
                    if(!error) {
                        out.println("<h3>Result: " + num1 + " " + opSymbol + " " + num2 + " = " + result + "</h3>");
                    }
                } catch(Exception e) {
                    out.println("<h3 style='color:red;'>Invalid Input!</h3>");
                }
            }
        %>
    </div>
</body>
</html>
