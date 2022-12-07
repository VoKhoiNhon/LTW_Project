<%@ page import="vn.edu.hcmuaf.fit.beans.Orders" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BHDFoods| Quản lý</title>

    <!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

	<!-- Css Styles -->
	<link rel="stylesheet" href="body_design/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="body_design/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="body_design/css/elegant-icons.css" type="text/css">
	<link rel="stylesheet" href="body_design/css/nice-select.css" type="text/css">
	<link rel="stylesheet" href="body_design/css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="body_design/css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" href="body_design/css/slicknav.min.css" type="text/css">
	<link rel="stylesheet" href="body_design/css/style.css" type="text/css">

    <style>
        .shoping-cart .container .row{
            border: 2px solid rgb(168, 168, 168);
            padding-top: 20px;
            margin: 20px 0;
        }
        .shoping-cart .container::before {
            content: "Quản lý đơn hàng";
            font-size: 20px;
            font-weight: bold;
        }
    </style>

</head>
<body>

<%@include file="header.jsp"%>

    <section class="shoping-cart spad">
        <div class="container">
            <%
                Map<String, List<Orders>> mapOrder = (Map<String, List<Orders>>) request.getAttribute("mapOrder");
                Map<String, Integer> sumOrder = (Map<String, Integer>) request.getAttribute("sumOrder");
                for (Map.Entry<String, List<Orders>> entry : mapOrder.entrySet()) {
                    int condition = 0;
                    String cursor = "pointer";
                    double opacity = 1.0;

            %>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                            <tr>
                                <th class="">Sản Phẩm</th>
                                <th></th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Tổng</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                DecimalFormat dec = new DecimalFormat("#,###");
                                for (Orders o : mapOrder.get(entry.getKey())) {
                                    condition = o.getCondition();
                            %>
                            <tr>
                                <td class="shoping__cart__quantity">
                                    <img src="<%=o.getUrl()%>" alt="" style="width: 100px;height: auto">

                                </td>
                                <td class="shoping__cart__item">
                                    <h5><%=o.getNamePr()%></h5>
                                </td>
                                <td class="shoping__cart__price">
                                    <%=dec.format(o.getPriceHere()).replace(',','.')%>đ
                                </td>
                                <td class="shoping__cart__quantity">
                                    <span><%=o.getAmount()%></span>
                                </td>
                                <td class="shoping__cart__total">
                                    <%=dec.format(o.getPriceHere()*o.getAmount()).replace(',','.')%>đ
                                </td>
                            </tr>
                            <%}%>
<%--                            <tr>--%>
<%--                                <td class="shoping__cart__item">--%>
<%--                                    <img src="ImageproductNew/Gao/coop-select/gao-dai-thom-8-coop-select-5kg-1-300x300.jpg" alt="" style="width: 100px;height: auto">--%>
<%--                                    <h5>Gạo dài thơm 8- Coop Select 5kg</h5>--%>
<%--                                </td>--%>
<%--                                <td class="shoping__cart__price">--%>
<%--                                    65.000S--%>
<%--                                </td>--%>
<%--                                <td class="shoping__cart__quantity">--%>
<%--                                    <span>1</span>--%>
<%--                                </td>--%>
<%--                                <td class="shoping__cart__total">--%>
<%--                                    65.000--%>
<%--                                </td>--%>

<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td class="shoping__cart__item">--%>
<%--                                    <img src="ImageproductNew/Dau/dau-ha-lan-sg-food-goi-500g-202208090905319049_300x300.png" alt="" style="width: 100px;height: auto">--%>
<%--                                    <h5>Đậu Hà Lan Đông Lạnh SG-Food 500g</h5>--%>
<%--                                </td>--%>
<%--                                <td class="shoping__cart__price">--%>
<%--                                    43.000--%>
<%--                                </td>--%>
<%--                                <td class="shoping__cart__quantity">--%>
<%--                                    <span>2</span>--%>
<%--                                </td>--%>
<%--                                <td class="shoping__cart__total">--%>
<%--                                    86.000--%>
<%--                                </td>--%>

<%--                            </tr>--%>
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-between pt-5 align-items-center">
                            <div>
                                <%if(condition == 0) {%>
                                <h5>Tình trạng đơn hàng: <span style="color: red;">Đang chuẩn bị</span></h5>
                                <%} else {
                                %>
                                <h5>Tình trạng đơn hàng: <span style="color: red;">Đang giao hàng</span></h5>
                                <%}%>
                            </div>
                            <%if(condition == 0) {%>
                            <div>
                                <button class="uCanClick" style="background:#7fad39; padding:10px 25px; color: white; border: none;">Hủy đơn</button>
                            </div>
                            <%}%>
                            <div>
                                <h4>Tổng đơn hàng: <span ><%=dec.format(sumOrder.get(entry.getKey())).replace(',','.')%>đ</span></h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                <%}%>
<%--            <div class="row">--%>
<%--                <div class="col-lg-12">--%>
<%--                    <div class="shoping__cart__table">--%>
<%--                        <table>--%>
<%--                            <thead>--%>
<%--                            <tr>--%>
<%--                                <th class="shoping__product">Sản Phẩm</th>--%>
<%--                                <th>Giá</th>--%>
<%--                                <th>Số lượng</th>--%>
<%--                                <th>Tổng</th>--%>
<%--                            </tr>--%>
<%--                            </thead>--%>
<%--                            <tbody>--%>
<%--                            <tr>--%>
<%--                                <td class="shoping__cart__item">--%>
<%--                                    <img src="ImageproductNew/Dau/dau-den-viet-san-150g-202205231452334172_300x300.jpg" alt="" style="width: 100px;height: auto">--%>
<%--                                    <h5>Đậu đen Vệt San 150g</h5>--%>
<%--                                </td>--%>
<%--                                <td class="shoping__cart__price">--%>
<%--                                    17.000--%>
<%--                                </td>--%>
<%--                                <td class="shoping__cart__quantity">--%>
<%--                                    <span>1</span>--%>
<%--                                </td>--%>
<%--                                <td class="shoping__cart__total">--%>
<%--                                    17.000--%>
<%--                                </td>--%>

<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td class="shoping__cart__item">--%>
<%--                                    <img src="ImageproductNew/Bot/Bot-bap-meizan/bot-bap-meizan1.jpg" alt=""style="width: 100px;height: auto">--%>
<%--                                    <h5>Bột Bắp Mezian 150g</h5>--%>
<%--                                </td>--%>
<%--                                <td class="shoping__cart__price">--%>
<%--                                    20.000--%>
<%--                                </td>--%>
<%--                                <td class="shoping__cart__quantity">--%>
<%--                                    <span>2</span>--%>
<%--                                </td>--%>
<%--                                <td class="shoping__cart__total">--%>
<%--                                    40.000--%>
<%--                                </td>--%>

<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td class="shoping__cart__item">--%>
<%--                                    <img src="ImageproductNew/Khoai/bap-nep/bap-nep-cap-coop-300x300.jpg" alt="" style="width: 100px;height: auto">--%>
<%--                                    <h5>2 trái bắp nếp (từ 500g)</h5>--%>
<%--                                </td>--%>
<%--                                <td class="shoping__cart__price">--%>
<%--                                    10.000--%>
<%--                                </td>--%>
<%--                                <td class="shoping__cart__quantity">--%>
<%--                                    <span>2</span>--%>
<%--                                </td>--%>
<%--                                <td class="shoping__cart__total">--%>
<%--                                    20.000--%>
<%--                                </td>--%>

<%--                            </tr>--%>
<%--                            </tbody>--%>
<%--                        </table>--%>
<%--                        <div class="d-flex justify-content-between pt-5 align-items-center">--%>
<%--                            <div>--%>
<%--                                <h5>Tình trạng đơn hàng: <span style="color: red;">Đang vận chuyển</span></h5>--%>
<%--                              --%>
<%--                            </div>--%>
<%--                            <div>--%>
<%--                                <button style="background:#676767; padding:10px 25px; color: white; border: none;">Hủy đơn</button>--%>
<%--                            </div>--%>
<%--                            <div>--%>
<%--                                <h4>Tổng đơn hàng: <span >570.000đ</span></h4>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>

        </div>
    </section>

<%@include file="footer.jsp"%>
    <script src="body_design/js/jquery-3.3.1.min.js"></script>
<script src="body_design/js/jquery.nice-select.min.js"></script>
<script src="body_design/js/jquery-ui.min.js"></script>
<script src="body_design/js/jquery.slicknav.js"></script>
<script src="body_design/js/mixitup.min.js"></script>
<script src="body_design/js/owl.carousel.min.js"></script>
<script src="body_design/js/main.js"></script>
</body>
</html>