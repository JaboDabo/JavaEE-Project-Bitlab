package kz.bitlab.techorda.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.bitlab.techorda.db.DBConnection;
import kz.bitlab.techorda.db.User;

import java.io.IOException;

@WebServlet(value = "/save-page")
public class SavePageServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullname = req.getParameter("full-name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        int id = Integer.parseInt(req.getParameter("id"));

        User user = DBConnection.getUser(id);

        user.setFull_name(fullname);
        user.setEmail(email);
        user.setPassword(password);

        DBConnection.updateUser(user);

        req.getSession().removeAttribute("currentUser");
        req.getSession().setAttribute("currentUser", user);
        req.getRequestDispatcher("profile.jsp").forward(req, resp);
    }
}