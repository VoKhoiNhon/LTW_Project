package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Pay", value = "/pay")
public class Pay extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String idUser = (String) session.getAttribute("idUser");
        String name = request.getParameter("fullName");
        String phone = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        int day = Integer.parseInt(request.getParameter("day"));
        String time = request.getParameter("time");
        String note = request.getParameter("note");
        String payment = request.getParameter("payment");
        String allId = request.getParameter("listId");
        String maGiamGia = request.getParameter("maGiamGia");
        String idOrder = OrderService.getInstance().generateIdOrder();
        System.out.println(idOrder);
        String timeNow = OrderService.getInstance().formatDateTimeNow();
        System.out.println(timeNow);
        String timePickup = OrderService.getInstance().formatDateTime(day) + " " + time;
        System.out.println(timePickup);
        String[] listId = allId.trim().replace("box","").split(" ");
        List<Cart> listCart = new ArrayList<>();
        for (String id: listId) {
            List<Cart> temp = CartService.getInstance().getProdFormCart(idUser,id);
            listCart.addAll(temp);
            System.out.println(id);
        }
        OrderService.getInstance().addToOrder(idOrder,name, phone, address, timeNow, timePickup, note,0);
        if(!maGiamGia.equals("")) DiscountService.getInstance().changeAmountDiscount(maGiamGia, -1);
        for (Cart c: listCart) {
            SoldProdService.getInstance().addToSoldProd(c.getIdPr(),idUser,timeNow,c.getAmount(),idOrder,c.getPrice());
            ProductService.getInstance().updateInventoryCT_PR(c.getIdPr(),-c.getAmount());
        }
        for (String id: listId) {
            CartService.getInstance().deleteFromCart(id, idUser);
        }




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
