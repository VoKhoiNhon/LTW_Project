package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Cart", value = "/Cart")
public class ListCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idUser = request.getParameter("idUser");
        List<Cart> listCart = ProductService.getInstance().getListCart(idUser);
        request.setAttribute("listCart",listCart);
        int sum= ProductService.getInstance().sumCart(listCart);
        request.setAttribute("sum",sum);
        request.getRequestDispatcher("cart.jsp").forward(request,response);
//        request.getRequestDispatcher("ListProduct.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
