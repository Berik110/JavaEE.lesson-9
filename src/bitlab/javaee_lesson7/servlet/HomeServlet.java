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

@WebServlet(value = "/home")
public class HomeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Hotels> hotels = DBManager.getAllHotels();
        request.setAttribute("ht", hotels);

        request.getRequestDispatcher("/index.jsp").forward(request,response);
    }
}
