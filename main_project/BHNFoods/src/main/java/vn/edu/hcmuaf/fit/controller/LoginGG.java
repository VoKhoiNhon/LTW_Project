package vn.edu.hcmuaf.fit.controller;
import vn.edu.hcmuaf.fit.beans.GoogleUtils;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginGG", value = "/LoginGG")
public class LoginGG extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public LoginGG() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String code = request.getParameter("code");
        request.setCharacterEncoding("utf8");
        response.setCharacterEncoding("utf8");
        response.setContentType("text/html; charset= utf8");

        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
            dis.forward(request, response);
        }
        else {
            String accessToken = GoogleUtils.getToken(code);
            User googlePojo = GoogleUtils.getUserInfo(accessToken);
            request.setAttribute("id", googlePojo.getId());
            request.setAttribute("name", googlePojo.getName());
            request.setAttribute("email", googlePojo.getEmail());

            if(!UserService.getInstance().checkAccountExist(googlePojo.getEmail(),googlePojo.getEmail())) {
                UserService.getInstance().addUserGG(googlePojo.getName(), googlePojo.getEmail(), googlePojo.getId());
            }
            User user=UserService.getInstance().getUserByPhoneOrEmail(googlePojo.getEmail());
            HttpSession session= request.getSession();
            session.setAttribute("auth",user);
            RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
            dis.forward(request, response);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);

    }
}
