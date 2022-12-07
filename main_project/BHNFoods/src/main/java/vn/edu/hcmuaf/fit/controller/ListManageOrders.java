package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.Orders;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ListManageOrders", value = "/manageOrder")
public class ListManageOrders extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idUser= request.getParameter("idUser");
        List<Orders> listManageOrders = ProductService.getInstance().getManageOrders(idUser);
        Map<String, List<Orders>> mapOrder = ProductService.getInstance().getMapOrder(listManageOrders);
        Map<String, Integer> sumOrder = ProductService.getInstance().sumOrder(mapOrder);
        List<Cart> listCart = ProductService.getInstance().getListCart(idUser);

        request.setAttribute("mapOrder", mapOrder);
        request.setAttribute("sumOrder", sumOrder);
        request.setAttribute("listCart",listCart);
        request.setAttribute("listManageOrders", listManageOrders);
        request.getRequestDispatcher("manageOrder.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
