
<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 05/01/2023
  Time: 4:20 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/users?action=create">Add New User</a>
    </h2>
</center>
<div class="d-flex justify-content-center align-items-center m-2">
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#add">
        Thêm mới người dùng
    </button></div>
<!-- Modal -->
<div class="modal fade" id="add" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form action="/users?action=create" method="post" class="form-xl">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel1">Thêm mới</h5>
                    <button onclick="add('${user.name}','${user.email}','${user.country}')" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3 row">
                        <label for="name" class="col-sm-3 col-form-label ">User Name:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="name" name="name">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="email" class="col-sm-3 col-form-label">User Email:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="email" name = email>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="country" class="col-sm-3 col-form-label">Country:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="country" name="country">
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>

<form class="d-flex" action="/users?action=search" method="post">
    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="country" value="${user.country}">
    <button class="btn btn-outline-success" type="submit">Search</button>
</form>

<div align="center">
    <caption><h2>List of Users</h2></caption>
    <table border="1" cellpadding="5" class="table table-striped">
        <tr>
            <th>STT</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td><a href="${pageContext.request.contextPath}/users?action=edit&id=${user.getId()}">Edit</a></td>

                <td>
                    <button onclick="infoDelete('${user.getId()}','${user.getName()}')" type="button"
                            class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Delete
                    </button>
                </td>

            </tr>
        </c:forEach>
    </table>
</div>

<%-- modal delete--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="${pageContext.request.contextPath}/users?action=delete" method="post">
                <div class="modal-body">
                    <label for="deleteId"></label><input type="text" hidden id="deleteId" name="id">
                    Bạn có muốn xóa người dùng <span id="deleteName" style="color: brown; font-weight: bold"></span> không ?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Confirm</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function infoDelete(id,name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }
    function add(name,email,country) {
        document.getElementById("name").value = name;
        document.getElementById("email").value = email;
        document.getElementById("country").value = country;
    }
</script>
<h5 class="text-success">${mess}</h5>
</body>

</html>