<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 04/01/2023
  Time: 11:08 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>exercise</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<form class="d-flex" method="post" action="/user?action=search">
    <input class="form-control me-2" name="country" type="text" placeholder="Search" aria-label="Search">
    <button class="btn btn-outline-success" type="submit" >Search</button>
</form>
<a href="/view/add.jsp">Thêm mới</a>
<table class="table table-dark">
    <tr>
        <td>STT</td>
        <td>Name</td>
        <td>Email</td>
        <td>Country</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach var="user" items="${userList}" varStatus="stt">
        <tr>
            <th>${stt.count}</th>
            <th>${user.name}</th>
            <th>${user.email}</th>
            <th>${user.country}</th>
            <th><a href="/user?action=update&id=${user.id}">Edit</a></th>
            <th><a href="/user?action=delete&id=${user.id}  ">Delete</a></th>
        </tr>
    </c:forEach>
</table>
</body>
</html>
