package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.beans.Warehouse;
import vn.edu.hcmuaf.fit.service.WarehouseService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "AddMenu", value = "/AddMenu")
public class AddMenu extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idMenu = request.getParameter("idMenu");
        List<Product> listProduct = WarehouseService.getInstance().getProductByIdMenu(idMenu);
        String listOption ="";
        for(Product l: listProduct){
            listOption += "<option value=\""+l.getIdPr()+"\">"+l.getNamePr()+"</option>";
        }
        System.out.println(listOption);
        PrintWriter out = response.getWriter();
        out.println(listOption);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
