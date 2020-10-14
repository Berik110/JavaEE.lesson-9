package bitlab.javaee_lesson7.servlet;

import bitlab.javaee_lesson7.db.DBManager;
import bitlab.javaee_lesson7.db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/updatepicture")
public class UpdatePictureServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Users user = (Users) request.getSession().getAttribute("USER");
        if (user!=null) {
            String url = request.getParameter("url");
            user.setPicture(url);
            if(DBManager.updateUserPicture(user)){
                request.getSession().setAttribute("USER", user);
            }
            response.sendRedirect("/profile");

        }else{
            response.sendRedirect("/login");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
