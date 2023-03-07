package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.UserService;
import vn.edu.hcmuaf.fit.service.VerifyingService;
import vn.edu.hcmuaf.fit.util.Encryption;
import vn.edu.hcmuaf.fit.util.MailSender;

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

//        String pass = request.getParameter("pass");
//        String repass = request.getParameter("repass");
//        String code = request.getParameter("code");


        if (!UserService.getInstance().checkAccountExist(account, account)) {
            request.setAttribute("errorName", "* Tài khoản ko tồn tại");
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            User user = UserService.getInstance().getUserByPhoneOrEmail(account);
            String salt = Encryption.randomSalt();
            String key = Encryption.toSHA1(user.getEmail() + salt);
            session.setAttribute("idUser", user.getIdUser());
            VerifyingService.getInstance().addKey(key, salt);
            String mailMessage = "<!DOCTYPE html>\n" +
                    "<html lang=\"en\">\n" +
                    "<head>\n" +
                    "  <meta charset=\"UTF-8\">\n" +
                    "  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n" +
                    "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                    "  <title>Document</title>\n" +
                    "</head>\n" +
                    "<body>\n" +
                    "  <a style=\"text-decoration: none; padding: 10px 20px; color: black; background:rgb(192, 192, 241);\" href='http://localhost:8080/BHNFoods/verifyingEmail?key="+key+"&different="+salt+"'>Xác thực ngay</a>\n" +
                    "</body>\n" +
                    "</html>";
            MailSender.send("Xác thực thông tin", mailMessage, user.getEmail());
            StringBuilder sb = new StringBuilder();
            for (int i = user.getEmail().length() - 4; i > 0; i--) {
                sb.append("*");
            }
            String hideMail = user.getEmail().substring(0, 4) + sb.toString();
            request.setAttribute("mailSent", "Thư đã được gửi vào email " + hideMail);
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
        }
    }
}
