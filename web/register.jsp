<%--
  Created by IntelliJ IDEA.
  User: jambyldaulethan
  Date: 18.05.2023
  Time: 00:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
</head>
<body>
<div class="container mb-5">
    <%@include file="navbar.jsp"%>
</div>

<div class="container ">
    <div class="row">
        <div class="col-6 mx-auto">
            <%
                String emailerror = request.getParameter("emailerror");
                if(emailerror!=null){
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Email is busy!
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                }
            %>
            <%
                String passworderror = request.getParameter("passworderror");
                if(passworderror!=null){
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Password are not same!
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                }
            %>
            <%
                String success = request.getParameter("success");
                if(success!=null){
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                User created successfully!
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                }
            %>
            <form action="/register" method="post">
                <div class="row">
                    <div class="col-12">
                        <label>EMAIL : </label>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <input type="email" class="form-control" name="email" required placeholder="Insert Email">
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <label>PASSWORD : </label>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <input type="password" class="form-control" name="password" required placeholder="Insert Password">
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <label>REPEAT PASSWORD : </label>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <input type="password" class="form-control" name="re_password" required placeholder="Repeat Password">
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <label>FULL NAME : </label>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <input type="text" class="form-control" name="full_name" required placeholder="Full Name">
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-12">
                        <label> Role : </label>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <select class="form-select" name="role-id">
                            <option>USER</option>
                            <option>ADMIN</option>
                        </select>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <button class="btn btn-info">SIGN UP</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>