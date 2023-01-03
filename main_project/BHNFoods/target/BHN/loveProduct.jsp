<%@ page import="vn.edu.hcmuaf.fit.beans.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="description" content="Ogani Template">
	<meta name="keywords" content="Ogani, unica, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>BHDFoods| Sản phẩm yêu thích</title>

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
<style>
	.shoping-cart .container .row{
		border: 2px solid rgb(168, 168, 168);
		padding-top: 20px;
		margin: 20px 0;
	}
	.shoping-cart .container::before {
		content: "Sản phẩm yêu thích";
		font-size: 20px;
		font-weight: bold;
	}
	.shoping-cart .container .row .shoping__cart__table table tbody td img {
		height: 100px;
		width: 100px;
		object-fit: cover;
	}
	.shoping-cart .container .row .shoping__cart__table table tbody td button {
		background:#7fad39;
		padding:2px 15px;
		color: white;
		border: none;
	}
</style>

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
							<th></th>
							<th>Giá</th>
							<th>Thêm vào giỏ</th>
							<th></th>
						</tr>
						</thead>
						<tbody>
						<%List<Product> listLoveProd = (List<Product>) request.getAttribute("listLoveProd");
							DecimalFormat dec = new DecimalFormat("#,###");
						for (Product p : listLoveProd) {%>
						<tr id="<%=p.getIdPr()%>">
							<td class="shoping__cart__quantity">
								<img src="<%=p.getUrl()%>" alt="">
							</td>
							<td class="shoping__cart__item"><h5><%=p.getNamePr()%></h5></td>
							<td class="shoping__cart__price">
								<%=dec.format(p.getPrice()).replace(',', '.')%>đ
							</td>

							<td class="shoping__cart__quantity">
								<button id="addToCart" onclick="addToCart('<%=p.getIdPr()%>')" >Thêm</button>
							</td>
							<td class="shoping__cart__item__close "style="">
								<span onclick="remove('<%=p.getIdPr()%>')" class="icon_close"></span>
							</td>

						</tr>
						<%}%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="footer.jsp" %>
<!-- Footer Section End -->

<script>
	function addToCart(idProd) {
		$.ajax({
			url: "/BHNFoods/addToCart",
			type: 'get',
			data: {
				id: idProd,
				amount: 1
			},
			success: function (data) {
				const content = document.getElementById('totalCart');
				content.innerHTML = data;
			},
			error: function () {
			}
		});
		$('#'+idProd).remove()
	}

	function remove(idProd) {
		$.ajax({
			url: "/BHNFoods/removeFromLove",
			type: 'get',
			data: {
				id: idProd,
			},
			success: function (data) {
			},
			error: function () {
			}
		});
		$('#'+idProd).remove()
	}
</script>


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