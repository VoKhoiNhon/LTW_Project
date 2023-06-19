package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Contact;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ContactInUser", value = "/ContactInUser")
public class ContactInUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        List<User> listCtAccount = UserService.getInstance().listCTAccount(user.getIdUser());
        request.setAttribute("listCtAccount", listCtAccount);
        request.getRequestDispatcher("contact.jsp").forward(request,response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idcontact = request.getParameter("idcontact");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        String idUser = user.getIdUser();
        String phone = request.getParameter("phone");
        String nameuser = request.getParameter("nameuser");
        String content = request.getParameter("content");
        String email = request.getParameter("email");
        UserService.getInstance().addcontact(idcontact,idUser, content,nameuser, phone, email);
        response.sendRedirect("/BHNFoods/index");
    }


}