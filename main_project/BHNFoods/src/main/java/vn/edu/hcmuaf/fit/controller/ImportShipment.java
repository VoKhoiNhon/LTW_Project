package vn.edu.hcmuaf.fit.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ImportShipment", value = "/importShipment")
public class ImportShipment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idShipment = request.getParameter("idShipment");
        String idEmployee = request.getParameter("idEmployee");
        String idBrand = request.getParameter("idBrand");
        String idDateImport = request.getParameter("idDateImport"); // vd: 2023-05-05
        String[] dataName = request.getParameter("dataName").trim().split(" "); // [nameA, nameB, nameC]
        String[] dataMenu = request.getParameter("dataMenu").trim().split(" "); // [menuForA, menuForB, menuForC]
        String[] dataInputPrice = request.getParameter("dataInputPrice").trim().split(" "); //[PriceForA, PriceForB, PriceForC]
        String[] dataQuantity = request.getParameter("dataQuantity").trim().split(" "); // ...
        String[] dataWeight = request.getParameter("dataWeight").trim().split(" "); // ...

        // insert value to warehouse. shipment, date, employee
        for(int i = 0; i < dataName.length; i++) {
            // insert value to ct_prod

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
