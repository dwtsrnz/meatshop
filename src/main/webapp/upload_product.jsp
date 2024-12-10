<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String username = (String) session.getAttribute("username");

    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Product</title>
    <style>
        /* Enhanced white-themed UI design */

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #232121;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333333;
        }

        .upload-container {
            background-color: #ffffff;
            padding: 40px 50px;
            width: 100%;
            max-width: 400px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            margin-bottom: 25px;
            color: #333333;
        }

        .input-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-size: 15px;
            color: #555555;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 14px;
            border-radius: 8px;
            border: 1px solid #cccccc;
            background-color: #f9f9f9;
            color: #333333;
            transition: border-color 0.3s;
        }

        input:focus {
            border-color: #999999;
            outline: none;
        }

        input::placeholder {
            color: #aaaaaa;
        }

        .upload-btn {
            width: 100%;
            padding: 14px;
            background-color: #504e4e;
            border: none;
            border-radius: 8px;
            color: #ffffff;
            font-size: 17px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .upload-btn:hover {
            background-color: #730839;
        }

        p {
            font-size: 14px;
            margin-top: 20px;
            color: #555555;
        }

        a {
            color: #730839;
            text-decoration: none;
            transition: color 0.3s;
        }

        a:hover {
            color: #730839;
            text-decoration: underline;
        }

        /* Responsive Styles */
        @media (max-width: 600px) {
            .signup-container {
                padding: 20px 30px;
            }

            input, .signup-btn {
                padding: 10px;
            }

            h2 {
                font-size: 24px;
            }

            label {
                font-size: 14px;
            }

            p {
                font-size: 12px;
            }

            a {
                font-size: 12px;
            }

            .upload-btn {
                font-size: 15px;
            }
        }
    </style>
</head>
<body>

<!-- Display success or error messages -->
<c:if test="${not empty success}">
    <p style="color: green;">${success}</p>
</c:if>
<c:if test="${not empty error}">
    <p style="color: red;">${error}</p>
</c:if>

<!-- Upload product form -->
<section class="upload-container">
    <h1>Upload Product</h1>
    <form action="uploadProduct" method="post" enctype="multipart/form-data">
        <label for="meatType">Meat Type:</label>
        <input type="text" id="meatType" name="meatType" required><br><br>

        <label for="meatName">Meat Name:</label>
        <input type="text" id="meatName" name="meatName" required><br><br>

        <label for="price">Price:</label>
        <input type="number" id="price" name="price" step="0.01" required><br><br>

        <label for="meatImage">Meat Image:</label>
        <input type="file" id="meatImage" name="meatImage" accept="image/*" required><br><br>

        <button class="upload-btn" type="submit">Upload</button>
    </form>
    <p><a href="index.jsp">Back to Dashboard</a></p>
</section>


</body>
</html>
