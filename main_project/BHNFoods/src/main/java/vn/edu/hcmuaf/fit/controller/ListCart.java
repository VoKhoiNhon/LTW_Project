package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.CartService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "Cart", value = "/Cart")
public class ListCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        List<Cart> listCart;
        Map<String, Integer> listProductFromCartInSession = (Map<String, Integer>) session.getAttribute("listProductFromCartInSession");
        if(user == null) { // user chua dang nhap
            List<Product> listProduct = new ArrayList<>();
            listCart = new ArrayList<>();
            if(listProductFromCartInSession != null) {
                for (String idProduct: listProductFromCartInSession.keySet()) {
                    listProduct.add(ProductService.getInstance().getProductById(idProduct));
                }
                for (Product p: listProduct) {
                    listCart.add(new Cart(p.getIdPr(),p.getDiscount(),p.getPrice(),p.getNamePr(),p.getUrl(), listProductFromCartInSession.get(p.getIdPr())));
                }
            }
        } else {
            listCart = ProductService.getInstance().getListCart(user.getIdUser());
        }
        request.setAttribute("listCart",listCart);
        int sum= ProductService.getInstance().sumCart(listCart);
        request.setAttribute("sum",sum);
        request.getRequestDispatcher("cart.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}