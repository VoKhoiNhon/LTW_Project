package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.beans.SingleProduct;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminManagePr", value = "/AdminManagePr")
public class AdminManagePr extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int kind = Integer.parseInt(request.getParameter("kind"));
        int page =  Integer.parseInt(request.getParameter("page"));
        int tempSize =  ProductService.getInstance().getSize(kind)/15;
        int count = ProductService.getInstance().getSize(kind)%15 > 0 ? tempSize + 1:tempSize;
        List<SingleProduct> list= (List<SingleProduct>) ProductService.getInstance().getListSingleProdInPage(kind, page);
        request.setAttribute("manageList", list);
        request.setAttribute("kind", kind);
        request.setAttribute("page", page);
        request.setAttribute("count", count);
        request.getRequestDispatcher("manage_product.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
