<%@ page import="jakarta.servlet.http.HttpSession" %>
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
    <title>Sneaker Shop</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            color: #333;
        }

        /* Navbar */
        header {
            background-color: #7e054a;
            width: 100vw;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 100;
            padding: 10px 0;
        }
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 960px;
            margin: auto;
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            margin: 0 15px;
            font-size: 16px;
        }

        .navbar .logout {
            color: #fff8f8;
        }

        /* Grid container */
        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 10px;
            padding: 20px;
            max-width: 960px;
            margin: 6.5rem auto 0 auto;
        }

        .grid-item {
            position: relative;
            overflow: hidden;
            border: 5px solid #ddd;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .grid-item img {
            width: 100%;
            height: auto;
            display: block;
            border-bottom: 1px solid #ddd;
            border-radius: 10px 10px 0 0;
        }

        .grid-item .info {
            padding: 10px;
            text-align: center;
        }

        .grid-item .info h3 {
            margin: 10px 0;
            font-size: 18px;
            color: #333;
        }

        .grid-item .info p {
            margin: 5px 0;
            font-size: 14px;
            color: #777;
        }

        .grid-item .info .price {
            font-size: 16px;
            color: #850f0f;
            font-weight: bold;
        }

        .grid-item .info .cart-btn {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #7e054a;
            color: #fff;
            text-align: center;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .grid-item .info .cart-btn:hover {
            background-color: #730839;
        }

        @media (max-width: 768px) {
            header {
                padding: 5px 0;
            }

            .navbar a {
                margin: 0 10px;
                font-size: 14px;
            }

            .grid-container {
                padding: 10px;
                margin: 4.5rem auto 0 auto;
            }

            .grid-item {
                border: 3px solid #ddd;
            }

            .grid-item .info h3 {
                font-size: 16px;
            }

            .grid-item .info p {
                font-size: 12px;
            }

            .grid-item .info .price {
                font-size: 14px;
            }
        }

        @media (max-width: 480px) {
            header {
                padding: 5px 0;
            }

            .navbar {
                flex-direction: column;
                align-items: flex-start;
                padding: 0 10px;
            }

            .navbar a {
                margin: 5px 0;
                font-size: 14px;
            }

            .grid-container {
                grid-template-columns: 1fr;
                padding: 10px;
                margin: 4.5rem auto 0 auto;
            }

            .grid-item {
                border: 3px solid #ddd;
            }

            .grid-item .info h3 {
                font-size: 16px;
            }

            .grid-item .info p {
                font-size: 12px;
            }

            .grid-item .info .price {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<header>
    <div class="navbar">
        <div class="links">
            <a href="#">Home</a>
            <a href="#">Products</a>
            <a href="#">About Us</a>
            <a href="#">Contact</a>
        </div>
        <div class="user">
            <span><%= username %></span> <a class="logout" href="logout.jsp">Logout</a>
        </div>
    </div>
</header>

<sql:setDataSource var="dataSource"
                   driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/meatshop?useSSL=false&serverTimezone=UTC"
                   user="root"
                   password="admin" />

<sql:query dataSource="${dataSource}" var="result">
    SELECT * FROM meats;
</sql:query>

<!-- Grid container -->
<div class="grid-container">

    <c:forEach var="row" items="${result.rows}">
        <div class="grid-item">
            <p>${row.name}</p>
            <img src="image?id=${row.id}" alt="${row.name}" style="max-width: 300px;"/>
            <div class="info">
                <h3>PANDA low</h3>
                <p>USA</p>
                <img src="https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/b1bcbca4-e853-4df7-b329-5be3c61ee057/NIKE+DUNK+LOW+RETRO.png" alt="PANDA low">
                <div class="price">400k</div>
                <button class="cart-btn" onclick="addToCart('PANDA low', 400)">Add to Cart</button>
            </div>
        </div>
    </c:forEach>
    <div class="grid-item">
        <div class="info">
            <h3>PANDA low</h3>
            <p>USA</p>
            <img src="https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/b1bcbca4-e853-4df7-b329-5be3c61ee057/NIKE+DUNK+LOW+RETRO.png" alt="PANDA low">
            <div class="price">400k</div>
            <button class="cart-btn" onclick="addToCart('PANDA low', 400)">Add to Cart</button>
        </div>
    </div>
    <div class="grid-item">
        <div class="info">
            <h3>Air force</h3>
            <p>USA</p>
            <img src="https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/b7d9211c-26e7-431a-ac24-b0540fb3c00f/AIR+FORCE+1+%2707.png" alt="Air force">
            <div class="price">350k</div>
            <button class="cart-btn" onclick="addToCart('Air force', 350)">Add to Cart</button>
        </div>
    </div>
    <div class="grid-item">
        <div class="info">
            <h3>Jordan low dunk</h3>
            <p>USA</p>
            <img src="https://th.bing.com/th/id/OIP.jWKsX-W0zL1Gr3rEyapbagAAAA?rs=1&pid=ImgDetMain" alt="Jordan low dunk">
            <div class="price">255k</div>
            <button class="cart-btn" onclick="addToCart('Jordan low dunk', 255)">Add to Cart</button>
        </div>
    </div>
</div>

<script>
    function addToCart(product, price) {
        const cart = JSON.parse(localStorage.getItem('cart')) || [];
        cart.push({ product, price });
        localStorage.setItem('cart', JSON.stringify(cart));
        alert(product + ' has been added to the cart');
    }
</script>

</body>
</html>
