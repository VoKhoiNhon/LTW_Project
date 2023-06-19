package vn.edu.hcmuaf.fit.controller;

import com.microsoft.schemas.office.office.STInsetMode;
import vn.edu.hcmuaf.fit.beans.*;
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
import java.util.Map;

@WebServlet(name = "Pay", value = "/pay")
public class Pay extends HttpServlet {
    String src = "Pay";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("auth");
        String idUser;
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
        String finalAddress = address + ", " + ward + ", " + district + ", " + city;
        int day = Integer.parseInt(request.getParameter("day"));
        String time = request.getParameter("time");
        String note = request.getParameter("note");
        String payment = request.getParameter("payment");
        String allId = request.getParameter("listId");
        String maGiamGia = request.getParameter("maGiamGia");
        String idOrder = OrderService.getInstance().generateIdOrder();
        String timeNow = OrderService.getInstance().formatDateTimeNow();
        String timePickup = "";
        String[] listId = allId.trim().replace("box", "").split(" ");
        BoxSizeAndWeight boxSizeAndWeight = new BoxSizeAndWeight(listId);
        System.out.println(boxSizeAndWeight);
        System.out.println(boxSizeAndWeight.getWeight()*100);
        double totalWeight = 0; // kg

        try {
            String leadTime = Logistics.getLeadTime(idDistrict, idWard, boxSizeAndWeight.getHeight(), boxSizeAndWeight.getLength(), boxSizeAndWeight.getWidth(), (int) (boxSizeAndWeight.getWeight()*1000));
            System.out.println(leadTime);
            timePickup = leadTime.substring(0, leadTime.indexOf("T"));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        List<Cart> listCart = new ArrayList<>();

        OrderService.getInstance().addToOrder(idOrder, name, phone, finalAddress, timeNow, timePickup, note, 0);
        if (!maGiamGia.equals("")) DiscountService.getInstance().changeAmountDiscount(maGiamGia, -1);

        if(user == null) {
            idUser = null;
            Map<String, Integer> listProductFromCartInSession = (Map<String, Integer>) session.getAttribute("listProductFromCartInSession");
            Product product;
            for (String idProduct: listId) {
                product = ProductService.getInstance().getProductById(idProduct);
                SoldProdService.getInstance().addToSoldProd(idProduct, "unKnow", timeNow, listProductFromCartInSession.get(idProduct), idOrder, product.getPrice());
                ProductService.getInstance().updateInventoryCT_PR(idProduct, -listProductFromCartInSession.get(idProduct));
                if(listProductFromCartInSession.containsKey(idProduct)) listProductFromCartInSession.remove(idProduct);
            }
            session.setAttribute("listProductFromCartInSession", listProductFromCartInSession);
        } else {
            idUser = user.getIdUser();
            for (String id : listId) {
                List<Cart> temp = CartService.getInstance().getProdFormCart(idUser, id);
                listCart.addAll(temp);
            }
            for (String id : listId) {
                CartService.getInstance().deleteFromCart(id, idUser);
            }
            for (Cart c : listCart) {
                SoldProdService.getInstance().addToSoldProd(c.getIdPr(), idUser, timeNow, c.getAmount(), idOrder, c.getPrice());
                ProductService.getInstance().updateInventoryCT_PR(c.getIdPr(), -c.getAmount());
            }
        }

        DB.me().insert(new Log(Log.INFO, idUser, this.src, "Pay sucsess: "+allId+", total:"+request.getParameter("totalCheckout"), 0, Brower.getBrowerName(request.getHeader("User-Agent")),Brower.getLocationIp(request.getRemoteAddr())));
        response.sendRedirect("/index");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}