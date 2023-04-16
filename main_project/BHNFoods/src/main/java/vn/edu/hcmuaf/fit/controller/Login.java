package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Log;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.db.DB;
import vn.edu.hcmuaf.fit.service.LogSercive;
import vn.edu.hcmuaf.fit.service.UserService;
import vn.edu.hcmuaf.fit.util.Brower;
import vn.edu.hcmuaf.fit.util.Encryption;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.BufferedReader;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

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
        password = Encryption.toSHA1(password);

        User user = UserService.getInstance().checkLogin(username, password);
        User existName = UserService.getInstance().checkUser(username);
       int lv= LogSercive.getInstance().getLevelForDayLogin(existName.getNameUser());
        if(existName!=null) {
            if(!existName.getPassw().equals(password)) {
                request.setAttribute("error", "Sai mật khẩu");
                if (lv < 5) {
                    DB.me().insert(new Log(lv+1, existName.getIdUser(), this.src, "LOGIN FALSE: " + username, 0, Brower.getBrowerName(request.getHeader("User-Agent")), Brower.getLocationIp(request.getRemoteAddr())));
                }
                if(lv==5){
                    UserService.getInstance().lockUser(existName.getIdUser());
                }
            }
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }else if (user != null && user.getDecentralization() == 2) {
            HttpSession session = request.getSession(true);
            session.setAttribute("auth", user);

            DB.me().insert(new Log(Log.INFO, user.getIdUser(), this.src, "LOGIN SUCCESS", 0, Brower.getBrowerName(request.getHeader("User-Agent")),Brower.getLocationIp(request.getRemoteAddr())));

            response.sendRedirect("AdminMain");

        } else if (user != null && user.getDecentralization() == 0) {
            HttpSession session = request.getSession(true);
            session.setAttribute("auth", user);
            session.setAttribute("idUser", user.getIdUser());
            request.setAttribute("idUser", user.getIdUser());

            DB.me().insert(new Log(Log.INFO, user.getIdUser(), this.src, "LOGIN SUCCESS", 0, Brower.getBrowerName(request.getHeader("User-Agent")),Brower.getLocationIp(request.getRemoteAddr())));
     response.sendRedirect("/BHNFoods/index?idUser=" + user.getIdUser());

        } else  {
            request.setAttribute("error", "Sai tài khoản hoặc mật khẩu");

            DB.me().insert(new Log(Log.WARNING, null, this.src, "LOGIN FALSE: " + username, 0, Brower.getBrowerName(request.getHeader("User-Agent")),Brower.getLocationIp(request.getRemoteAddr())));

            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

}