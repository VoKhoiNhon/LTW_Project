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
  <title>BHDFoods| Sản phẩm</title>

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
<%
  DecimalFormat decF = new DecimalFormat("#,###");
  List<Product> productList = (List<Product>) request.getAttribute("listSearchPR");
%>

<!-- Product Section Begin -->
<section class="product spad" style="padding-top: 20px">
  <div class="container">
        <div class="filter__item">
          <div class="row">
            <div class="col-lg-4 col-md-5">
              <div class="filter__sort">
                <span>Sắp xếp</span>
                <select>
                  <option value="0"><a>Giảm Giá</a></option>
                  <option value="1">Giá thấp đến cao</option>
                  <option value="2">Giá cao đến thấp</option>
                </select>
              </div>
            </div>
            <div class="col-lg-4 col-md-4">
              <div class="filter__found">
                <h6><span><%=productList.size()%></span> Sản phẩm được tìm thấy</h6>
              </div>
            </div>
          </div>
        </div>
        <div class="row">

          <%
            for(Product p: productList) {
          %>
          <div class="col-lg-4 col-md-6 col-sm-6">
            <div class="product__item">
              <div class="product__item__pic set-bg" data-setbg="<%=p.getUrl()%>">
                <%if(p.getDiscount() > 0) {%>
                <div class="discount__percent" style="">-<%=p.getDiscount()%>%</div>
                <%}%>
                <ul class="product__item__pic__hover">
                  <li><a href="#"><i class="fa fa-heart"></i></a></li>
                  <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                  <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                </ul>
              </div>
              <div class="product__item__text">
                <a href="http://localhost:8080/BHNFoods/oneProduct?id=<%=p.getIdPr()%>&idUser=user1"><%=p.getNamePr()%><br> <span><%=decF.format(p.getPrice()).replace(',','.')%>đ</span></a>
              </div>
            </div>
          </div>
          <%}%>
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