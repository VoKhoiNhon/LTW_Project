package vn.edu.hcmuaf.fit.controller;

import com.microsoft.schemas.office.office.STInsetMode;
import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.Log;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.db.DB;
import vn.edu.hcmuaf.fit.service.*;
import vn.edu.hcmuaf.fit.util.Brower;
import vn.edu.hcmuaf.fit.util.Logistics;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
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
        int idCity = Integer.parseInt(request.getParameter("idCity"));
        int idDistrict = Integer.parseInt(request.getParameter("idDistrict"));
        int idWard = Integer.parseInt(request.getParameter("idWard"));
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String finalAddress = address + " " + ward + " " + district + " " + city;
        int day = Integer.parseInt(request.getParameter("day"));
        String time = request.getParameter("time");
        String note = request.getParameter("note");
        String payment = request.getParameter("payment");
        String allId = request.getParameter("listId");
        String maGiamGia = request.getParameter("maGiamGia");
        String idOrder = OrderService.getInstance().generateIdOrder();
        String timeNow = OrderService.getInstance().formatDateTimeNow();
        String timePickup = "";
        String  [] listId = allId.trim().replace("box", "").split(" ");
        List<Cart> listCart = new ArrayList<>();
        double totalWeight = 0; // kg
        for (String id : listId) {
            totalWeight =  ProductService.getInstance().getSingleProduct(id).get(0).getWeight();
            List<Cart> temp = CartService.getInstance().getProdFormCart(idUser, id);
            listCart.addAll(temp);
        }

        int width = 10;
        int height = 10;
        int length = 20;
        if(totalWeight > 10) {
            width = 40;
            height = 40;
            length= 40;
        } else if(totalWeight > 5) {
            width = 30;
            height = 30;
            length= 30;
        } else if(totalWeight > 2) {
            width = 20;
            height = 20;
            length= 20;
        }
        try {
            String leadTime = Logistics.getLeadTime(idDistrict, idWard, height, length, width, (int) (totalWeight*1000));
            timePickup = leadTime.substring(0, leadTime.indexOf("T"));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        OrderService.getInstance().addToOrder(idOrder, name, phone, finalAddress, timeNow, timePickup, note, 0);
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
