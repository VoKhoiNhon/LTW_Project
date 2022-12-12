package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Feedback;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.CommentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDateTime;

@WebServlet(name = "SendComment", value = "/sendComment")
public class SendComment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String text = request.getParameter("text");
        System.out.println(text);
        String idUser = request.getParameter("idU");
        System.out.println(idUser);
        String idProd = request.getParameter("idP");
        System.out.println(idProd);
//        User user = session.getAttribute("auth");
        LocalDateTime dateTime = LocalDateTime.now();
        String time = dateTime.getYear() + "-" + dateTime.getMonthValue() + "-" + dateTime.getDayOfMonth();
        System.out.println(time);
        String userName = "Nguyễn Văn Anh";
//        if(user != null) {
//            userName = user.getNameUser();
//        }
        int star = Integer.parseInt(request.getParameter("star"));
        System.out.println(star);
        PrintWriter out = response.getWriter();
        String score = "";
        for (int i = 0; i < star; i++) {
            score += "<i class=\"fa fa-star\"></i>\n";
        }
        out.println("<div class=\"comment\">\n" +
                "                <div class=\"comment-user mt-4\">\n" +
                "                    <span class=\"comment-name mr-3\">"+userName+"</span>\n" +
                "                    <span class=\"comment-star\">\n"
                                        + score +
                "                    </span>\n" +
                "                    <div class=\"content-padding\">\n" +
                "                        <span class=\"comment-content\">"+text+"</span>\n" +
                "                    </div>\n" +
                "                    <span class=\"comment-date\">"+time+"</span>\n" +
                "                </div>\n" +
                "            </div>");
        CommentService.getInstance().insertComment(idUser,idProd,star,text,time);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
