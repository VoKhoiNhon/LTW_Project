package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Log;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.db.DB;
import vn.edu.hcmuaf.fit.service.UserService;
import vn.edu.hcmuaf.fit.util.Encryption;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {
    String src = "LOGIN";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        password  = Encryption.toSHA1(password);

        User user = UserService.getInstance().checkLogin(username, password);

        if (user != null && user.getDecentralization() == 1) {
            HttpSession session = request.getSession(true);
            session.setAttribute("auth", user);
            DB.me().insert(new Log(Log.INFO,user.getIdUser(), this.src, "LOGIN SUCCESS", 0));
            response.sendRedirect("AdminMain");


        } else if (user != null && user.getDecentralization() != 1) {
            HttpSession session = request.getSession(true);
            session.setAttribute("auth", user);
            session.setAttribute("idUser", user.getIdUser());
            request.setAttribute("idUser", user.getIdUser());
            DB.me().insert(new Log(Log.INFO,user.getIdUser(), this.src, "LOGIN SUCCESS", 0));
            response.sendRedirect("http://localhost:8080/BHNFoods/index?idUser=" + user.getIdUser());
        } else {
            request.setAttribute("error", "Sai tài khoản hoặc mật khẩu");
            DB.me().insert(new Log(Log.WARNING,null, this.src, "LOGIN FALSE: " + username, 0));
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }
}
