package vn.edu.hcmuaf.fit.controller;

import com.google.gson.Gson;
import com.restfb.json.Json;
import vn.edu.hcmuaf.fit.beans.DetailsWH;
import vn.edu.hcmuaf.fit.beans.SingleProduct;
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
        String menu= request.getParameter("menu");
        int discount= Integer.parseInt(request.getParameter("discount"));
        int price= Integer.parseInt(request.getParameter("price"));
        String name = request.getParameter("name");
        String nsx= request.getParameter("nsx");
        String hsd= request.getParameter("hsd");
        String brand=request.getParameter("brand");
        String mota= request.getParameter("mota");
        double weight= Double.parseDouble(request.getParameter("weight"));
        String origin=request.getParameter("origin");
        int inventory= Integer.parseInt(request.getParameter("inventory"));
        int condition= Integer.parseInt(request.getParameter("condition"));
        ProductService.getInstance().updateProduct( id, menu, discount,  price,  name);
        ProductService.getInstance().updateCt_pr(id, nsx, hsd,  brand,  mota,  weight,  origin,  inventory,  condition);
        System.out.println(name+id);
        response.sendRedirect("/AdminManagePr?kind=0&page=1");
//        response.sendRedirect("/ShowProductToUpdate");
    }
}
