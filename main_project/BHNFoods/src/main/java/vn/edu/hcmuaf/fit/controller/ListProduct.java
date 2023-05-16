package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListProduct", value = "/ListProduct")
public class ListProduct extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int kind = Integer.parseInt(request.getParameter("kind"));
        int page =  Integer.parseInt(request.getParameter("page"));
        int tempSize =  ProductService.getInstance().getSize(kind)/15;
        int count = ProductService.getInstance().getSize(kind)%15 > 0 ? tempSize + 1:tempSize;
        List<Product> list= ProductService.getInstance().getListProdInPage(kind, page);
        List<Product> listDiscount = ProductService.getInstance().getListDiscountProd();
        request.setAttribute("listDiscount", listDiscount);
        request.setAttribute("listRequest", list);
        request.setAttribute("kind", kind);
        request.setAttribute("page", page);
        request.setAttribute("count", count);
        request.getRequestDispatcher("ListProduct.jsp").forward(request,response);
    }
}