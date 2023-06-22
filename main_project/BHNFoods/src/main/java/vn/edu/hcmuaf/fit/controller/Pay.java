package vn.edu.hcmuaf.fit.controller;

import com.microsoft.schemas.office.office.STInsetMode;
import vn.edu.hcmuaf.fit.beans.*;
import vn.edu.hcmuaf.fit.db.DB;
import vn.edu.hcmuaf.fit.service.*;
import vn.edu.hcmuaf.fit.util.Brower;
import vn.edu.hcmuaf.fit.util.Logistics;
import vn.edu.hcmuaf.fit.util.MailSender;

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
        String finalAddress = address + " " + ward + " " + district + " " + city;
        String note = request.getParameter("note");
        String payment = request.getParameter("payment");
        String allId = request.getParameter("listId");
        String maGiamGia = request.getParameter("maGiamGia");
        String idOrder = OrderService.getInstance().generateIdOrder();
        String timeNow = OrderService.getInstance().formatDateTimeNow();
        String timePickup = "";
        String[] listId = allId.trim().replace("box", "").split(" ");
        BoxSizeAndWeight boxSizeAndWeight = new BoxSizeAndWeight(listId);
        double totalWeight = 0; // kg

        try {
            String leadTime = Logistics.getLeadTime(idDistrict, idWard, boxSizeAndWeight.getHeight(), boxSizeAndWeight.getLength(), boxSizeAndWeight.getWidth(), (int) (boxSizeAndWeight.getWeight()*1000));
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
        String content = "<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                "    <title>Document</title>\n" +
                "    <style>\n" +
                "        .container {\n" +
                "            border: 1px solid black;\n" +
                "            max-width: 500px;\n" +
                "            background: rgb(224, 221, 221);\n" +
                "        }\n" +
                "        .title {\n" +
                "            color: cadetblue;\n" +
                "        }\n" +
                "        p {\n" +
                "          display: inline-block;  \n" +
                "        }\n" +
                "    </style>\n" +
                "</head>\n" +
                "\n" +
                "<body>\n" +
                "    <h2>Cảm ơn bạn đã tin tưởng và mua hàng ở cửa hàng của chúng tôi, dưới đây là thông tin về đơn hàng của bạn</h2>\n" +
                "    <div class=\"container\">\n" +
                "        <div class=\"item\">\n" +
                "            <p class=\"title\">Tên: </p>\n" +
                "            <p>"+name+"</p>\n" +
                "        </div>\n" +
                "        <div class=\"item\">\n" +
                "            <p class=\"title\">Số điện thoại: </p>\n" +
                "            <p>"+phone+"</p>\n" +
                "        </div>\n" +
                "        <div class=\"item\">\n" +
                "            <p class=\"title\">Địa chỉ: </p>\n" +
                "            <p>"+finalAddress+"</p>\n" +
                "        </div>\n" +
                "        <div class=\"item\">\n" +
                "            <p class=\"title\">Thời gian dự kiến nhận hàng: </p>\n" +
                "            <p>"+timePickup+"</p>\n" +
                "        </div>\n" +
                "    </div>\n" +
                "</body>\n" +
                "</html>";

        DB.me().insert(new Log(Log.INFO, idUser, this.src, "Pay sucsess: "+allId+", total:"+request.getParameter("totalCheckout"), 0, Brower.getBrowerName(request.getHeader("User-Agent")),Brower.getLocationIp(request.getRemoteAddr())));
        MailSender.send("Cảm ơn bạn đã mua hàng", content, email);
        response.sendRedirect("/index");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
