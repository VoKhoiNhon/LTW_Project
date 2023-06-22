package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.Log;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.db.DB;
import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.util.Brower;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@WebServlet(name = "Index", value = "/index")
public class Index extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Map<String, Integer> listProductFromCartInSession = (Map<String, Integer>) session.getAttribute("listProductFromCartInSession");
        List<String> loveProductInSession = (List<String>) session.getAttribute("loveProductInSession");
        boolean hasACart = (listProductFromCartInSession != null && listProductFromCartInSession.size() > 0);
        boolean hasAListLove = (loveProductInSession != null && loveProductInSession.size() > 0);
        User user = (User) session.getAttribute("auth");
        if (user == null) {
            DB.me().insert(new Log(Log.INFO,null, "/index",  "vao trang chu ", 0, Brower.getBrowerName(request.getHeader("User-Agent")),Brower.getLocationIp(request.getRemoteAddr())));
        }else{
            DB.me().insert(new Log(Log.INFO,user.getIdUser(), "/index",  "vao trang chu ", 0, Brower.getBrowerName(request.getHeader("User-Agent")),Brower.getLocationIp(request.getRemoteAddr())));
        }
        request.setAttribute("hasACart", hasACart);
        request.setAttribute("hasAListLove", hasAListLove);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
