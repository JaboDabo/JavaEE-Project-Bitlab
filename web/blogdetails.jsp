<%--
  Created by IntelliJ IDEA.
  User: jambyldaulethan
  Date: 18.05.2023
  Time: 00:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.bitlab.techorda.db.*" %>
<%@ page import="kz.bitlab.techorda.db.Blog" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>

<div class="container mb-5">
    <%@include file="navbar.jsp"%>
</div>

<%
    Blog blog = (Blog)request.getAttribute("blog");

    if (blog != null) {
%>

<div class = "container ms-auto">
    <div class="row mt-3" style="background-color: #bacbe6; margin-left: 1px; margin-right: 2px" >
        <div class="col-12">
            <div class = "d-flex justify-content-between align-items-center ms-2">
                <div class = "title-link" style = "width: 80%">
                    <a style="text-decoration: none; color: black" class = "display-5"><%=blog.getTitle()%></a>
                </div>
                <div class = "d-flex justify-content-around" style="width: 15%; <%

                    if (currentUser == null || currentUser.getRole_id() != 1) {

                    %>

                        visibility: hidden;


                    <%
                            }
                    %>
                        ">
                    <%
                        request.setAttribute("blog_id", blog.getId());
                    %>


                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editBlog">
                        <span class="bi bi-pencil-square"></span>Edit
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="editBlog" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                         aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Edit Blog</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <%@include file="editblog.jsp"%>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                                </div>
                            </div>
                        </div>
                    </div>

                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteBlog">
                        <span class="bi bi-trash"></span>Delete
                    </button>

                    <!-- Modal -->
                    <%@include file="deleteblog.jsp"%>


                </div>
            </div>
            <div class = "d-flex justify-content-between align-items-center ms-2 mt-1">
                <p class = "lead"><em><%=blog.getTime()%></em></p>
            </div>
            <div class = "border-top border-dark">
                <p class="lead"><%=blog.getContent()%></p>
            </div>

        </div>

    </div>

    <%
        ArrayList<Comment> comments = (ArrayList<Comment>) request.getAttribute("comments");
        if (comments != null) {
            for (Comment comment: comments) {

    %>
    <div class = "row mt-2">

        <div class = "col-12 mt-2">


            <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1"><%=DBConnection.getUser(comment.getUser_id()).getFull_name()%></h5>
                        <small class="text-muted"><%=comment.getPost_date()%></small>
                    </div>
                    <p class="mb-1"><%=comment.getComment()%></p>
                </a>

            </div>

        </div>

    </div>
    <%
            }
        }
    %>

</div>
<%
    }
%>

</div>




</body>
</html>