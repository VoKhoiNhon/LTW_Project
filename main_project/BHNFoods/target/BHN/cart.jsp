<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="description" content="Ogani Template">
	<meta name="keywords" content="Ogani, unica, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Ogani | Template</title>

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
</head>

<body>


<%@ include file="header.jsp" %>


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
							<th></th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td class="shoping__cart__item">
								<img src="body_design/img/cart/cart-1.jpg" alt="">
								<h5>Khoai lang tím</h5>
							</td>
							<td class="shoping__cart__price">
								55.000
							</td>
							<td class="shoping__cart__quantity">
								<div class="quantity">
									<div class="pro-qty">
										<input type="text" value="1">
									</div>
								</div>
							</td>
							<td class="shoping__cart__total">
								110.000
							</td>
							<td class="shoping__cart__item__close">
								<span class="icon_close"></span>
							</td>
						</tr>
						<tr>
							<td class="shoping__cart__item">
								<img src="body_design/img/cart/cart-2.jpg" alt="">
								<h5>Lúa mạch</h5>
							</td>
							<td class="shoping__cart__price">
								39.000
							</td>
							<td class="shoping__cart__quantity">
								<div class="quantity">
									<div class="pro-qty">
										<input type="text" value="1">
									</div>
								</div>
							</td>
							<td class="shoping__cart__total">
								39.990
							</td>
							<td class="shoping__cart__item__close">
								<span class="icon_close"></span>
							</td>
						</tr>
						<tr>
							<td class="shoping__cart__item">
								<img src="body_design/img/cart/cart-3.jpg" alt="">
								<h5>Đậu Hà Lan</h5>
							</td>
							<td class="shoping__cart__price">
								69.000
							</td>
							<td class="shoping__cart__quantity">
								<div class="quantity">
									<div class="pro-qty">
										<input type="text" value="1">
									</div>
								</div>
							</td>
							<td class="shoping__cart__total">
								69.900
							</td>
							<td class="shoping__cart__item__close">
								<span class="icon_close"></span>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="shoping__cart__btns">
					<a href="index.jsp" class="primary-btn cart-btn">Tiếp tục mua hàng</a>

				</div>
			</div>
			<div class="col-lg-6">
				<div class="shoping__continue">
					<div class="shoping__discount">
						<h5>Mã giảm giá</h5>
						<form action="#">
							<input type="text" placeholder="Nhập mã giảm giá">
							<button style="font-family: monospace" type="submit" class="site-btn">Áp dụng</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="shoping__checkout">
					<h5>Tổng giỏ hàng</h5>
					<ul>
						<li>Tổng tiền hàng
							<span>560.000</span>
						</li>
						<li>Giảm <span>50.000</span></li>
						<li>Tổng thanh toán <span>510.000</span></li>
					</ul>
					<a href="#" class="primary-btn">Thanh toán</a>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="footer.jsp" %>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script src="body_design/js/jquery-3.3.1.min.js"></script>
<script src="body_design/js/jquery.nice-select.min.js"></script>
<script src="body_design/js/jquery-ui.min.js"></script>
<script src="body_design/js/jquery.slicknav.js"></script>
<script src="body_design/js/mixitup.min.js"></script>
<script src="body_design/js/owl.carousel.min.js"></script>
<script src="body_design/js/main.js"></script>





</body>

</html>