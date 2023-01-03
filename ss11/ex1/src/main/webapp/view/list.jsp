<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 03/01/2023
  Time: 11:16 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>exercise</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<a href="/product?action=add">Thêm mới</a>
<table class="table table-dark">
    <tr>
        <td>Id</td>
        <td>Name</td>
        <td>Price</td>
        <td>Describe Product</td>
        <td>Manufacturer</td>
        <td>Update</td>
        <td>Delete</td>
    </tr>
    <c:forEach var="product" items="${productList}">
        <tr>
            <th>${product.id}</th>
            <th>${product.product}</th>
            <th>${product.price}</th>
            <th>${product.describeProduct}</th>
            <th>${product.manufacturer}</th>
            <th><a href="/product?action=update&id=${product.id}">Update</a></th>
            <th><a href="/product?action=delete&id=${product.id}">Delete</a></th>
        </tr>
    </c:forEach>
</table>
</body>
</html>
