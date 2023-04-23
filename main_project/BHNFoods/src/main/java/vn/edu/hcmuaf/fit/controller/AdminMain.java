package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Contact;
import vn.edu.hcmuaf.fit.beans.SingleProduct;
import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@WebServlet(name = "AdminMain", value = "/AdminMain")
public class AdminMain extends HttpServlet {
    int i;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        i = 5;
        List<SingleProduct> list = ProductService.getInstance().getListPrDateImport(i);
        request.setAttribute("listPrDate", list);
        int newbie = UserService.getInstance().getNewbie();
        String data = "" + ProductService.getInstance().getTurnover(1, 2022);
        String data1 = "" + ProductService.getInstance().getTurnover(1, 2021);
        int tur = ProductService.getInstance().getTurnover(1, 2022  );
        int tur1 = ProductService.getInstance().getTurnover(1, 2021);
        int saledPR = ProductService.getInstance().getSalerPR();
        int stopSaledPR = ProductService.getInstance().getStopPr();
        int sumcontact= ProductService.getInstance().sumContact();
        List<SingleProduct> pr = ProductService.getInstance().getListProductHostSale();
        List<Contact> listContact = UserService.getInstance().getListContact();
        Collections.sort(listContact, new Comparator<Contact>() {
            @Override
            public int compare(Contact o1, Contact o2) {
                return o2.getCondition() - o1.getCondition();
            }
        });
        request.setAttribute("listContact", listContact);
        request.setAttribute("sumcontact",sumcontact);

        for (int i = 2; i <= 12; i++) {
            tur += ProductService.getInstance().getTurnover(i, 2022);
            tur1 += ProductService.getInstance().getTurnover(i, 2021);
            data += ("," + ProductService.getInstance().getTurnover(i, 2022));
            data1 += ("," + ProductService.getInstance().getTurnover(i, 2021));
        }
        int nowTur = ProductService.getInstance().getTurnover(ProductService.getInstance().getNowMonth(), ProductService.getInstance().getNowYer());
//        double percentY= ((tur/tur1)-1)*100;
//        request.setAttribute("pec", percentY);
        request.setAttribute("stopSaled", stopSaledPR);
        request.setAttribute("saledPr", saledPR);
        request.setAttribute("newbie", newbie);
        request.setAttribute("nowTur", nowTur);
        request.setAttribute("tur", tur);
        request.setAttribute("data", data);
        request.setAttribute("data1", data1);
        request.setAttribute("hotSale", pr);
        request.getRequestDispatcher("adminMain.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<SingleProduct> list = ProductService.getInstance().getListPrDateImport(i + 5);


    }

    public static void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.sendRedirect("adminMain.jsp");
    }
}