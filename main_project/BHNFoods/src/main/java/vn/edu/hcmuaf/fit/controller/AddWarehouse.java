package vn.edu.hcmuaf.fit.controller;

import com.google.gson.Gson;
import vn.edu.hcmuaf.fit.beans.DetailsWH;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.service.WarehouseService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(name = "AddWarehouse", value = "/AddWarehouse")
public class AddWarehouse extends HttpServlet {
    int index = WarehouseService.getInstance().getListWH().size();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String codewh = request.getParameter("codewh");
        String date = request.getParameter("date");
        System.out.println(codewh);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        String jsonItem = request.getParameter("jsonItem");
        System.out.println(jsonItem);
        WarehouseService.getInstance().addWarehouse(index + 1, codewh, date, user.getNameUser());
        Gson gson = new Gson();
        DetailsWH[] detailsWHS = gson.fromJson(jsonItem, DetailsWH[].class);
        for (DetailsWH d : detailsWHS) {
            WarehouseService.getInstance().addDetailWh(index + 1, d.getID_PR(), d.getPRICE_IMPORT(), d.getAMOUNT_PR(), d.getWEIGHT_PR());
            ProductService.getInstance().updateInventoryCT_PR(d.getID_PR(), d.getAMOUNT_PR());
        }
        // for detailsWHS {
        //  WarehouseService.getInstance().addDetailWh(index+1, idpr, price, amount, weight);
//        ProductService.getInstance().updateInventoryCT_PR(idpr,amount);
        //}
        response.sendRedirect("/BHNFoods/Warehouse");

    }
}
