package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Log;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.db.DB;
import vn.edu.hcmuaf.fit.service.UserService;
import vn.edu.hcmuaf.fit.service.VerifyingService;
import vn.edu.hcmuaf.fit.util.Brower;
import vn.edu.hcmuaf.fit.util.Encryption;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "VerifyingEmail", value = "/verifyingEmail")
public class VerifyingEmail extends HttpServlet {
    String src = "VerifyingEmail";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(VerifyingService.getInstance().isExistKey(request.getParameter("key"))) {
            VerifyingService.getInstance().dropEventNow(request.getParameter("different"));
            VerifyingService.getInstance().dropKeyNow(request.getParameter("key"));
            request.getRequestDispatcher("VerifyingEmail.jsp").forward(request, response);
        } else {
            request.setAttribute("outOfTime", "Thời gian quá hạn");
            request.getRequestDispatcher("VerifyingEmail.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = UserService.getInstance().getUserById((String) session.getAttribute("userId"));
        String newPass = request.getParameter("pass");
        UserService.getInstance().updatePass(user.getIdUser(), Encryption.toSHA1(newPass));
            session.setAttribute("auth",user);
            response.sendRedirect("/index");
        }
}
