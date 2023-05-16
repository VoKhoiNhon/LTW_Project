package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.Log;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.db.DB;
import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.service.UserService;
import vn.edu.hcmuaf.fit.util.Brower;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Search", value = "/Search")
public class Search extends HttpServlet {
    String src = "Search";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        String idUser = user.getIdUser();
        List<Cart> listCart = ProductService.getInstance().getListCart(idUser);
        request.setAttribute("listCart", listCart);
        String search = request.getParameter("searchPR");
        if (user == null) {
            DB.me().insert(new Log(Log.INFO, null, this.src, "Search that: " + search, 0, Brower.getBrowerName(request.getHeader("User-Agent")),Brower.getLocationIp(request.getRemoteAddr())));
        } else DB.me().insert(new Log(Log.INFO, user.getIdUser(), this.src, "Search that: " + search, 0, Brower.getBrowerName(request.getHeader("User-Agent")),Brower.getLocationIp(request.getRemoteAddr())));
        List<Product> productList = ProductService.getInstance().getListPrNameSearch(search);
        request.setAttribute("listSearchPR", productList);
        request.getRequestDispatcher("searchPR.jsp").forward(request, response);
    }

}
