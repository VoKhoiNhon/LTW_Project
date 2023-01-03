package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateConditionOrders", value = "/UpdateConditionOrders")
public class UpdateConditionOrders extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int condition = Integer.parseInt(request.getParameter("condition"));
        String idOrders= request.getParameter("idOrders");
        ProductService.getInstance().UpdateConditionOrders(condition, idOrders);
        response.sendRedirect("http://localhost:8080/BHNFoods/ListOrdersAdmin");
    }
}