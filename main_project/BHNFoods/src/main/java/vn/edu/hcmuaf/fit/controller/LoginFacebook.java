package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.RestFB;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import com.restfb.types.User;
import vn.edu.hcmuaf.fit.service.UserService;

@WebServlet(name = "LoginFacebook", value = "/LoginFacebook")
public class LoginFacebook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginFacebook() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf8");
        response.setCharacterEncoding("utf8");
        response.setContentType("text/html; charset= utf8");
        String code = request.getParameter("code");


        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
            dis.forward(request, response);
        } else {
            String accessToken = RestFB.getToken(code);
            User u = RestFB.getUserInfo(accessToken);
            request.setAttribute("id", u.getId());
            request.setAttribute("name", u.getName());
            request.setAttribute("email", u.getEmail());

            if(!UserService.getInstance().checkIdAccount(u.getId())) {
                UserService.getInstance().addUserFB(u.getName(), u.getId());
            }
            vn.edu.hcmuaf.fit.beans.User user= UserService.getInstance().getUserByIdAccount(u.getId());
            HttpSession session= request.getSession();
            session.setAttribute("auth",user);

            RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
            dis.forward(request, response);
            System.out.println("User [id: " + u.getId() + "\t name: " + u.getName()+"\t email: "+u.getEmail()+"]");
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        String code = request.getParameter("code");
//        String accessToken = RestFB.getToken(code);
//        User u = RestFB.getUserInfo(accessToken);
//        UserService.getInstance().addUserFB(u.getName(), u.getId());
//        vn.edu.hcmuaf.fit.beans.User user=UserService.getInstance().getLastUser();
//        System.out.println("User [ name: " + u.getName()+"]");
//        response.sendRedirect("/index?idUser=" + user.getIdUser());
    }
}