<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 03/01/2023
  Time: 8:28 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>exercise</title>
</head>
<body>
<form action="/product?action=update" method="post" >
    <h1 style="color: orange">Product Information Udpate</h1>
    <input type="hidden" name="index" value="${product.id}">

    <p>ID</p>
    <input type="text" name="id" value="${product.id}">
    <br>
    <p>Name</p>
    <input type="text" name="name" value="${product.name}">
    <br>
    <p>Price</p>
    <input type="text" name="price" value="${product.price}">
    <br>
    <p>Describe</p>
    <input type="text" name="describe" value="${product.describe}">
    <br>
    <p>Manufacturer</p>
    <input type="text" name="manufacturer" value="${product.manufacturer}">
    <br>
    <button type="submit"  type="button">UPDATE</button>
</form></body>
</html>
