<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 30/12/2022
  Time: 4:33 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>exercise</title>
</head>
<body>
<form method="get" action="/customer">
<table>
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Date</th>
        <th>Address</th>
        <th>STT</th>
    </tr>
    <c:forEach var="customer" items="${customerList}" varStatus="status">
        <tr>
        <td>${status.count}</td>
        <td>${customer.name}</td>
        <td>${customer.birth}</td>
        <td>${customer.address}</td>
        <td><img src="${customer.img}"></td>
        </tr>
    </c:forEach>
</table>
</form>
</body>
</html>
