package kz.bitlab.techorda.servlets;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.bitlab.techorda.db.DBConnection;
import kz.bitlab.techorda.db.Blog;
import kz.bitlab.techorda.db.User;

import java.io.IOException;

@WebServlet(value = "/saveblog")
public class SaveBlogServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User currentUser = (User)request.getSession().getAttribute("currentUser");
        if(currentUser!=null && currentUser.getRole_id() == 1) {
            request.getRequestDispatcher("/addblog.jsp").forward(request, response);
        }else{
            response.sendRedirect("/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String redirect = "/login";
        request.setCharacterEncoding("utf8");
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        if(currentUser!=null) {

            redirect = "/";
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            Long id = Long.parseLong(request.getParameter("blog_id"));

            Blog blog = DBConnection.getBlog(id);
            if (blog != null) {
                blog.setTitle(title);
                blog.setContent(content);
                DBConnection.saveBlog(blog);
                redirect = "/details?blog_id=" + id;
            }
        }

        response.sendRedirect(redirect);

    }
}