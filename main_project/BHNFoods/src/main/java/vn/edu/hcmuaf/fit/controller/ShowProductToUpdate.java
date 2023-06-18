package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.beans.SingleProduct;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShowProductToUpdate", value = "/ShowProductToUpdate")
public class ShowProductToUpdate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProd = request.getParameter("id");
        request.setAttribute("id", idProd);
//        if(user.getDecentralization() != Powers.ADMIN || user.getDecentralization() != Powers.EMPLOYEE) response.sendRedirect("index.jsp");
//        else {

        request.getRequestDispatcher("showProduct.jsp").forward(request, response);
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
