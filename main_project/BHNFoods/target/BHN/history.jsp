<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BHDFoods| Lịch sử</title>

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
            content: "Lịch sử giao dịch";
            font-size: 20px;
            font-weight: bold;
        }
    </style>

</head>
<body>

<%@include file="header.jsp"%>

    <section class="shoping-cart spad">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                            <tr>
                                <th class="shoping__product">Sản Phẩm</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Tổng</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="shoping__cart__item">
                                    <img src="ImageproductNew/Khoai/khoai-lang-tim/khoai-lang-tim-tui-500g-202105051946310826.jpg" alt="" style="width: 100px;height: auto">
                                    <h5>Khoai lang tím túi 1kg (5-8 củ)</h5>
                                </td>
                                <td class="shoping__cart__price">
                                    25.000
                                </td>
                                <td class="shoping__cart__quantity">
                                    <span>2</span>
                                </td>
                                <td class="shoping__cart__total">
                                   50.000
                                </td>
                                
                            </tr>
                            <tr>
                                <td class="shoping__cart__item">
                                    <img src="ImageproductNew/Gao/coop-select/gao-dai-thom-8-coop-select-5kg-1-300x300.jpg" alt="" style="width: 100px;height: auto">
                                    <h5>Gạo dài thơm 8- Coop Select 5kg</h5>
                                </td>
                                <td class="shoping__cart__price">
                                   65.000S
                                </td>
                                <td class="shoping__cart__quantity">
                                    <span>1</span>
                                </td>
                                <td class="shoping__cart__total">
                                   65.000
                                </td>
                                
                            </tr>
                            <tr>
                                <td class="shoping__cart__item">
                                    <img src="ImageproductNew/Dau/dau-ha-lan-sg-food-goi-500g-202208090905319049_300x300.png" alt="" style="width: 100px;height: auto">
                                    <h5>Đậu Hà Lan Đông Lạnh SG-Food 500g</h5>
                                </td>
                                <td class="shoping__cart__price">
                                    43.000
                                </td>
                                <td class="shoping__cart__quantity">
                                    <span>2</span>
                                </td>
                                <td class="shoping__cart__total">
                                  86.000
                                </td>
                                
                            </tr>
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-between pt-5 align-items-center">
                            <div>
                                <h5>Thời gian đặt hàng: <span>12/11/2022</span></h5>
                            </div>
                            <div>
                                <h4>Tổng đơn hàng: <span>200.000đ</span></h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                            <tr>
                                <th class="shoping__product">Sản Phẩm</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Tổng</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="shoping__cart__item">
                                    <img src="ImageproductNew/Dau/dau-den-viet-san-150g-202205231452334172_300x300.jpg" alt="" style="width: 100px;height: auto">
                                    <h5>Đậu đen Vệt San 150g</h5>
                                </td>
                                <td class="shoping__cart__price">
                                    17.000
                                </td>
                                <td class="shoping__cart__quantity">
                                    <span>1</span>
                                </td>
                                <td class="shoping__cart__total">
                                    17.000
                                </td>
                                
                            </tr>
                            <tr>
                                <td class="shoping__cart__item">
                                    <img src="ImageproductNew/Bot/Bot-bap-meizan/bot-bap-meizan1.jpg" alt=""style="width: 100px;height: auto">
                                    <h5>Bột Bắp Mezian 150g</h5>
                                </td>
                                <td class="shoping__cart__price">
                                    20.000
                                </td>
                                <td class="shoping__cart__quantity">
                                    <span>2</span>
                                </td>
                                <td class="shoping__cart__total">
                                  40.000
                                </td>
                                
                            </tr>
                            <tr>
                                <td class="shoping__cart__item">
                                    <img src="ImageproductNew/Khoai/bap-nep/bap-nep-cap-coop-300x300.jpg" alt="" style="width: 100px;height: auto">
                                    <h5>2 trái bắp nếp (từ 500g)</h5>
                                </td>
                                <td class="shoping__cart__price">
                                  10.000
                                </td>
                                <td class="shoping__cart__quantity">
                                    <span>2</span>
                                </td>
                                <td class="shoping__cart__total">
                                   20.000
                                </td>
                                
                            </tr>
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-between pt-5 align-items-center">
                            <div>
                                <h5>Thời gian đặt hàng: <span>12/11/2022</span></h5>
                            </div>
                            <div>
                                <h4>Tổng đơn hàng: <span>50000đ</span></h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
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