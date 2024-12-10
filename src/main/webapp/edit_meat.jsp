<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Meat</title>
</head>
<body>
<h1>Edit Meat</h1>

<c:if test="${not empty error}">
    <p style="color: red;">${error}</p>
</c:if>
<c:if test="${not empty success}">
    <p style="color: green;">${success}</p>
</c:if>

<form action="updateMeat" method="post" enctype="multipart/form-data">
    <input type="hidden" name="meatId" value="${param.meatId}">
    <label for="meatType">Meat Type:</label>
    <input type="text" id="meatType" name="meatType" value="${param.meatType}" required><br><br>

    <label for="meatName">Meat Name:</label>
    <input type="text" id="meatName" name="meatName" value="${param.meatName}" required><br><br>

    <label for="price">Price:</label>
    <input type="number" id="price" name="price" step="0.01" value="${param.price}" required><br><br>

    <c:if test="${not empty param.meatImage}">
        <label>Current Image:</label><br>
        <img src="displayImage?meatId=${param.meatId}" alt="Meat Image" style="max-width: 150px; max-height: 150px;"><br><br>
    </c:if>

    <label for="meatImage">Update Image (optional):</label>
    <input type="file" id="meatImage" name="meatImage" accept="image/*"><br><br>

    <button type="submit">Update Meat</button>
</form>

<p><a href="index.jsp">Back to Meat List</a></p>
</body>
</html>
