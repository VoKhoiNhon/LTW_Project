package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.DetailsWH;
import vn.edu.hcmuaf.fit.beans.Warehouse;
import vn.edu.hcmuaf.fit.service.WarehouseService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "ViewDetailsWh", value = "/ViewDetailsWh")
public class ViewDetailsWh extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idShipment= request.getParameter("idShipment");
        Warehouse warehouse = WarehouseService.getInstance().getWareHouseById(idShipment);
        List<DetailsWH> warehouseList = WarehouseService.getInstance().getDetail_WH(idShipment);
        PrintWriter out= response.getWriter();
        String bodyForm = "";
        for (DetailsWH d: warehouseList) {
            bodyForm += "<tr>\n" +
                    "                            <td>\n" +
                    "                                <div class=\"d-flex \">\n" +
                    "                                    <div>\n" +
                    "                                        <p>"+d.getNAME_PR()+"</p>\n" +
                    "                                    </div>\n" +
                    "                                </div>\n" +
                    "                            </td>\n" +
                    "                            <td>\n" +
                    "                                <p>"+d.getNAME_MENU()+"</p>\n" +
                    "                            </td>\n" +
                    "                            <td>\n" +
                    "                                <div>\n" +
                    "                                    <div class=\"d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap\">\n" +
                    "                                        <p>"+d.getAMOUNT_PR()+"\n" +
                    "                                        </p>\n" +
                    "                                    </div>\n" +
                    "\n" +
                    "                                </div>\n" +
                    "                            </td>\n" +
                    "                            <td>\n" +
                    "                                <div class=\"\">"+d.getPRICE_IMPORT()+"\n" +
                    "                                </div>\n" +
                    "                            </td>\n" +
                    "                            <td>\n" +
                    "                                <div class=\"\">"+d.getWEIGHT_PR()+"\n" +
                    "                                </div>\n" +
                    "                            </td>\n" +
                    "                        </tr>";
        }

        out.println("<div class=\"edit_formUser form_add_sp xem_chi_tiet\" style=\"display: block\" >\n" +
                "    <div class=\"container\" style=\"background:none;\">\n" +
                "        <div class=\"col-xl-7 ftco-animate cen-div  row ftco-section justify-content-center\">\n" +
                "            <form class=\"billing-form\" style=\"margin-top: 5%;\" action=\"/Warehouse\" method=\"post\"\n" +
                "                  enctype=\"multipart/form-data\">\n" +
                "                <h4 class=\"mb-4 billing-heading\">Chi tiết lô hàng: ["+warehouse.getCode_wh()+"]</h4>\n" +
                "                <h4 class=\"mb-4 billing-heading\">Ngày nhập: "+warehouse.getDate_import_shipment()+"</h4>\n" +
                "                <h4 class=\"mb-4 billing-heading\" name=\"id_shipment\" style=\"display: none\">ID:"+idShipment+" </h4>\n" +
                "                <div class=\"table-responsive  mt-1\">\n" +
                "                    <table class=\"table select-table\">\n" +
                "                        <thead>\n" +
                "                        <tr>\n" +
                "                            <th>Tên sản phẩm</th>\n" +
                "                            <th>Danh mục</th>\n" +
                "                            <th>Số lượng</th>\n" +
                "                            <th>Giá nhập</th>\n" +
                "                            <th>Trọng lượng</th>\n" +
                "                        </tr>\n" +
                "                        </thead>\n" +
                "                           <tbody>"+
                                            bodyForm +
                "                           </tbody>" +
                "                    </table>\n" +
                "                </div>\n" +
                "                <div class=\"col-md-12 d-flex btn_huy_update\" style=\"justify-content: end;\">\n" +
                "                    <input type=\"button\" onclick=\"huy()\" value=\"Đóng\">\n" +
                "                </div>\n" +
                "            </form>\n" +
                "        </div>\n" +
                "    </div>\n" +
                "</div>\n");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
