package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Feedback;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "LoadMoreComment", value = "/loadMoreComment")
public class LoadMoreComment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(request.getParameter("step"));
        int page = Integer.parseInt(request.getParameter("step"));
        String id = (String) request.getParameter("id");
        System.out.println(page);
        System.out.println(id);
        List<Feedback> feedbackList = ProductService.getInstance().getFeedBackInPage(id, page);
        System.out.println(feedbackList.size());
        PrintWriter out = response.getWriter();
        for (Feedback f: feedbackList ) {
            String score ="";
            for (int i = 0; i < f.getScoreStar(); i++){
                score += "<i class=\"fa fa-star\"></i>\n";
            }
            out.println("<div class=\"comment\">\n" +
                    "                <div class=\"comment-user mt-4\">\n" +
                    "                    <span class=\"comment-name mr-3\">"+f.getNameUser()+"</span>\n" +
                    "                    <span class=\"comment-star\">\n" +
                                        score+
                    "                   </span>\n" +
                    "                    <div class=\"content-padding\">\n" +
                    "                        <span class=\"comment-content\">"+f.getText()+"</span>\n" +
                    "                    </div>\n" +
                    "                    <span class=\"comment-date\">"+f.getDate()+"</span>\n" +
                    "                </div>\n" +
                    "            </div>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
