package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.DetailsWH;
import vn.edu.hcmuaf.fit.beans.Warehouse;
import vn.edu.hcmuaf.fit.service.WarehouseService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchWH", value = "/SearchWH")
public class SearchWH extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        List<Warehouse> list = WarehouseService.getInstance().search(code);
        System.out.println(list.size());
        String result = "";
        for (Warehouse w : list) {
            int sumPrice = 0;
            List<DetailsWH> detailWH = WarehouseService.getInstance().getDetail_WH(w.getId_shipment());
            for (DetailsWH d : detailWH) {
                sumPrice += d.getPRICE_IMPORT() * d.getAMOUNT_PR();
            }
            System.out.println(w.getCode_wh()+"-"+detailWH.size()+"-"+w.getDate_import_shipment()+"-"+ w.getName_employee()+"-"+sumPrice);
            result +=  "<tr>\n" +
                    "                                                                    <td>\n" +
                    "                                                                        <div class=\"d-flex \">\n" +
                    "                                                                            <div>\n" +
                    "                                                                                <h6>["+w.getCode_wh()+"]\n" +
                    "                                                                                </h6>\n" +
                    "                                                                            </div>\n" +
                    "                                                                        </div>\n" +
                    "                                                                    </td>\n" +
                    "\n" +
                    "                                                                    <td>\n" +
                    "                                                                        <div class=\" \">\n" +
                    "                                                                            <p>"+detailWH.size()+"\n" +
                    "                                                                            </p>\n" +
                    "                                                                        </div>\n" +
                    "                                                                    </td>\n" +
                    "                                                                    <td>\n" +
                    "                                                                        <div class=\"\">"+w.getName_employee()+"\n" +
                    "                                                                        </div>\n" +
                    "                                                                    </td>\n" +
                    "                                                                    <td>\n" +
                    "                                                                        <h6>"+w.getDate_import_shipment()+"\n" +
                    "                                                                        </h6>\n" +
                    "                                                                    </td>\n" +
                    "                                                                    <td>\n" +
                    "                                                                        <div class=\"\">"+sumPrice+"\n" +
                    "                                                                        </div>\n" +
                    "                                                                    </td>\n" +
                    "                                                                    <td>\n" +
                    "                                                                        <div class=\"btn_edit\">\n" +
                    "                                                                            <button onclick=\"details('"+w.getId_shipment()+"')\">\n" +
                    "                                                                                <h4 class=\"card-title card-title-dash\">\n" +
                    "                                                                                    Xem chi tiết\n" +
                    "                                                                                </h4></button>\n" +
                    "                                                                        </div>\n" +
                    "                                                                    </td>\n" +
                    "                                                                </tr>";
            
        }
        response.getWriter().println(result);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
