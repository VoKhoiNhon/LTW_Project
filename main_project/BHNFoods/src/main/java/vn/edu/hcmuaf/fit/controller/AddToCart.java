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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AddToCart", value = "/addToCart")
public class AddToCart extends HttpServlet {
    String src ="cart";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        String idProd = request.getParameter("id");
        int amount = Integer.parseInt(request.getParameter("amount"));
        int sumCart = 0;
        int newSumCart = 0;
        if(user == null) { // user chua dang nhap
            Map<String, Integer> listProductFromCartInSession = (Map<String, Integer>) session.getAttribute("listProductFromCartInSession");
            if(listProductFromCartInSession == null) {
                listProductFromCartInSession = new HashMap<>();
            }
            if(listProductFromCartInSession.containsKey(idProd)) {
                listProductFromCartInSession.put(idProd, listProductFromCartInSession.get(idProd) + amount);
            } else {
                listProductFromCartInSession.put(idProd, amount);
            }
            session.setAttribute("listProductFromCartInSession", listProductFromCartInSession);
            for (String idProduct: listProductFromCartInSession.keySet()) {
                newSumCart += listProductFromCartInSession.get(idProduct);
            }
            System.out.println(listProductFromCartInSession.toString());
            DB.me().insert(new Log(Log.INFO, null, this.src, "add product : " +idProd, 0, Brower.getBrowerName(request.getHeader("User-Agent")),Brower.getLocationIp(request.getRemoteAddr())));
        } else { // user da dang nhap
            String idUser = user.getIdUser();
            List<Cart> listCart = ProductService.getInstance().getListCart(idUser);
            sumCart = ProductService.getInstance().sumAmount(listCart);
            newSumCart = sumCart + amount;
            if(!CartService.getInstance().checkExist(idUser, idProd)) {
                CartService.getInstance().insertToCart(idUser,idProd,amount);
            } else {
                CartService.getInstance().updateToCart(idUser,idProd,amount);
            }
            DB.me().insert(new Log(Log.INFO, idUser, this.src,  "add product : "+idProd, 0, Brower.getBrowerName(request.getHeader("User-Agent")),Brower.getLocationIp(request.getRemoteAddr())));
        }
        session.removeAttribute("sumCart");
        session.setAttribute("sumCart",newSumCart);

        PrintWriter out = response.getWriter();
        out.println("<a href=\"/BHNFoods/Cart\" class=\"nav-link\">\n" +
                "<span class=\"fa-solid fa-cart-shopping\"></span>["+newSumCart+"]</a>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
