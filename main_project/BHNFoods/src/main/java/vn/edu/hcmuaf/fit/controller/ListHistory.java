package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.SoldProduct;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ListHistory", value = "/history")
public class ListHistory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idUser = request.getParameter("idUser");
        List<SoldProduct> listHistory = ProductService.getInstance().getHistory(idUser);
        Map<String, List<SoldProduct>> mapOrders = ProductService.getInstance().getMapHistoryOrders(listHistory);
        List<Cart> listCart = ProductService.getInstance().getListCart(idUser);
        Map<String, Integer> sumOrders = ProductService.getInstance().sumHistoryOrder(mapOrders);
        request.setAttribute("sumOrders", sumOrders);
        request.setAttribute("mapOrders", mapOrders);
        request.setAttribute("listCart", listCart);
        request.setAttribute("listHistory", listHistory);
        request.getRequestDispatcher("history.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
