<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%
    // Using application scope to mimic a database of registered students
    ArrayList<String> students = (ArrayList<String>) application.getAttribute("studentList");
    if(students == null) {
        students = new ArrayList<String>();
        application.setAttribute("studentList", students);
    }

    String studentName = request.getParameter("studentName");
    String rollNo = request.getParameter("rollNo");
    
    if(studentName != null && !studentName.trim().isEmpty() && rollNo != null && !rollNo.trim().isEmpty()) {
        students.add(rollNo + " - " + studentName);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Registration System</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin-top: 30px; }
        .container { display: inline-block; padding: 20px; border: 1px solid #ddd; background: #fdfdfd; border-radius: 8px;}
        input[type="text"] { padding: 8px; margin: 10px; width: 200px;}
        input[type="submit"] { padding: 8px 15px; background: #28a745; color: white; border: none; cursor: pointer;}
        ul { list-style-type: none; padding: 0; }
        li { background: #eee; margin: 5px 0; padding: 5px; border-radius: 4px; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Student Registration</h2>
        <form method="POST">
            <input type="text" name="rollNo" placeholder="Roll Number" required><br>
            <input type="text" name="studentName" placeholder="Student Name" required><br>
            <input type="submit" value="Register">
        </form>

        <hr>
        <h3>Registered Students</h3>
        <% if(students.isEmpty()) { %>
            <p>No students registered yet.</p>
        <% } else { %>
            <ul>
                <% for(String student : students) { %>
                    <li><%= student %></li>
                <% } %>
            </ul>
        <% } %>
    </div>
</body>
</html>
