package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "LoadMoreProduct", value = "/loadMoreProduct")
public class LoadMoreProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int kind = Integer.parseInt(request.getParameter("kind"));
        int page = Integer.parseInt(request.getParameter("page"));
        int step = Integer.parseInt(request.getParameter("step"));
        int tempSize = ProductService.getInstance().getSize(kind) / 15;
        int count = ProductService.getInstance().getSize(kind) % 15 > 0 ? tempSize + 1 : tempSize;
        List<Product> list = (List<Product>) ProductService.getInstance().getListProdInPage(kind, step);
        PrintWriter out = response.getWriter();

            for (Product p : list) {
                String discount = "";
                int priceDicount = p.getPrice() - p.getPrice()*(p.getDiscount()/100);
                if(p.getDiscount() > 0) {
                    discount = "<div class=\"discount__percent\" style=\"\">-"+p.getDiscount()+"%</div>";
                }
                String price  = (priceDicount/1000) + ".000";
                String url = p.getUrl();
                out.println("<div class=\"col-lg-4 col-md-6 col-sm-6\">\n" +
                        "                        <div class=\"product__item\">\n" +
                        "                            <div class=\"product__item__pic set-bg\" data-setbg=\"" + url + "\" style=\"background-image: url('" + p.getUrl() + "')\">\n"
                                                        + discount +
                        "                                <ul class=\"product__item__pic__hover\">\n" +
                        "                                    <li><a href=\"#\"><i class=\"fa fa-heart\"></i></a></li>\n" +
                        "                                    <li><a href=\"#\"><i class=\"fa fa-retweet\"></i></a></li>\n" +
                        "                                    <li><a href=\"#\"><i class=\"fa fa-shopping-cart\"></i></a></li>\n" +
                        "                                </ul>\n" +
                        "                            </div>\n" +
                        "                            <div class=\"product__item__text\">\n" +
                        "                                <a href=\"http://localhost:8080/BHNFoods/oneProduct?id=" + p.getIdPr() + "&idUser=user1\">" + p.getNamePr() + "<br> <span>" + price + "đ</span></a>\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +
                        "                    </div>");
            }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
