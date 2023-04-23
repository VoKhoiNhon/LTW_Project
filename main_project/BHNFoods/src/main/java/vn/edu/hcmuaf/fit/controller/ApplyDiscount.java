package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.Discount;
import vn.edu.hcmuaf.fit.service.DiscountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.List;

@WebServlet(name = "ApplyDiscount", value = "/applyDiscount")
public class ApplyDiscount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        int sum = Integer.parseInt(request.getParameter("sum"));
        int discount = Integer.parseInt(request.getParameter("discount"));
        DecimalFormat dec = new DecimalFormat("#,###");
        PrintWriter out = response.getWriter();
        List<Discount> discounts = DiscountService.getInstance().getDiscountByCode(code);
        if(discounts.size() == 0) out.println(3);
        else {
            Discount dis = discounts.get(0);
            if(dis.getSoluong() <= 0) {
                out.println(0);
            }else if(dis.getMinimum() > sum) {
                out.println(1);
            } else if (discount > 0) {
                out.println(2);
            } else {
                int newTotal;
                int newDisCount;
                if(dis.isType()) {
                    newTotal = sum - (sum*dis.getNumber())/100;
                    newDisCount = (sum*dis.getNumber())/100;
                } else {
                    newTotal = sum - dis.getNumber();
                    newDisCount = dis.getNumber();
                }
                String sumF = dec.format(sum).replace(',','.');
                String discountF = dec.format(newDisCount).replace(',','.');
                String totalF = dec.format(newTotal).replace(',','.');
                out.println("<h5>Tổng giỏ hàng</h5>\n" +
                        "                        <ul>\n" +
                        "                            <li id=\"sum\" value=\""+sum+"\">Tổng tiền hàng\n" +
                        "                                <input name=\"sumCheckout\" value=\""+sum+"\" style=\"display: none\">\n" +
                        "                                <span>"+sumF+"đ</span>\n" +
                        "                            </li>\n" +
                        "                            <li id=\"discount\" value=\""+newDisCount+"\">Giảm\n" +
                        "                                <input name=\"discountCheckout\" value=\""+newDisCount+"\" style=\"display: none\">\n" +
                        "                                <span>"+discountF+"đ</span>\n" +
                        "                            </li>\n" +
                        "                            <li id=\"total\" value=\""+newTotal+"\">Tổng thanh toán (chưa gồm phí vận chuyển)\n" +
                        "                                <input name=\"totalCheckout\" value=\""+newTotal+"\" style=\"display: none\">\n" +
                        "                                <span>"+totalF+"đ</span>\n" +
                        "                            </li>\n" +
                        "                            <input id=\"idProdChecked\" type=\"text\" name=\"allIdProdChecked\" value=\"\" style=\"display: none\">\n" +
                        "                            <input id=\"maGiamGiaHide\" name=\"maGiamGia\" value=\"\" style=\"display: none\">" +
                        "                        </ul>\n" +
                        "                        <button type=\"submit\" class=\"primary-btn\">Thanh toán</button>");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
