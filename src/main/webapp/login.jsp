<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
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

        .login-container {
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

        .login-btn {
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

        .login-btn:hover {
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
            .login-container {
                padding: 20px 30px;
            }

            input, .login-btn {
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

            .login-btn {
                font-size: 15px;
            }
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>Login</h2>
    <form action="LoginServlet" method="post">
        <div class="input-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Enter your username" required>
        </div>
        <div class="input-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
        </div>
        <button type="submit" class="login-btn">Login</button>
    </form>
    <p>Don't have an account? <a href="signup.jsp">Sign Up</a></p>
</div>
</body>
</html>
