package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.BoxSizeAndWeight;
import vn.edu.hcmuaf.fit.util.Logistics;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;

@WebServlet(name = "ChangeDistrict", value = "/changeDistrict")
public class ChangeDistrict extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sumCheckout = Integer.parseInt(request.getParameter("sumCheckout"));
        int discountCheckout = Integer.parseInt(request.getParameter("discountCheckout"));

        int idDistrict = Integer.parseInt(request.getParameter("idDistrict"));
        int idWard = Integer.parseInt(request.getParameter("idWard"));
        String[] listId = request.getParameter("listId").trim().replace("box", "").split(" ");

        int fee = 0;
        if(idDistrict != -1 || idWard != -1) { // Nếu tồn tại nơi gửi đến thì tính lại phí
            BoxSizeAndWeight boxSizeAndWeight = new BoxSizeAndWeight(listId);
            fee = Logistics.getCalculateFee(idDistrict,idWard,boxSizeAndWeight.getHeight(),boxSizeAndWeight.getLength(),boxSizeAndWeight.getWidth(),(int) (boxSizeAndWeight.getWeight()*1000));
        }

        int totalCheckout = sumCheckout - discountCheckout + fee;
        DecimalFormat dec = new DecimalFormat("#,###");
        String sumF = dec.format(sumCheckout).replace(',','.');
        String discountF = dec.format(discountCheckout).replace(',','.');
        String shipF = dec.format(fee).replace(',','.');
        String totalF = dec.format(totalCheckout).replace(',','.');

        PrintWriter out = response.getWriter();

        out.println("                            <li id=\"sumCheckout\" value=\""+sumCheckout+"\" style=\"overflow: hidden; margin-bottom: 1rem\" >Tổng tiền hàng<span style=\"float: right\">"+sumF+"đ</span> </li>\n" +
                "                                <li id=\"discountCheckout\" value=\""+discountCheckout+"\" style=\"overflow: hidden; margin-bottom: 1rem\">Giảm<span style=\"float: right\">"+discountF+"đ</span> </li>\n" +
                "                                <li id=\"shipCheckout\" value=\""+fee+"\" style=\"overflow: hidden; margin-bottom: 1rem\">Phí vận chuyển<span style=\"float: right\">"+shipF+"đ</span> </li>\n" +
                "                                <li id=\"totalCheckout\" value=\""+totalCheckout+"\" style=\"overflow: hidden\">Tổng thanh toán<span style=\"float: right\">"+totalF+"đ</span> </li>\n");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}