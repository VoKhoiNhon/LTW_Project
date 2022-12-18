package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateProduct", value = "/UpdateProduct")
public class UpdateProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        System.out.println(id);
        String menu= request.getParameter("menu");
        System.out.println(menu);
        int discount= Integer.parseInt(request.getParameter("discount"));
        System.out.println(discount);
        int price= Integer.parseInt(request.getParameter("price"));
        System.out.println(price);
        String name = request.getParameter("name");
        System.out.println(name);
        String nsx= request.getParameter("nsx");
        System.out.println(nsx);
        String hsd= request.getParameter("hsd");
        System.out.println(hsd);
        String brand=request.getParameter("brand");
        System.out.println(brand);
        String mota= request.getParameter("mota");
        System.out.println(mota);
        double weight= Double.parseDouble(request.getParameter("weight"));
        System.out.println(weight);
        String origin=request.getParameter("origin");
        System.out.println(origin);
        int inventory= Integer.parseInt(request.getParameter("inventory"));
        int condition= Integer.parseInt(request.getParameter("condition"));
        ProductService.getInstance().updateProduct( id, menu, discount,  price,  name);
        ProductService.getInstance().updateCt_pr(id, nsx, hsd,  brand,  mota,  weight,  origin,  inventory,  condition);
        response.sendRedirect("http://localhost:8080/BHNFoods/AdminManagePr?kind=0&page=1");
    }
}
