package vn.edu.hcmuaf.fit.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;

@WebServlet(name = "ViewContact", value = "/ViewContact")
public class ViewContact extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String iduser = request.getParameter("iduser");
        String nameUser = request.getParameter("nameUser");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String content = request.getParameter("content");

        PrintWriter out= response.getWriter();
        out.println(" <div class=\"edit_formUser\">\n" +
                "        <div class=\"container\" style=\"background:none;\">\n" +
                "            <div class=\"col-xl-7 ftco-animate cen-div  row ftco-section justify-content-center\">\n" +
                "                <form action=\"/BHNFoods/ContactServlet\" method=\"post\" class=\"billing-form\" style=\"margin-top: 2%;\">\n" +
                "                    <h3 class=\"mb-4 billing-heading\" style=\"color: #7fad39;\">PHẢN HỒI KHÁCH HÀNG</h3>\n" +
                "                    <div class=\"row align-items-end\" style=\"font-size: 16px;\">\n" +
                "                        <div class=\"col-md-12 col_addprod\">\n" +
                "                            <div class=\"form-group\">\n" +
                "                                <h4>Thông tin tin khách hàng</h4>\n" +
                "                                <p>Tên khách hàng: 203 Hòa Bình, Quận Bình Thạnh, thành phố Hồ Chí Minh.</p>\n" +
                "                                <p>Số điện thoại: 0779807028</p>\n" +
                "                                <p>Email: BHNFoods@gmail.com</p>\n" +
                "                            </div>\n" +
                "                        </div>\n" +
                "                        <div class=\" col-md-12\">\n" +
                "                            <div class=\"form-group\" style=\"display: none\">\n" +
                "                                <label>ID</label>\n" +
                "                                <input type=\"text\" value=\"\" name=\"iduser\" class=\"form-control input_addpr\"\n" +
                "                                    placeholder=\"\">\n" +
                "                            </div>\n" +
                "                            <div class=\"form-group\">\n" +
                "                                <label>Nội dung </label>\n" +
                "                                <div name=\"content\"  class=\"form-control contentContact\" value=\"\">\n" +
                "                                    <p>dsjnfkjsdnkfjsldnv</p>\n" +
                "                                </div>\n" +
                "                            </div>\n" +
                "                        </div>\n" +
                "                        <div class=\"col-md-12 d-flex  btn_huy_update\" style=\"justify-content: end;\">\n" +
                "                            <input onclick=\"huy()\" type=\"button\" value=\"Đóng\">\n" +
                "                       \n" +
                "                        </div>\n" +
                "                    </div>\n" +
                "                </form>\n" +
                "\n" +
                "            </div>\n" +
                "        </div>\n" +
                "    </div>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
