import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/image")
public class ImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing image ID");
            return;
        }

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT meat_image FROM meats WHERE meat_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, Integer.parseInt(id));

                try (var resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        byte[] imageData = resultSet.getBytes("meat_image");
                        response.setContentType("image/jpeg"); // Change to appropriate type
                        response.getOutputStream().write(imageData);
                    } else {
                        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }
}
