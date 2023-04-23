<%@ page import="vn.edu.hcmuaf.fit.beans.Discount" %>
<%@ page import="vn.edu.hcmuaf.fit.service.DiscountService" %>
<%@ page import="java.text.DecimalFormat" %>
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
      content: "Danh sách mã giảm giá";
      font-size: 20px;
      font-weight: bold;
    }
  </style>

</head>
<body>

<%@include file="header.jsp"%>

<%
  List<Discount> listDiscounts = (List<Discount>) request.getAttribute("listDiscount");
  DecimalFormat dec = new DecimalFormat("#,###");
%>

<section class="shoping-cart spad">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="shoping__cart__table">
          <table>
            <thead>
            <tr>
              <th>Mã giảm giá</th>
              <th>Giá giảm</th>
              <th>Số lượng</th>
              <th>Áp dụng</th>
              <th></th>
              <th></th>
            </tr>
            </thead>
            <tbody>
            <%for (Discount d: listDiscounts) {%>
            <tr>
              <td class="shoping__cart__item" style="text-align: center">
                <h5 id="maGiamGia<%=d.getIdCode()%>"><%=d.getCode()%></h5>
              </td>
              <%if(d.isType()) {%>
              <td class="shoping__cart__quantity">
                <h5><%=d.getNumber()%>%</h5>
              </td>
              <%} else {%>
              <td class="shoping__cart__quantity">
                <h5><%=dec.format(d.getNumber()).replace(',','.')%>đ</h5>
              </td>
              <%}%>
              <td class="shoping__cart__quantity">
                <h5><%=d.getSoluong()%></h5>
              </td>
              <td class="shoping__cart__item" style="text-align: center">
                <h5>Áp dụng cho đơn từ <%=dec.format(d.getMinimum()).replace(',','.')%>đ</h5>
              </td>
              <td id="btnLuu<%=d.getIdCode()%>" class="shoping__cart__quantity">
                <button onclick="luu('<%=d.getIdCode()%>')">Lưu ngay</button>
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

<%@include file="footer.jsp"%>


<script>
  function luu(idCode) {
    const text = $("#maGiamGia"+idCode).text();
    navigator.clipboard.writeText(text);
    var button = document.getElementById('btnLuu' + idCode);
    button.innerHTML = '<button onclick="luu(\''+idCode+'\')">Đã lưu</button>'
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