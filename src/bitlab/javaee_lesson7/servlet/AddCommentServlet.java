package bitlab.javaee_lesson7.servlet;

import bitlab.javaee_lesson7.db.Comments;
import bitlab.javaee_lesson7.db.DBManager;
import bitlab.javaee_lesson7.db.Hotels;
import bitlab.javaee_lesson7.db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/addcomment")
public class AddCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Users currentUser = (Users)request.getSession().getAttribute("USER");

        if (currentUser!=null) {
            request.setCharacterEncoding("utf8"); // чтобы воспринимал кириллицу
            Long hotelId = Long.parseLong(request.getParameter("hotel_id"));
            Hotels hotel = DBManager.getHotel(hotelId);

            if (hotel!=null){
                String commentText = request.getParameter("comment");
                Comments comment = new Comments();
                comment.setComment(commentText);
                comment.setUser(currentUser);
                comment.setHotel(hotel);

                DBManager.addComment(comment);
                response.sendRedirect("/details?id="+ hotel.getId()+"#addCommentDiv");

            }else{
                response.sendRedirect("/"); // выбросит на страницу index
            }

        }else{
            response.sendRedirect("/login");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
