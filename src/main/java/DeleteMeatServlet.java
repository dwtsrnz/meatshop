import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteMeat")
public class DeleteMeatServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String meatIdStr = request.getParameter("meatId");

        if (meatIdStr == null) {
            response.sendRedirect("view_meats.jsp?error=Invalid+meat+ID");
            return;
        }

        int meatId;
        try {
            meatId = Integer.parseInt(meatIdStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("view_meats.jsp?error=Invalid+meat+ID");
            return;
        }

        // Delete the meat record from the database
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "DELETE FROM meats WHERE meat_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, meatId);
                int rowsDeleted = statement.executeUpdate();

                if (rowsDeleted > 0) {
                    response.sendRedirect("index.jsp?success=Meat+deleted+successfully");
                } else {
                    response.sendRedirect("index.jsp?error=Meat+not+found");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("view_meats.jsp?error=Database+error");
        }
    }
}
