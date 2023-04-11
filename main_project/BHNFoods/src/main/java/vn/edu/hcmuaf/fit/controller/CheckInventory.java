package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CheckInventory", value = "/checkInventory")
public class CheckInventory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProd = request.getParameter("id");
        int inventory = ProductService.getInstance().getInventoryCT_PR(idProd);
        PrintWriter out = response.getWriter();
        out.println(inventory);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public static void main(String[] args) {
        int inventory = ProductService.getInstance().getInventoryCT_PR("prod5");
        System.out.println(inventory);
    }
}
