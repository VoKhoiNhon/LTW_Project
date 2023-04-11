package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.DiscountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Discount", value = "/discount")
public class Discount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List listDiscount = DiscountService.getInstance().getAllDiscount();
        request.setAttribute("listDiscount", listDiscount);
        request.getRequestDispatcher("discount.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
