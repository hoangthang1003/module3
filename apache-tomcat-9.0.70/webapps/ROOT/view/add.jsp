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
</head>
<body>
<form action="/product?action=add" method="post">
    <input name="id"placeholder="Nhập id">
    <input name="name"placeholder="Nhập tên">
    <input name="price"placeholder="Nhập giá">
    <input name="describeProduct"placeholder="Nhập mô tả sản phẩm">
    <input name  ="manufacturer"placeholder="Nhập nhà sản xuất">
    <button type="submit">Save</button>
</form>
</body>
</html>
