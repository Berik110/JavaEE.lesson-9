package bitlab.javaee_lesson7.servlet;

import bitlab.javaee_lesson7.db.DBManager;
import bitlab.javaee_lesson7.db.Users;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

@WebServlet(value = "/ajax_check_user")
public class AjaxCheckUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("user_email");
        String password = request.getParameter("user_password");

        Users checkUser = DBManager.getUserByEmail(email);

        String message = "User with mail '" + email + "' doesn't exist!";
        String status = "error";

        if (checkUser!=null){
            message = "Incorrect password fo user '" + email + "'!";
            if (checkUser.getPassword().equals(password)){
                message="Okay";
                status="ok";
            }
        }

        HashMap<String, String> result = new HashMap<>();
        result.put("status", status);
        result.put("message", message);

        Gson gson = new Gson();
        out.print(gson.toJson(result));


    }
}
