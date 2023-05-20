package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ListLoveProd", value = "/loveProduct")
public class ListLoveProd extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        if(user == null) { // user chua dang nhap
            List<Product> listLoveProd = new ArrayList<>();
            List<String> loveProductInSession = (List<String>) session.getAttribute("loveProductInSession");
            if(loveProductInSession != null) {
                for (String idProduct: loveProductInSession) {
                    listLoveProd.add(ProductService.getInstance().getProductById(idProduct));
                }
            }
            request.setAttribute("listLoveProd", listLoveProd);
            request.getRequestDispatcher("loveProduct.jsp").forward(request,response);
        } else {
            List<Product> listLoveProd = ProductService.getInstance().getListLoveProd(user.getIdUser());
            request.setAttribute("listLoveProd", listLoveProd);
            request.getRequestDispatcher("loveProduct.jsp").forward(request,response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
