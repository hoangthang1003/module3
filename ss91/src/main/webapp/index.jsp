<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 29/12/2022
  Time: 11:22 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>exercise</title>
</head>
<body>
<form action="/total" method="post">
    <p>List Price: </p>
    <input name="listPrice" placeholder="Nhập giá niêm yết sản phẩm">
    <p>Discount Percent:</p>
    <input name="discountPercent" placeholder="Nhập tỷ lệ chiết khấu (%)">
    <br><br>
    <button type="submit">Calculate Discount</button>
</form>
</body>
</html>
