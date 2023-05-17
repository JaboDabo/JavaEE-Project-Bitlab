package kz.bitlab.techorda.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.bitlab.techorda.db.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/details")
public class BlogDetailsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("blog_id"));
        Blog blog = DBConnection.getBlog(id);
        ArrayList<Comment> comments = DBConnection.getAllComments(id);
        request.setAttribute("comments", comments);
        request.setAttribute("blog", blog);
        request.getRequestDispatcher("/blogdetails.jsp").forward(request, response);
    }
}