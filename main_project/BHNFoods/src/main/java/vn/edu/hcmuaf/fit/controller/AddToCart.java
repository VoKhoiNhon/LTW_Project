package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.Log;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.db.DB;
import vn.edu.hcmuaf.fit.service.CartService;
import vn.edu.hcmuaf.fit.service.CommentService;
import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.util.Brower;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "AddToCart", value = "/addToCart")
public class AddToCart extends HttpServlet {
    String src ="cart";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        String idUser = user.getIdUser();
        int amount = Integer.parseInt(request.getParameter("amount"));
        String idProd = request.getParameter("id");
        PrintWriter out = response.getWriter();
        List<Cart> listCart = ProductService.getInstance().getListCart(idUser);
        int sumCart = ProductService.getInstance().sumAmount(listCart);
        int newSumCart = sumCart + amount;
        out.println("<a href=\"http://localhost:8080/BHNFoods/Cart?idUser="+idUser+"\" class=\"nav-link\">\n" +
                "<span class=\"fa-solid fa-cart-shopping\"></span>["+newSumCart+"]</a>");
        session.removeAttribute("sumCart");
        session.setAttribute("sumCart",newSumCart);
        if(!CartService.getInstance().checkExist(idUser, idProd)) {
            CartService.getInstance().insertToCart(idUser,idProd,amount);
        } else {
            CartService.getInstance().updateToCart(idUser,idProd,amount);
        }
        if (idUser == null) {
            DB.me().insert(new Log(Log.INFO, null, this.src, "add product : " +idProd, 0, Brower.getBrowerName(request.getHeader("User-Agent")),Brower.getLocationIp(request.getRemoteAddr())));
        } else DB.me().insert(new Log(Log.INFO, idUser, this.src,  "add product : "+idProd, 0, Brower.getBrowerName(request.getHeader("User-Agent")),Brower.getLocationIp(request.getRemoteAddr())));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
