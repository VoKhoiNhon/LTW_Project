package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginFB", value = "/LoginFB")
public class LoginFB extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginFB() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf8");
        response.setCharacterEncoding("utf8");
        response.setContentType("text/html; charset= utf8");
        String action = request.getParameter("action");
        User user = null;
        System.out.println("sbdfkb");
        if (action.equals("Face")) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String id = request.getParameter("id");
            System.out.println(77777);
            UserService.getInstance().addUserFB(name, email, null, id);
            System.out.println("123");
            user = UserService.getInstance().getLastUser();
            response.sendRedirect("/BHNFoods/index?idUser=" + user.getIdUser());
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
