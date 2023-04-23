package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.Log;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.db.DB;
import vn.edu.hcmuaf.fit.service.*;
import vn.edu.hcmuaf.fit.util.Brower;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Pay", value = "/pay")
public class Pay extends HttpServlet {
    String src = "Pay";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("auth");
            String idUser = user.getIdUser();
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
        String timeNow = OrderService.getInstance().formatDateTimeNow();
        String timePickup = OrderService.getInstance().formatDateTime(day) + " " + time;
        String  [] listId = allId.trim().replace("box", "").split(" ");
        List<Cart> listCart = new ArrayList<>();
        for (String id : listId) {
            List<Cart> temp = CartService.getInstance().getProdFormCart(idUser, id);
            listCart.addAll(temp);
        }
        OrderService.getInstance().addToOrder(idOrder, name, phone, address, timeNow, timePickup, note, 0);
        if (!maGiamGia.equals("")) DiscountService.getInstance().changeAmountDiscount(maGiamGia, -1);
        for (Cart c : listCart) {
            SoldProdService.getInstance().addToSoldProd(c.getIdPr(), idUser, timeNow, c.getAmount(), idOrder, c.getPrice());
            ProductService.getInstance().updateInventoryCT_PR(c.getIdPr(), -c.getAmount());
        }
        for (String id : listId) {
            CartService.getInstance().deleteFromCart(id, idUser);
        }

        if (idUser == null) {
            DB.me().insert(new Log(Log.INFO, null, this.src, "Pay sucsess: " +allId+", total: "+request.getParameter("totalCheckout"), 0, Brower.getBrowerName(request.getHeader("User-Agent")),Brower.getLocationIp(request.getRemoteAddr())));
        } else DB.me().insert(new Log(Log.INFO, idUser, this.src, "Pay sucsess: "+allId+", total:"+request.getParameter("totalCheckout"), 0, Brower.getBrowerName(request.getHeader("User-Agent")),Brower.getLocationIp(request.getRemoteAddr())));


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
