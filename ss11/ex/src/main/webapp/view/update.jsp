<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 04/01/2023
  Time: 2:20 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>exercise</title>
</head>
<body>
<form method="post" action="/user?action=update">
    <input type="hidden" name="id" value="${user.id}">
    <input type="text" name="name"  value="${user.name}">
    <input type="text" name="email" value=${user.email}>
    <input type="text" name="country" value=${user.country}>
    <button type="submit">Save</button>
</form>
</body>
</html>
