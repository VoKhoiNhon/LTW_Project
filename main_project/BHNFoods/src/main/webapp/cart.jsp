<%@ page import="vn.edu.hcmuaf.fit.beans.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="description" content="Ogani Template">
	<meta name="keywords" content="Ogani, unica, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>BHDFoods| Giỏ hàng</title>

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
							<th></th>
						</tr>
						</thead>
						<tbody>
						<%
							DecimalFormat decF = new DecimalFormat("#,###");
							List<Cart>cList = (List<Cart>) request.getAttribute("listCart");
							int sum = (int) request.getAttribute("sum");
							for(Cart p: cList) {

						%>
						<tr id="<%=p.getIdPr()%>">
							<td class="shoping__cart__item">
								<img src="<%=p.getUrl()%>" alt=""style="width: 100px;height: auto">
								<h5><%=p.getNamePr()%></h5>
							</td>
							<td class="shoping__cart__price">
								<%=decF.format(p.getPrice()).replace(',','.')%>đ
							</td>
							<td class="shoping__cart__quantity">
								<div class="quantity">
									<div class="pro-qty">
										<span onclick="changeAmount(this,'<%=p.getPrice()%>', '<%=p.getIdPr()%>', document.getElementById('totalCart'))" class="dec qtybtn">-</span>
										<input id="amount<%=p.getIdPr()%>" type="text" value="<%=p.getAmount()%>">
										<span onclick="changeAmount(this,'<%=p.getPrice()%>', '<%=p.getIdPr()%>', document.getElementById('totalCart'))" class="inc qtybtn">+</span>
									</div>
								</div>
							</td>
							<td id="total<%=p.getIdPr()%>" class="shoping__cart__total">
								<%= decF.format(p.getAmount()*p.getPrice()).replace(',','.')%> đ
							</td>
							<td style="padding: 30px">
								<input id="box<%=p.getIdPr()%>" onclick="checkBox(this,'<%=p.getIdPr()%>', '<%=p.getPrice()%>', document.getElementById('amount<%=p.getIdPr()%>'))" class="checkBoxCart" type="checkbox" checked style="transform: scale(1.5)">
							</td>
							<td class="shoping__cart__item__close">
								<span onclick="removeProduct(document.getElementById('totalCart'),document.getElementById('box<%=p.getIdPr()%>'),'<%=p.getIdPr()%>', '<%=p.getPrice()%>', document.getElementById('amount<%=p.getIdPr()%>'))" class="icon_close"></span>
							</td>
						</tr>
						<%}%>

						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="shoping__cart__btns">
					<a href="ListProduct.jsp" class="primary-btn cart-btn">Tiếp tục mua hàng</a>

				</div>
			</div>
			<div class="col-lg-6">
				<div class="shoping__continue">
					<div class="shoping__discount">
						<h5>Mã giảm giá</h5>
						<form action="#">
							<input type="text" placeholder="Nhập mã giảm giá">
							<button style="font-family: system-ui" type="submit" class="site-btn">Áp dụng</button>
						</form>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div id="checkOut" class="shoping__checkout">
					<h5>Tổng giỏ hàng</h5>
					<ul>
						<li id="sum" value="<%=sum%>">Tổng tiền hàng
							<span><%= decF.format(sum).replace(',','.')%>đ</span>
						</li>
						<li id="discount" value="0">Giảm <span ><%=decF.format(0).replace(',','.')%>đ</span></li>
						<li id="total" value="<%=sum - 0%>">Tổng thanh toán (chưa gồm phí vận chuyển) <span><%=decF.format(sum - 0).replace(',','.')%>đ</span></li>
					</ul>
					<a href="checkout.jsp" class="primary-btn">Thanh toán</a>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="footer.jsp" %>
<!-- Footer Section End -->

<script>
	let sumCart = <%=session.getAttribute("sumCart")%>;
	function format1(n, currency) {
		return n.toFixed(0).replace(/./g, function(c, i, a) {
			return i > 0 && c !== "." && (a.length - i) % 3 === 0 ? "." + c : c;
		}) + currency ;
	}

	function changeAmount(button, orginPrice, idProd, elementHeader) {
		let sum = $('#sum').val();
		let discount = $('#discount').val();
		let total = $('#total').val();
		var proQty = $('.pro-qty');
		var elementI = $('#amount'+idProd);
		var oldValue = elementI.val();
		if (button.classList.contains('inc')) {
			var newVal = parseFloat(oldValue) + 1;
			sumCart +=1;
			sum = parseInt(sum) + parseInt(orginPrice);
		} else {
			// Don't allow decrementing below one
			if (oldValue > 1) {
				var newVal = parseFloat(oldValue) - 1;
				sumCart -=1;
				sum = parseInt(sum) - parseInt(orginPrice);
			} else {
				newVal = 1;
			}
		}
		elementI.val(newVal);
		elementHeader.innerHTML = "<a href=\"http://localhost:8080/BHNFoods/Cart?idUser=user1\" class=\"nav-link\">\n" +
				"                        <span class=\"fa-solid fa-cart-shopping\"></span>["+sumCart+"]</a>";
		const totalF = format1(parseInt(orginPrice)*parseInt(newVal), ' đ')
		$('#total'+idProd).text(totalF);
		$.ajax({
			url: "/BHNFoods/changeAmountFormCart",
			type: 'get',
			data: {
				id: idProd,
				sum : sum,
				discount : discount,
				total : total,
				amount : newVal
			},
			success: function (data) {
				const content = document.getElementById('checkOut')
				content.innerHTML = data;
			},
			error: function () {
			}
		});
	}



	function removeProduct(elementHeader,elementInput,idProduct, price, elementInputAmount) {
		document.getElementById(idProduct).remove();


		let sum = $('#sum').val();
		let discount = $('#discount').val();
		let total = $('#total').val();
		let amount = elementInputAmount.value;
		if(elementInput.checked === true) {
			sum = sum - price*amount;
			total = total - price*amount;
		}
		$.ajax({
			url: "/BHNFoods/removeFromCart",
			type: 'get',
			data: {
				id: idProduct,
				sum : sum,
				discount : discount,
				total : total
			},
			success: function (data) {
				const content = document.getElementById('checkOut')
				content.innerHTML = data;
				sumCart = sumCart - amount;
				elementHeader.innerHTML = "<a href=\"http://localhost:8080/BHNFoods/Cart?idUser=user1\" class=\"nav-link\">\n" +
						"                        <span class=\"fa-solid fa-cart-shopping\"></span>["+sumCart+"]</a>";
			},
			error: function () {
			}
		});
	}
	function checkBox(box ,idProduct, price, elementInputAmount) {
		let sum;
		let total;
		let amount = elementInputAmount.value;
		if(box.checked === true) {
			sum = parseInt($('#sum').val()) +  parseInt(price)*amount;
			total = parseInt($('#total').val()) + parseInt(price)*amount;
		} else {
			sum = $('#sum').val() - price*amount;
			total = $('#total').val() - price*amount;
		}
		let discount = $('#discount').val();
		$.ajax({
			url: "/BHNFoods/unCheckFromCart",
			type: 'get',
			data: {
				id: idProduct,
				sum : sum,
				discount : discount,
				total : total
			},
			success: function (data) {
				const content = document.getElementById('checkOut')
				content.innerHTML = data;
			},
			error: function () {
			}
		});
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