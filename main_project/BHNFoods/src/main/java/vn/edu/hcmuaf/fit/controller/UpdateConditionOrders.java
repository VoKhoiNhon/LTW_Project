package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.BoxSizeAndWeight;
import vn.edu.hcmuaf.fit.beans.Powers;
import vn.edu.hcmuaf.fit.beans.User;
import vn.edu.hcmuaf.fit.service.OrderService;
import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.util.Logistics;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateConditionOrders", value = "/UpdateConditionOrders")
public class UpdateConditionOrders extends HttpServlet {
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
        if ( user.getDecentralization() != Powers.EMPLOYEE)
            response.sendRedirect("/`");
        else{
        int condition = Integer.parseInt(request.getParameter("condition"));
        String idOrders= request.getParameter("idOrders");
        ProductService.getInstance().UpdateConditionOrders(condition, idOrders);
        String address = request.getParameter("addr");
        String addressCT[] = address.split(",");
        for (int i=0;i<addressCT.length;i++){
            addressCT[i]=addressCT[i].trim();
            System.out.println(addressCT[i]);
        }
        BoxSizeAndWeight boxSizeAndWeight = new BoxSizeAndWeight(OrderService.getInstance().getListIDPrInOrder(idOrders));
        int idProv = 0;
        int idWard = 0;
        int idDistric = 0;
        try {
            idProv = Logistics.getProvince().get(addressCT[3]);
            System.out.println(idProv);
            idDistric = Logistics.getDistrict(idProv).get(addressCT[2]);
            System.out.println(idDistric);
            idWard = Logistics.getWard(idDistric).get(addressCT[1]);
            System.out.println(idWard);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        if (condition == 1) {
            Logistics.registerTransport(idDistric, idWard, boxSizeAndWeight.getHeight(), boxSizeAndWeight.getLength(), boxSizeAndWeight.getWidth(),  (int)(boxSizeAndWeight.getWeight()*1000));
        }
        ProductService.getInstance().UpdateConditionOrders(condition, idOrders);
        response.sendRedirect("/ListOrdersAdmin");
        }
    }
}