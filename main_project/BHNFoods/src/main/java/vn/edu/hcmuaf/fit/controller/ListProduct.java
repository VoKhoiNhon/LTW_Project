package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListProduct", value = "/ListProduct")
public class ListProduct extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int kind = Integer.parseInt(request.getParameter("kind"));
        int page =  Integer.parseInt(request.getParameter("page"));
        int tempSize =  ProductService.getInstance().getSize(kind)/15;
        int count = ProductService.getInstance().getSize(kind)%15 > 0 ? tempSize + 1:tempSize;
        List<Product> list= (List<Product>) ProductService.getInstance().getListProdInPage(kind, page);
        request.setAttribute("listRequest", list);
        request.setAttribute("kind", kind);
        request.setAttribute("page", page);
        request.setAttribute("count", count);
        request.getRequestDispatcher("ListProduct.jsp").forward(request,response);
    }
}