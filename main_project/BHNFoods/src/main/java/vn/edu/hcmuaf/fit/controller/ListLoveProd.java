package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListLoveProd", value = "/loveProduct")
public class ListLoveProd extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        String idUser = user.getIdUser();
        List<Product> listLoveProd = ProductService.getInstance().getListLoveProd(idUser);
        request.setAttribute("listLoveProd", listLoveProd);
        request.getRequestDispatcher("loveProduct.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
