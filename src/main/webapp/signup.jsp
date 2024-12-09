<%--
  Created by IntelliJ IDEA.
  User: EA
  Date: 11/14/2024
  Time: 12:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
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

        .signup-container {
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

        .signup-btn {
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

        .signup-btn:hover {
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

            .signup-btn {
                font-size: 15px;
            }
        }
    </style>
</head>
<body>
<div class="signup-container">
    <h2>Signup</h2>
    <form action="SignupServlet" method="post">
        <div class="input-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Enter your username" required>
        </div>
        <div class="input-group">
            <label for="email">email:</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>
        </div>
        <div class="input-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
        </div>
        <button type="submit" class="signup-btn">Signup</button>
    </form>
    <p>Already have an account? <a href="login.jsp">Login</a></p>
</div>
</body>
</html>
