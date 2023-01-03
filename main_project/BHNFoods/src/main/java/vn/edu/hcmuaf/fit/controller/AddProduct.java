package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AddProduct", value = "/AddProduct")
public class AddProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("sdfnjsdk");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("sdfnjsdk");
        String menu = request.getParameter("menu");
        int discount = Integer.parseInt(request.getParameter("discount"));
        int price = Integer.parseInt(request.getParameter("price"));
        String name = request.getParameter("name");
        String nsx = request.getParameter("nsx");
        System.out.println(nsx);
        String hsd = request.getParameter("hsd");
        System.out.println(hsd);
        String brand = request.getParameter("brand");
        String mota = request.getParameter("mota");
        double weight = Double.parseDouble(request.getParameter("weight"));
        String origin = request.getParameter("origin");
        int inventory = Integer.parseInt(request.getParameter("inventory"));
        int index= ProductService.getInstance().getListProduct().size();
        ProductService.getInstance().addProd(index+1, menu, discount,price, name);
        ProductService.getInstance().addCT_Prod(index+1, nsx,hsd, brand, mota, weight,origin, inventory);
        response.sendRedirect("http://localhost:8080/BHNFoods/AdminManagePr?kind=0&page=1");

    }

    public static void main(String[] args) {

    }
}
