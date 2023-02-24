package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.UserService;
import vn.edu.hcmuaf.fit.util.Encryption;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ForgotPass", value = "/ForgotPass")
public class ForgotPass extends HttpServlet {
    String codeRandom=UserService.getInstance().codeChange();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("checkUserName");
        String pass = request.getParameter("pass");
        String repass = request.getParameter("repass");
        String code = request.getParameter("code");

        request.setAttribute("mess", codeRandom);

        if (!UserService.getInstance().checkAccountExist(account, account)) {
            request.setAttribute("errorName", "* Tài khoản ko tồn tại");
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
        } else if (!codeRandom.equals(code)) {
            request.setAttribute("errorCode", "* Mã xác nhận ko trùng khớp");
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
        } else if (!pass.equals(repass)) {
            request.setAttribute("errorDup", "* Mật khẩu không trùng khớp");
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
        } else if (pass.equals(repass)) {
            pass = Encryption.toSHA1(pass);
            UserService.getInstance().changePass(account, account, pass);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
