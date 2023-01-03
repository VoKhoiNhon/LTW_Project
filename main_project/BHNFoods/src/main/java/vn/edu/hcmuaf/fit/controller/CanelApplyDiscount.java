package vn.edu.hcmuaf.fit.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;

@WebServlet(name = "CanelApplyDiscount", value = "/canelApplyDiscount")
public class CanelApplyDiscount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sum = Integer.parseInt(request.getParameter("sum"));
        int discount = Integer.parseInt(request.getParameter("discount"));
        PrintWriter out = response.getWriter();
        DecimalFormat dec = new DecimalFormat("#,###");
        int newDisCount = 0;
        int newTotal = sum;
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
                "                            <input id=\"maGiamGiaHide\" name=\"maGiamGia\" value=\"\" style=\"display: none\">"+
                "                        </ul>\n" +
                "                        <button type=\"submit\" class=\"primary-btn\">Thanh toán</button>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
