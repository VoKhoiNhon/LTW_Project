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
    <title>BHNFoods | Quản lý</title>

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
            <div class="row" id="<%=entry.getKey()%>">
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
                                <button class="uCanClick" onclick="huyDon('<%=entry.getKey()%>')" style="background:#7fad39; padding:10px 25px; color: white; border: none;">Hủy đơn</button>
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
        </div>
    </section>

<%@include file="footer.jsp"%>

<script>
    function huyDon(idOder) {
        $.ajax({
            url: "/BHNFoods/removeFromManageOrder",
            type: 'get',
            data: {
                id: idOder,
            },
            success: function (data) {
            },
            error: function () {
            }
        });
        $('#'+idOder).remove();
    }
</script>

    <script src="body_design/js/jquery-3.3.1.min.js"></script>
<script src="body_design/js/jquery.nice-select.min.js"></script>
<script src="body_design/js/jquery-ui.min.js"></script>
<script src="body_design/js/jquery.slicknav.js"></script>
<script src="body_design/js/mixitup.min.js"></script>
<script src="body_design/js/owl.carousel.min.js"></script>
<script src="body_design/js/main.js"></script>
</body>
</html>