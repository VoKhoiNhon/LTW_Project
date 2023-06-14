package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.*;
import vn.edu.hcmuaf.fit.db.DB;
import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.util.Brower;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "SingleProduct", value = "/oneProduct")
public class OneProduct extends HttpServlet {
    String src= "Single Product";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProd = request.getParameter("id");
        request.setAttribute("id", idProd);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        List<SingleProduct> singleProd = ProductService.getInstance().getSingleProduct(idProd);
        List<ImgForSingleProd> listURL = ProductService.getInstance().getListImgForSingleProduct(idProd);
        List<Feedback> listFeedBack = ProductService.getInstance().getFeedBack(idProd);
        int count = listFeedBack.size()%3 == 0 ? listFeedBack.size()/3 : listFeedBack.size()/3 + 1;
        List<Product> listRelatedProduct = ProductService.getInstance().getRelatedProducts(singleProd.get(0).getIdMenu());
        Collections.shuffle(listRelatedProduct);
        request.setAttribute("count", count);
        request.setAttribute("listFeedBack", listFeedBack);
        request.setAttribute("listURL", listURL);
        request.setAttribute("singleProduct", singleProd);
        request.setAttribute("relatedProducts", listRelatedProduct);
        if (user == null) {
            DB.me().insert(new Log(Log.INFO, null, this.src, "View : " +idProd, 0, Brower.getBrowerName(request.getHeader("User-Agent")),Brower.getLocationIp(request.getRemoteAddr())));
        } else DB.me().insert(new Log(Log.INFO, user.getIdUser(), this.src,  "View: "+idProd, 0, Brower.getBrowerName(request.getHeader("User-Agent")),Brower.getLocationIp(request.getRemoteAddr())));
        request.getRequestDispatcher("singleProduct.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
