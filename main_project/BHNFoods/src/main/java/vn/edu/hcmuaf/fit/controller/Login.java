package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = UserService.getInstance().checkLogin(username, password);
        if (user == null) {
            request.setAttribute("error", "Sai tài khoản hoặc mật khẩu");
            request.getRequestDispatcher("admin_template/login.jsp").forward(request, response);
        } else if (user.getDecentralization() == 1) {
            HttpSession session = request.getSession(true);
            session.setAttribute("auth", user);
            request.getRequestDispatcher("admin_template/index.jsp").forward(request, response);

        } else {
            HttpSession session = request.getSession(true);
            session.setAttribute("auth", user);
            response.sendRedirect("ListProduct.jsp");
        }

    }
}

