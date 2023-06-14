package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.beans.SingleProduct;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.mail.Session;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchAdmin", value = "/SearchAdmin")
public class SearchAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        String idUser = user.getIdUser();
        List<Cart> listCart = ProductService.getInstance().getListCart(idUser);
        String search = request.getParameter("searchAD");
        List<SingleProduct> productList = ProductService.getInstance().getListPrNameSearchADmin(search);
        request.setAttribute("listSearchPRAD", productList);
        request.getRequestDispatcher("searchManagePR.jsp").forward(request,response);
    }
}
