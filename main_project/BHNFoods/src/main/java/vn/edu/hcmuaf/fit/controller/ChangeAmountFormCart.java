package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.CartService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;

@WebServlet(name = "ChangeAmountFormCart", value = "/changeAmountFormCart")
public class ChangeAmountFormCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        DecimalFormat dec = new DecimalFormat("#,###");
        int sum = Integer.parseInt(request.getParameter("sum"));
        int discount = Integer.parseInt(request.getParameter("discount"));
        int total = Integer.parseInt(request.getParameter("total"));
        String listId  = request.getParameter("listId");
        String sumF = dec.format(sum).replace(',','.');
        String discountF  = dec.format(discount).replace(',','.');
        String totalF = dec.format(total).replace(',','.');
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        int amount = Integer.parseInt(request.getParameter("amount"));
        String idUser = "";

        if(user != null) {
            idUser = user.getIdUser();
        }
        PrintWriter out = response.getWriter();

        out.println("<h5>Tổng giỏ hàng</h5>\n" +
                "\t\t\t\t\t<ul>\n" +
                "\t\t\t\t\t\t<li id=\"sum\" value=\""+sum+"\">Tổng tiền hàng\n" +
                "<input name=\"sumCheckout\" value=\""+sum+"\" style=\"display: none\">" +
                "\t\t\t\t\t\t\t<span>"+sumF+"đ</span>\n" +
                "\t\t\t\t\t\t</li>\n" +
                "\t\t\t\t\t\t<li id=\"discount\" value=\""+discount+"\">Giảm " +
                "<input name=\"discountCheckout\" value=\""+discount+"\" style=\"display: none\" >"+
                "<span >"+discountF+"đ</span></li>\n" +
                "\t\t\t\t\t\t<li id=\"total\" value=\""+(sum-discount)+"\">Tổng thanh toán (chưa gồm phí vận chuyển)" +
                "<input name=\"totalCheckout\" value=\""+(sum-discount)+"\" style=\"display: none\" >" +
                " <span>"+dec.format(sum-discount).replace(',','.')+"đ</span></li>\n" +
                "\t\t\t\t\t</ul>\n" +
                "<input id=\"idProdChecked\" type=\"text\" name=\"allIdProdChecked\" value=\""+listId+"\" style=\"display: none\">" +
                "\t\t\t\t\t<button type=\"submit\" class=\"primary-btn\">Thanh toán</button>");
        CartService.getInstance().updateAmountToCart(id, idUser, amount);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
