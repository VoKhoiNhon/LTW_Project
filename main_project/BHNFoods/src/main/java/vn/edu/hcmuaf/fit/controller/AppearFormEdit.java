package vn.edu.hcmuaf.fit.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AppearFormEdit", value = "/appearFormEdit")
public class AppearFormEdit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String menu= request.getParameter("menu");
        int discount= Integer.parseInt(request.getParameter("discount"));
        int price= Integer.parseInt(request.getParameter("price"));
        String name = request.getParameter("name");
        String nsx= request.getParameter("nsx");
        String hsd= request.getParameter("hsd");
        String brand=request.getParameter("brand");
        String mota= request.getParameter("mota");
        double weight= Double.parseDouble(request.getParameter("weight"));
        String origin=request.getParameter("origin");
        int inventory= Integer.parseInt(request.getParameter("inventory"));
        int condition= Integer.parseInt(request.getParameter("condition"));
        String[] arrayNsx = nsx.split("-");
        String nsxF = arrayNsx[2]+"/"+arrayNsx[1]+"/"+arrayNsx[0];
        String[] arrayHsd = hsd.split("-");
        String hsdF = arrayHsd[2]+"/"+arrayHsd[1]+"/"+arrayHsd[0];
        PrintWriter out= response.getWriter();
        out.println("<div class=\"edit_formUser edit_formEdit\">\n" +
                "    <div class=\"container\" style=\"background:none;\">\n" +
                "        <div class=\"col-xl-7 ftco-animate cen-div  row ftco-section justify-content-center\">\n" +
                "            <form action=\"/BHNFoods/UpdateProduct\" method=\"post\" class=\"billing-form\" style=\"margin-top: 5%;\">\n" +
                "                <h4 class=\"mb-4 billing-heading\">Sửa sản phẩm</h4>\n" +
                "                <div class=\"row align-items-end\" style=\"font-size: 16px;\">\n" +
                "                    <div class=\"col-md-12 \">\n" +
                "                        <div class=\"form-group\">\n" +
                "                            <label>Hình ảnh</label>\n" +
                "                            <div class=\"d-flex flex-grow-1  row_input \">\n" +
                "                                <div class=\"col-md-6 col_addprod edit_img\">\n" +
                "                                    <button class=\"btnX_img\">x</button>\n" +
                "                                </div>\n" +
                "                                <div class=\"col-md-6 col_addprod edit_img\">\n" +
                "                                    <button class=\"btnX_img\">x</button>\n" +
                "                                </div>\n" +
                "                                <div class=\"col-md-6 col_addprod edit_img\">\n" +
                "                                    <button class=\"btnX_img\">x</button>\n" +
                "                                </div>\n" +
                "                                <div class=\"col-md-6 col_addprod edit_img\">\n" +
                "                                    <button class=\"btnX_img\">x</button>\n" +
                "                                </div>\n" +
                "                            </div>\n" +
                "                        </div>\n" +
                "                    </div>\n" +
                "                    <div class=\"col-md-12 \">\n" +
                "                        <div class=\"form-group\">\n" +
                "                            <label>Tên sản phẩm</label>\n" +
                "                            <input type=\"text\"  class=\"form-control input_addpr\" placeholder=\"\" name=\"name\" value=\""+name+"\">\n" +
                "                        <div style=\"display: none\" class=\"form-group\">\n" +
                "                            <label for=\"\">ID</label>\n" +
                "                            <input type=\"text\" value=\""+id+"\" class=\"form-control input_addpr\" name=\"id\" placeholder=\"\">\n" +
                "                        </div>"+
                "                        </div>\n" +
                "                    </div>\n" +
                "                    <div class=\"d-flex flex-grow-1  row_input  \">\n" +
                "                        <div class=\"col-md-6 col_addprod\">\n" +
                "                            <div class=\"form-group\">\n" +
                "                                <label>Hình ảnh</label>\n" +
                "                                <button class=\"form-control input_addpr\" style=\"background-color: #b5b5b5;\">Chọn\n" +
                "                                    tệp\n" +
                "                                </button>\n" +
                "                            </div>\n" +
                "                        </div>\n" +
                "\n" +
                "                        <div class=\"col-md-6 col_addprod\">\n" +
                "                            <div class=\"form-group\">\n" +
                "                                <label>Danh mục</label>\n" +
                "                                <select type=\"text\" class=\"form-control input_addpr\" name=\"menu\">\n" +
                "                                    <option value=\"m1\">Gạo</option>\n" +
                "                                    <option value=\"m2\">Nếp</option>\n" +
                "                                    <option value=\"m3\">Các loại hạt</option>\n" +
                "                                    <option value=\"m4\">Các loại bột</option>\n" +
                "                                    <option value=\"m5\">Các loại củ, trái</option>\n" +
                "                                </select>\n" +
                "                            </div>\n" +
                "                        </div>\n" +
                "                    </div>\n" +
                "                    <div class=\"d-flex flex-grow-1 row_input \">\n" +
                "                        <div class=\"col-md-6 col_addprod\">\n" +
                "                            <div class=\"form-group\">\n" +
                "                                <label>Giá</label>\n" +
                "                                <input name=\"price\" type=\"text\" class=\"form-control input_addpr\" placeholder=\"\"\n" +
                "                                       value=\""+price+"\">\n" +
                "                            </div>\n" +
                "                        </div>\n" +
                "                        <div class=\"col-md-6 col_addprod\">\n" +
                "                            <div class=\"form-group\">\n" +
                "                                <label>Khuyến mãi(%)</label>\n" +
                "                                <input name=\"discount\" type=\"text\" class=\"form-control input_addpr\" placeholder=\"\"\n" +
                "                                       value=\""+discount+"\">\n" +
                "                            </div>\n" +
                "                        </div>\n" +
                "                    </div>\n" +
                "                    <div class=\"d-flex flex-grow-1 row_input \">\n" +
                "                        <div class=\"col-md-6 col_addprod\">\n" +
                "                            <div class=\"form-group\">\n" +
                "                                <label>Xuất xứ</label>\n" +
                "                                <input name=\"origin\" type=\"text\" class=\"form-control input_addpr\" placeholder=\"\"\n" +
                "                                       value=\""+origin+"\">\n" +
                "                            </div>\n" +
                "                        </div>\n" +
                "                        <div class=\"col-md-6 col_addprod\">\n" +
                "                            <div class=\"form-group\">\n" +
                "                                <label>Thương hiệu</label>\n" +
                "                                <input name=\"brand\" type=\"text\" class=\"form-control  input_addpr\" value=\""+brand+"\" placeholder=\"\">\n" +
                "                            </div>\n" +
                "                        </div>\n" +
                "                        <div class=\"col-md-6 col_addprod\">\n" +
                "                            <div class=\"form-group\">\n" +
                "                                <label>Trọng lượng</label>\n" +
                "                                <input name=\"weight\" type=\"text\" class=\"form-control input_addpr\" value=\""+weight+"\"placeholder=\"\">\n" +
                "                            </div>\n" +
                "                        </div>\n" +
                "                    </div>\n" +
                "\n" +
                "\n" +
                "                    <div class=\"d-flex flex-grow-1  row_input\">\n" +
                "                        <div class=\"col-md-6 col_addprod\">\n" +
                "                            <div class=\"form-group\">\n" +
                "                                <label>Ngày sản xuất</label>\n" +
                "                                <div class=\"select-wrap\">\n" +
                "                                    <input type=\"date\" name=\"nsx\" class=\"form-control input_addpr\"\n" +
                "                                           value=\""+nsx+"\" placeholder=\"Ngày/Tháng/Năm\">\n" +
                "                                </div>\n" +
                "                            </div>\n" +
                "                        </div>\n" +
                "                        <div class=\"col-md-6 col_addprod\">\n" +
                "                            <div class=\"form-group\">\n" +
                "                                <label>Ngày hết hạn</label>\n" +
                "                                <div class=\"select-wrap\">\n" +
                "                                    <input type=\"date\" name=\"hsd\" class=\"form-control input_addpr\"\n" +
                "                                         value=\""+hsd+"\"  placeholder=\"Ngày/Tháng/Năm\">\n" +
                "                                </div>\n" +
                "                            </div>\n" +
                "                        </div>\n" +
                "                        <div class=\"col-md-6 col_addprod\">\n" +
                "                            <div class=\"form-group\">\n" +
                "                                <label>Số lượng nhập</label>\n" +
                "                                <input name=\"inventory\" type=\"number\" class=\"form-control input_addpr\" value=\""+inventory+"\" placeholder=\"\">\n" +
                "                            </div>\n" +
                "                        </div>\n" +
                "                    </div>\n" +
                "\n" +
                "                    <div class=\"col-md-12\">\n" +
                "                        <div class=\"form-group\">\n" +
                "                            <label>Mô tả</label>\n" +
                "                            <textarea type=\"text\" class=\"form-control input_addpr\"\n" +
                "                                   value=\""+mota+"\"   name=\"mota\" placeholder=\"Mô tả sản phẩm\">"+mota+"</textarea>\n" +
                "                        </div>\n" +
                "                    </div>\n" +
                "                    <div class=\"col-md d-flex col_addprod\">\n" +
                "                        <div class=\"form-group  padd_right\" style=\"\">\n" +
                "                            <label class=\"\">Trạng thái:</label>\n" +
                "                        </div>\n" +
                "                        <div class=\"form-group  padd_right\" style=\"\">\n" +
                "                            <input type=\"radio\" class=\"form-\" placeholder=\"\">\n" +
                "                            <label class=\"\">Nổi bật</label>\n" +
                "                        </div>\n" +
                "                        <div class=\"form-group padd_right \" style=\"\">\n" +
                "                            <input type=\"radio\" class=\"form-\" placeholder=\"\">\n" +
                "                            <label class=\"\">Mới</label>\n" +
                "                        </div>\n" +
                "                        <div class=\"form-group padd_right \" style=\"\">\n" +
                "                            <input type=\"radio\" class=\"form-\" name=\"condition\" value=\"1\" placeholder=\"\">\n" +
                "                            <label class=\"\">Ẩn</label>\n" +
                "                        </div>\n" +
                "                        <div class=\"form-group padd_right \" style=\"\">\n" +
                "                            <input type=\"radio\" checked class=\"form-\" name=\"condition\" value=\"0\" placeholder=\"\">\n" +
                "                            <label class=\"\">Không</label>\n" +
                "                        </div>\n" +
                "                    </div>\n" +
                "\n" +
                "                    <div class=\"col-md-12 d-flex  btn_huy_update\" style=\"justify-content: end;\">\n" +
                "                        <input onclick=\"huy()\" type=\"button\" value=\"Hủy\">\n" +
                "                        <input type=\"submit\" value=\" Cập nhật\">\n" +
                "                    </div>\n" +
                "                </div>\n" +
                "            </form><!-- END -->\n" +
                "        </div>\n" +
                "    </div>\n" +
                "</div>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
