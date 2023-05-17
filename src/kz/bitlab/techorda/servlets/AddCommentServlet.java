package kz.bitlab.techorda.servlets;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.bitlab.techorda.db.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(value = "/addcomment")
public class AddCommentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String redirect = "/login";
        request.setCharacterEncoding("utf8");
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        if(currentUser!=null) {

            String commentary = request.getParameter("comment");
            Long blog_id = Long.parseLong(request.getParameter("blog_id"));
            System.out.println(commentary);
            Blog blog = DBConnection.getBlog(blog_id);
            if (blog != null) {
                Comment comment = new Comment();
                comment.setComment(commentary);
                comment.setUser_id(Math.toIntExact(currentUser.getId()));
                comment.setNews_id(Math.toIntExact(blog_id));
                DBConnection.addComment(comment);
                redirect = "/details?blog_id=" + blog_id;
            }
        }
        response.sendRedirect(redirect);

    }
}
