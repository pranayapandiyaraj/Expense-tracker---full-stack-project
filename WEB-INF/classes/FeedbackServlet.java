import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><head><title>Feedback Confirmation</title></head>");
        out.println("<body style='font-family: Arial; padding: 20px;'>");
        out.println("<h2>Thank You for Your Feedback, " + name + "!</h2>");
        out.println("<p>We have received your message:</p>");
        out.println("<blockquote style='background: #f4f4f4; padding: 10px; border-left: 5px solid #ccc;'>" + message + "</blockquote>");
        out.println("<p>A confirmation email will be sent to " + email + ".</p>");
        out.println("<a href='index.html'>Return to Dashboard</a>");
        out.println("</body></html>");
    }
}
