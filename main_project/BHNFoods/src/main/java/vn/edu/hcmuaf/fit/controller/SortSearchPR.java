package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.CartService;
import vn.edu.hcmuaf.fit.service.LoveProdService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import static java.lang.System.out;

@WebServlet(name = "SortSearchPR", value = "/SortSearchPR")
public class SortSearchPR extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("sort");
        String key = request.getParameter("key");
        List<Product> list = ProductService.getListPrNameSearch(key);
        int sortSearch;
        try {
            sortSearch = Integer.parseInt(request.getParameter("sort"));
        } catch (Exception e) {
            sortSearch = 0;
        }
        switch (sortSearch) {
            case 1: {
                list.sort((x1, x2) -> x2.getDiscount() - x1.getDiscount());
                break;
            }

            case 2: {
                list.sort((x1, x2) -> x1.getPrice() - x2.getPrice());
                break;
            }

            case 3: {
                list.sort((x1, x2) -> x2.getPrice() - x1.getPrice());
                break;
            }
        }
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        User user;
        for (Product p : list) {
            String discount = "";
            String heart = "<li><button id=\"heart" + p.getIdPr() + "\" onclick=\"loveInListProd('" + p.getIdPr() + "', this.id)\"><i class=\"fa fa-heart\"></i></button></li>";
            String cart = "<li><button id=\"cart" + p.getIdPr() + "\" onclick=\"addToCartInListProd('" + p.getIdPr() + "', this.id)\"><i class=\"fa fa-shopping-cart\"></i></button></li>";
            if ((user = (User) session.getAttribute("auth")) != null) {
                if (LoveProdService.getInstance().checkLiked(user.getIdUser(), p.getIdPr()))
                    heart = "<li><button id=\"heart" + p.getIdPr() + "\" class=\"background-button\" style=\"color: white\" onclick=\"loveInListProd('" + p.getIdPr() + "', this.id)\"><i class=\"fa fa-heart\"></i></button></li>";
                if (CartService.getInstance().checkExist(user.getIdUser(), p.getIdPr()))
                    cart = "<li><button id=\"cart" + p.getIdPr() + "\" class=\"background-button\" style=\"color: white\" onclick=\"addToCartInListProd('" + p.getIdPr() + "', this.id)\"><i class=\"fa fa-shopping-cart\"></i></button></li>";
            }
            int priceDicount = p.getPrice() - p.getPrice() * (p.getDiscount() / 100);
            if (p.getDiscount() > 0) {
                discount = "<div class=\"discount__percent\" style=\"\">-" + p.getDiscount() + "%</div>";
            }
            String price = (priceDicount / 1000) + ".000";
            String url = p.getUrl();
            out.println("<div class=\"col-lg-4 col-md-6 col-sm-6\">\n" +
                    "                        <div class=\"product__item\">\n" +
                    "                            <div class=\"product__item__pic set-bg\" data-setbg=\"" + url + "\" style=\"background-image: url('" + p.getUrl() + "')\">\n"
                    + discount +
                    "                                <ul class=\"product__item__pic__hover\">\n" +
                    "                                    " + heart + "\n" +
                    "                                    " + cart + "\n" +
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
