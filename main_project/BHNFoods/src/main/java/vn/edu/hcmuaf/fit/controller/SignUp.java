package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SignUp", value = "/SignUp")
public class SignUp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("signup.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String pass = request.getParameter("pass");
        String repass = request.getParameter("repass");

        boolean exist = UserService.getInstance().checkAccountExist(email, phone);
        if (name == null  ) {
            request.setAttribute("errorName", "*Xin hãy nhập tên của bạn");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
        if (exist) {
            request.setAttribute("errorAcc", "* Tài khoản đã được sử dụng");
            request.getRequestDispatcher("signup.jsp").forward(request, response);

        } else if (!pass.equals(repass)) {
            request.setAttribute("errorDup", "* Mật khẩu không trùng khớp");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }else{
            int newUID=  UserService.getInstance().getListUser().size()+1;

           UserService.getInstance().addUser(name, email,phone,pass);

            response.sendRedirect("http://localhost:8080/BHNFoods/index?idUser="+newUID);
        }


    }
}
