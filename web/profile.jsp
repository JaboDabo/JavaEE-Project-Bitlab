<%@ page import="kz.bitlab.techorda.db.User" %>
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
    <title>My profile</title>
</head>
<body>

<div class="container mb-5">
    <%@include file="navbar.jsp"%>
</div>

<div class="container mt-3">
    <div class="text-center">
        <div class="col-12 mx-auto">
            <h1>Hi, <%=currentUser!=null?currentUser.getFull_name():""%></h1>
            <h2 style="color: #0a58ca">You are <%=currentUser.getRole_id()==1?"ADMIN":"USER"%> of this website!</h2>
        </div>
    </div>
</div>

<div class = "container mt-5">
    <div class = "row mt-5">
        <div class = "col-8 mt-5 mx-auto">
            <label class="form-label">Full Name :</label>
            <div class="mb-3">
                <input type="text" placeholder="Your FullName" class="form-control"
                       value="<%=currentUser.getFull_name()%>" readonly>
            </div>
            <label class="form-label">Email :</label>
            <div class="mb-3">
                <input type="text" placeholder="New Email" class="form-control"
                       value="<%=currentUser.getEmail()%>" readonly>
            </div>
            <label class="form-label">Password :</label>
            <div class="mb-3">

                <input type="text" placeholder="New Password" class="form-control"
                       value="<%=currentUser.getPassword()%>" readonly>
            </div>
            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#editProf">
                Edit Profile
            </button>


            <!-- Modal -->
            <div class="modal fade" id="editProf" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                 aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Edit Profile</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="/save-page" method="POST">
                                <input type="hidden" name="id" value="<%=currentUser.getId()%>">
                                <div class="mb-3">
                                    <label  class="form-label">FullName:</label>
                                    <input type="text" class="form-control" name="full-name" value="<%=currentUser.getFull_name()%>">
                                </div>
                                <div class="mb-3">
                                    <label  class="form-label">Email:</label>
                                    <input type="email" class="form-control" name="email" value="<%=currentUser.getEmail()%>">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" >Password:</label>
                                    <input type="text" class="form-control" name="password" value="<%=currentUser.getPassword()%>">
                                </div>
                                <div class="row mt-3">
                                    <div class="col-12">
                                        <button class="btn btn-primary">SAVE</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
</div>

</body>
</html>