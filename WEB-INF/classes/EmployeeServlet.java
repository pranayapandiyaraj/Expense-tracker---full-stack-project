import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

class Employee {
    String name;
    String department;
    double salary;
    Employee(String n, String d, double s) { name = n; department = d; salary = s; }
}

@WebServlet("/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Employee[] employees = {
            new Employee("Alice Smith", "Engineering", 75000),
            new Employee("Bob Johnson", "Marketing", 62000),
            new Employee("Charlie Brown", "Sales", 58000),
            new Employee("Diana Prince", "HR", 55000),
            new Employee("Evan Wright", "Engineering", 81000)
        };

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        out.println("<html><head><title>Employee Salary Report</title>");
        out.println("<style>table { border-collapse: collapse; width: 50%; border: 1px solid #ccc; } th, td { padding: 10px; text-align: left; border-bottom: 1px solid #cfcfcf; } th { background-color: #f2f2f2; } </style></head>");
        out.println("<body><h2>Employee Details</h2>");
        out.println("<table><tr><th>Name</th><th>Department</th><th>Salary ($)</th></tr>");
        
        double totalSalary = 0;
        for (Employee e : employees) {
            out.println("<tr><td>" + e.name + "</td><td>" + e.department + "</td><td>" + e.salary + "</td></tr>");
            totalSalary += e.salary;
        }
        
        double averageSalary = totalSalary / employees.length;
        out.println("</table>");
        
        out.println("<h3>Summary</h3>");
        out.println("<p><b>Total Salary:</b> $" + String.format("%.2f", totalSalary) + "</p>");
        out.println("<p><b>Average Salary:</b> $" + String.format("%.2f", averageSalary) + "</p>");
        
        out.println("</body></html>");
    }
}
