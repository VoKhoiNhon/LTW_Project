package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.util.Logistics;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

@WebServlet(name = "AddDistrict", value = "/addDistrict")
public class AddDistrict extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idProvince = Integer.parseInt(request.getParameter("idProvince"));
        Map<String, Integer> mapDistrict;
        try {
            mapDistrict = Logistics.getDistrict(idProvince);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        String listOption = "";
        for (String key: mapDistrict.keySet() ) {
            listOption += "<option value=\""+mapDistrict.get(key)+"\">"+key+"</option>";
        }
        PrintWriter out = response.getWriter();
        out.println(listOption);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
