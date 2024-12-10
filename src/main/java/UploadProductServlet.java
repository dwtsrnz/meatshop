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
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/uploadProduct")
@MultipartConfig(maxFileSize = 16177215) // 16MB limit for uploaded file
public class UploadProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve data from the form
        String meatType = request.getParameter("meatType");
        String meatName = request.getParameter("meatName");
        String priceStr = request.getParameter("price");
        Part meatImagePart = request.getPart("meatImage"); // Retrieve the image part

        // Validate inputs
        if (meatType == null || meatName == null || priceStr == null ||
                meatType.isEmpty() || meatName.isEmpty() || priceStr.isEmpty() ||
                meatImagePart == null || meatImagePart.getSize() == 0) {
            request.setAttribute("error", "All fields are required, including an image.");
            request.getRequestDispatcher("upload_product.jsp").forward(request, response);
            return;
        }

        double price;
        try {
            price = Double.parseDouble(priceStr);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid price format.");
            request.getRequestDispatcher("upload_product.jsp").forward(request, response);
            return;
        }

        // Get the current user's session
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if not logged in
            return;
        }

        // Insert product into the database
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO meats (meat_type, meat_name, price, meat_image) VALUES (?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, meatType);
                statement.setString(2, meatName);
                statement.setDouble(3, price);

                // Convert uploaded image to InputStream
                InputStream meatImageStream = meatImagePart.getInputStream();
                statement.setBlob(4, meatImageStream);

                statement.executeUpdate();
            }

            request.setAttribute("success", "Product uploaded successfully.");
            response.sendRedirect("index.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while uploading the product.");
        }

        // Redirect back to the upload page with a success or error message
        request.getRequestDispatcher("upload_product.jsp").forward(request, response);
    }
}
