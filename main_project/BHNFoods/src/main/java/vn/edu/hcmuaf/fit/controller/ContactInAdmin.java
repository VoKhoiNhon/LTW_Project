package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Contact;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ContactInAdmin", value = "/ContactInAdmin")
public class ContactInAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idUser= request.getParameter("idUser");
        ProductService.getInstance().viewContact(idUser);
        request.getRequestDispatcher("adminMain.jsp").forward(request, response);
        response.sendRedirect("mainAdmin.jsp");
    }
}