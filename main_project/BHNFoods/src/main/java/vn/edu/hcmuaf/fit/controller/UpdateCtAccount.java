package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.StringReader;
import java.util.List;

@WebServlet(name = "UpdateCtAccount", value = "/UpdateCtAccount")
public class UpdateCtAccount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String iduser = request.getParameter("iduser");
        String name = request.getParameter("name");
        int sex= Integer.parseInt(request.getParameter("sex"));
        System.out.println(sex);
        String birthday= request.getParameter("birthday");
        String email = request.getParameter("email");
        String phone= request.getParameter("phone");
        String passw= request.getParameter("passw");
        String address= request.getParameter("address");
        String repassw= request.getParameter("repassw");
        UserService.getInstance().updateCtAccount(iduser, name, sex, birthday, email, phone, passw,address, repassw);

        if(!passw.equals(repassw)){
            request.setAttribute("error", "*Mật khẩu không trùng khớp.");
            request.getRequestDispatcher("http://localhost:8080/BHNFoods/ListAccount?idUser=user1").forward(request,response);
        }
        else {
            response.sendRedirect("http://localhost:8080/BHNFoods/index?idUser=" + iduser);

        }

    }
}