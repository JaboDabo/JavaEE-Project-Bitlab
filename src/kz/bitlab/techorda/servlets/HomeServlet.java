package kz.bitlab.techorda.servlets;
import kz.bitlab.techorda.db.DBuilt;
import kz.bitlab.techorda.models.Item;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/index")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        ArrayList<Item> items = DBuilt.getItems();
        request.setAttribute("items", items);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

}