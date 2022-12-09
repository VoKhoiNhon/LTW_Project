package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.Orders;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListManagerOrders", value = "/managerOrder")
public class ListManagerOrders extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idUser= request.getParameter("idUser");
        List<Orders> listManagerOrders= ProductService.getInstance().getManagerOrders(idUser);
        List<Cart> listCart = ProductService.getInstance().getListCart(idUser);
        request.setAttribute("listCart",listCart);
        request.setAttribute("listManagerOrders", listManagerOrders);
        request.getRequestDispatcher("managerOrder.jsp").forward(request,response);
        Orders o =new Orders();
        if(o.getCondition()==0) {
            System.out.println("Đang chuẩn bị");
        }
        if(o.getCondition()==1) {
            System.out.println("Đang giao");
        }
        if(o.getCondition()==3) {
            System.out.println("Giao hàng không thành công");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
