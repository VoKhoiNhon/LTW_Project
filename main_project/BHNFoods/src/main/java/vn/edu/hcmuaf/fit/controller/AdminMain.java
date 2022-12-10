package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.SingleProduct;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminMain", value = "/AdminMain")
public class AdminMain extends HttpServlet {
    static int i=5;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<SingleProduct> list = ProductService.getInstance().getListPrDateImport(i);
        request.setAttribute("listPrDate", list);
        request.getRequestDispatcher("adminMain.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
    public static void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<SingleProduct> list = ProductService.getInstance().getListPrDateImport(i+5);
        request.getRequestDispatcher("adminMain.jsp").forward(request,response);
    }
}
