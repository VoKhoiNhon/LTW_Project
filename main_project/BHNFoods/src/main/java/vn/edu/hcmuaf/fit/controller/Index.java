package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Index", value = "/index")
public class Index extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idUser = request.getParameter("idUser");
        User user = (User) request.getAttribute("user");
        HttpSession session = request.getSession();
        if(idUser == null) {
            user = null;
        }
        List<Cart> listCart = ProductService.getInstance().getListCart(idUser);
        int sum = ProductService.getInstance().sumAmount(listCart);
        session.setAttribute("sumCart",sum);
        request.setAttribute("listCart", listCart);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
