<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            color: #333;
        }

        .container {
            max-width: 960px;
            margin: 2rem auto;
            padding: 1rem;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 1rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 1rem;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .total {
            text-align: right;
            font-size: 1.2rem;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Your Cart</h2>
    <table>
        <thead>
        <tr>
            <th>Product</th>
            <th>Price</th>
        </tr>
        </thead>
        <tbody id="cart-items">
        <!-- Items will be inserted here by JavaScript -->
        </tbody>
    </table>
    <div class="total">
        Total: <span id="total-price">0</span>k
    </div>
</div>

<script>
    function displayCart() {
        const cart = JSON.parse(localStorage.getItem('cart')) || [];
        const cartItems = document.getElementById('cart-items');
        const totalPrice = document.getElementById('total-price');

        let total = 0;

        cart.forEach(item => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${item.product}</td>
                <td>${item.price}k</td>
            `;
            cartItems.appendChild(row);
            total += item.price;
        });

        totalPrice.textContent = total;
    }

    window.onload = displayCart;
</script>
</body>
</html>
