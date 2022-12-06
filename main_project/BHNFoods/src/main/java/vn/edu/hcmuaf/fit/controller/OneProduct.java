package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Feedback;
import vn.edu.hcmuaf.fit.beans.ImgForSingleProd;
import vn.edu.hcmuaf.fit.beans.SingleProduct;
import vn.edu.hcmuaf.fit.service.ProductService;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SingleProduct", value = "/oneProduct")
public class OneProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProd = request.getParameter("id");
        request.setAttribute("id", idProd);
        List<SingleProduct> singleProd = ProductService.getInstance().getSingleProduct(idProd);
        List<ImgForSingleProd> listURL = ProductService.getInstance().getListImgForSingleProduct(idProd);
        List<Feedback> listFeedBack = ProductService.getInstance().getFeedBack(idProd);
        request.setAttribute("listFeedBack", listFeedBack);
        request.setAttribute("listURL", listURL);
        request.setAttribute("singleProduct", singleProd);
        request.getRequestDispatcher("singleProduct.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
