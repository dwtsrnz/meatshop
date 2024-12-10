<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Meats</title>
</head>
<body>
<h1>Meat List</h1>

<c:if test="${not empty error}">
    <p style="color: red;">${error}</p>
</c:if>
<c:if test="${not empty success}">
    <p style="color: green;">${success}</p>
</c:if>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Type</th>
        <th>Name</th>
        <th>Price</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="meat" items="${meats}">
        <tr>
            <td>${meat.meat_id}</td>
            <td>${meat.meat_type}</td>
            <td>${meat.meat_name}</td>
            <td>${meat.price}</td>
            <td>
                <a href="edit_meat.jsp?meatId=${meat.meat_id}&meatType=${meat.meat_type}&meatName=${meat.meat_name}&price=${meat.price}">Edit</a>
                <a href="deleteMeat?meatId=${meat.meat_id}" onclick="return confirm('Are you sure you want to delete this meat?');">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
