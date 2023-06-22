package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Log;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.db.DB;
import vn.edu.hcmuaf.fit.service.UserService;
import vn.edu.hcmuaf.fit.util.Brower;
import vn.edu.hcmuaf.fit.util.Encryption;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.StringReader;
import java.util.List;

@WebServlet(name = "UpdateCtAccount", value = "/UpdateCtAccount")
public class UpdateCtAccount extends HttpServlet {
    String src = "account";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user= (User) session.getAttribute("auth");
        String iduser = user.getIdUser();
        String name = request.getParameter("name");
        int sex = Integer.parseInt(request.getParameter("sex"));
        String birthday = request.getParameter("birthday");

        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String passw = request.getParameter("passw");
        String address = request.getParameter("address");
        String repassw = request.getParameter("repassw");
        String oldPass = UserService.getInstance().getEncryptPassUser(iduser);
        int t = 0;

        if (!passw.equals(repassw)) {
            request.setAttribute("error", "* Mật khẩu không trùng khớp");
            request.getRequestDispatcher("/account").forward(request, response);
        }
         else if ("".equals(birthday)) {
            request.setAttribute("birthday", "*nhập dô đi ");
            System.out.println(3);
            t = 1;
            request.getRequestDispatcher("account.jsp").forward(request,response);
        }
        else {
            passw = passw == "" ? oldPass : Encryption.toSHA1(passw);
            UserService.getInstance().updateCtAccount(iduser, name, sex, birthday, email, phone, passw, address, repassw);
            DB.me().insert(new Log(Log.INFO, "user" + UserService.getInstance().getListUser().size(), this.src, "Signup SUCCESS", 0, Brower.getBrowerName(request.getHeader("User-Agent")), Brower.getLocationIp(request.getRemoteAddr())));
            t = 2;


        }
      switch (t) {
          case 1:
              request.getRequestDispatcher("/account").forward(request, response);
              break;
          case 2:
              response.sendRedirect("/index");
              break;
      }

    }
}