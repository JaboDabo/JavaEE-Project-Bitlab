package kz.bitlab.techorda.servlets;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.bitlab.techorda.db.Blog;
import kz.bitlab.techorda.db.DBConnection;


import java.io.IOException;

@WebServlet(value = "/editblog")
public class EditBlogServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("blog_id"));
        Blog blog = DBConnection.getBlog(id);
        req.setAttribute("blog", blog);
        req.getRequestDispatcher("/editblog.jsp").forward(req, resp);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("blog_id"));
        Blog blog = DBConnection.getBlog(id);
        String content = request.getParameter("content");
        String title = request.getParameter("title");
        DBConnection.saveBlog(blog);
        request.getRequestDispatcher("blog.jsp").forward(request, response);

    }
}