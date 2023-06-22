package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.*;
import vn.edu.hcmuaf.fit.db.DB;
import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.util.Brower;

import javax.mail.Session;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchAdmin", value = "/SearchAdmin")
public class SearchAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        if (user == null) {
            response.sendRedirect("/`");
        }
        if (user.getDecentralization() != Powers.ADMIN && user.getDecentralization() != Powers.EMPLOYEE)
            response.sendRedirect("/`");
        else {
            String idUser = user.getIdUser();
            List<Cart> listCart = ProductService.getInstance().getListCart(idUser);
            String search = request.getParameter("searchAD");
            List<SingleProduct> productList = ProductService.getInstance().getListPrNameSearchADmin(search);

            DB.me().insert(new Log(Log.INFO, user.getIdUser(), "Admin search", "Search that : " + search, 0, Brower.getBrowerName(request.getHeader("User-Agent")), Brower.getLocationIp(request.getRemoteAddr())));
            request.setAttribute("listSearchPRAD", productList);
            request.getRequestDispatcher("searchManagePR.jsp").forward(request, response);
        }
    }
}
