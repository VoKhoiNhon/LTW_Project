package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Search", value = "/Search")
public class Search extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idUser = request.getParameter("idUser");
        List<Cart> listCart = ProductService.getInstance().getListCart(idUser);
        request.setAttribute("listCart",listCart);
        String search = request.getParameter("searchPR");
        List<Product> productList = ProductService.getInstance().getListPrNameSearch(search);
        request.setAttribute("listSearchPR", productList);
        request.getRequestDispatcher("searchPR.jsp").forward(request,response);
    }

}
