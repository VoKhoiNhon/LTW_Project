package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.util.Logistics;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "CheckingOut", value = "/checkingOut")
public class CheckingOut extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sum = Integer.parseInt(request.getParameter("sumCheckout"));
        int discount = Integer.parseInt(request.getParameter("discountCheckout"));
        int total = Integer.parseInt(request.getParameter("totalCheckout"));
        Map<String, Integer> map;
        try {
            map = Logistics.getProvince();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        String allIdProdChecked = request.getParameter("allIdProdChecked");
        String maGiamGia = request.getParameter("maGiamGia");
        request.setAttribute("maGiamGia", maGiamGia);
        request.setAttribute("sumCheckout", sum);
        request.setAttribute("discountCheckout", discount);
        request.setAttribute("totalCheckout", total);
        request.setAttribute("allIdProdChecked", allIdProdChecked);
        request.setAttribute("mapProvince", map);
        request.getRequestDispatcher("checkout.jsp").forward(request,response);
    }
}
