package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Orders;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListHistory", value = "/History")
public class ListHistory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idUser=request.getParameter("idUser");
        List<Orders> listHistory = ProductService.getInstance().getHistory("idUser");
        request.setAttribute("listHistory", listHistory);
        request.getRequestDispatcher("history.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
