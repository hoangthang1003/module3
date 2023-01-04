<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 04/01/2023
  Time: 1:45 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>exercise</title>
</head>
<body>
<form method="post" action="/user?action=add">
    <input name="name" placeholder="Name">
    <input name="email" placeholder="Email">
    <input name="country" placeholder="Country">
    <button type="submit">Save</button>
</form>
</body>
</html>
