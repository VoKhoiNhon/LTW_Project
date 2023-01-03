package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.CartService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.List;

@WebServlet(name = "RemoveFromCart", value = "/removeFromCart")
public class RemoveFromCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        DecimalFormat dec = new DecimalFormat("#,###");
        int sum = Integer.parseInt(request.getParameter("sum"));
        int discount = Integer.parseInt(request.getParameter("discount"));
        int total = Integer.parseInt(request.getParameter("total"));
        String sumF = dec.format(sum).replace(',','.');
        String discountF  = dec.format(discount).replace(',','.');
        String totalF = dec.format(total).replace(',','.');
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        String idUser = "";

        if(user != null) {
            idUser = user.getIdUser();
        }
        PrintWriter out = response.getWriter();

        out.println("<h5>Tổng giỏ hàng</h5>\n" +
                "\t\t\t\t\t<ul>\n" +
                "\t\t\t\t\t\t<li id=\"sum\" value=\""+sum+"\">Tổng tiền hàng\n" +
                "\t\t\t\t\t\t\t<span>"+sumF+"đ</span>\n" +
                "\t\t\t\t\t\t</li>\n" +
                "\t\t\t\t\t\t<li id=\"discount\" value=\""+discount+"\">Giảm <span >"+discountF+"đ</span></li>\n" +
                "\t\t\t\t\t\t<li id=\"total\" value=\""+(sum-discount)+"\">Tổng thanh toán (chưa gồm phí vận chuyển) <span>"+dec.format(sum-discount).replace(',','.')+"đ</span></li>\n" +
                "\t\t\t\t\t</ul>\n" +
                "\t\t\t\t\t<a href=\"checkout.jsp\" class=\"primary-btn\">Thanh toán</a>");

        CartService.getInstance().deleteFromCart(id, idUser);
        session.removeAttribute("sumCart");
        List<Cart> listCart = ProductService.getInstance().getListCart(idUser);
        int sumCart = ProductService.getInstance().sumAmount(listCart);
        session.setAttribute("sumCart",sumCart);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
