import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/updateMeat")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5) // 5MB max file size
public class UpdateMeatServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String meatIdStr = request.getParameter("meatId");
        String meatType = request.getParameter("meatType");
        String meatName = request.getParameter("meatName");
        String priceStr = request.getParameter("price");
        Part imagePart = request.getPart("meatImage");

        if (meatIdStr == null || meatType == null || meatName == null || priceStr == null) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("edit_meat.jsp").forward(request, response);
            return;
        }

        int meatId;
        double price;
        try {
            meatId = Integer.parseInt(meatIdStr);
            price = Double.parseDouble(priceStr);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid input format.");
            request.getRequestDispatcher("edit_meat.jsp").forward(request, response);
            return;
        }

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = imagePart.getSize() > 0
                    ? "UPDATE meats SET meat_type = ?, meat_name = ?, price = ?, meat_image = ? WHERE meat_id = ?"
                    : "UPDATE meats SET meat_type = ?, meat_name = ?, price = ? WHERE meat_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, meatType);
                statement.setString(2, meatName);
                statement.setDouble(3, price);

                if (imagePart.getSize() > 0) {
                    InputStream inputStream = imagePart.getInputStream();
                    statement.setBlob(4, inputStream);
                    statement.setInt(5, meatId);
                } else {
                    statement.setInt(4, meatId);
                }

                int rowsUpdated = statement.executeUpdate();

                if (rowsUpdated > 0) {
                    request.setAttribute("success", "Meat updated successfully.");

                } else {
                    request.setAttribute("error", "Meat not found.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error occurred.");
        }

        request.getRequestDispatcher("edit_meat.jsp").forward(request, response);
    }
}
