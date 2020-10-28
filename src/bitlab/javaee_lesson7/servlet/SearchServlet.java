package bitlab.javaee_lesson7.servlet;

import bitlab.javaee_lesson7.db.DBManager;
import bitlab.javaee_lesson7.db.Hotels;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/search")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String key = request.getParameter("key");
        ArrayList<Hotels> hotels = DBManager.searchHotels("key",0,0,0,0);

        request.setAttribute("hotels", hotels);
        request.getRequestDispatcher("/search.jsp").forward(request,response);

    }
}
