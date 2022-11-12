<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="java.util.List" %>
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


<!-- Product Section Begin -->
<section class="product spad" style="padding-top: 20px">
    <div class="container">

        <div class="row">
            <div class="col-lg-3 col-md-5">
                <div class="sidebar">
                    <div class="sidebar__item">
                        <div class="hero__categories">
                            <div class="hero__categories__all">
                                <span>Danh sách sản phẩm</span>
                            </div>
                            <ul>
                                <li><a href="#">Gạo</a></li>
                                <li><a href="#">Nếp</a></li>
                                <li><a href="#">Các loại hạt</a></li>
                                <li><a href="#">Các loại bột</a></li>
                                <li><a href="#">Các loại củ, trái</a></li>
                            </ul>
                        </div>
                    </div>
<%--                    <div class="sidebar__item">--%>
<%--                        <h4>Giá</h4>--%>
<%--                        <div class="price-range-wrap">--%>
<%--                            <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"--%>
<%--                                 data-min="10" data-max="540">--%>
<%--                                <div class="ui-slider-range ui-corner-all ui-widget-header"></div>--%>
<%--                                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>--%>
<%--                                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>--%>
<%--                            </div>--%>
<%--                            <div class="range-slider">--%>
<%--                                <div class="price-input">--%>
<%--                                    <input type="text" id="minamount">--%>
<%--                                    <input type="text" id="maxamount">--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

                    <div class="sidebar__item">
                        <div class="latest-product__text">
                            <h4>Sản phẩm mới nhất</h4>
                            <div class="latest-product__slider owl-carousel">
                                <div class="latest-prdouct__slider__item">
                                    <a href="#" class="latest-product__item" >
                                        <div class="latest-product__item__pic">
                                            <img src="body_design/img/latest-product/lp-1.jpg" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Ngô Mỹ</h6>
                                            <span>25.000đ</span>
                                        </div>
                                    </a>
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="body_design/img/latest-product/lp-2.jpg" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Ngô Mỹ</h6>
                                            <span>25.000đ</span>
                                        </div>
                                    </a>
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="body_design/img/latest-product/lp-3.jpg" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Ngô Mỹ</h6>
                                            <span>25.000đ</span>
                                        </div>
                                    </a>
                                </div>
                                <div class="latest-prdouct__slider__item">
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="body_design/img/latest-product/lp-1.jpg" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Ngô Mỹ</h6>
                                            <span>25.000đ</span>
                                        </div>
                                    </a>
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="body_design/img/latest-product/lp-2.jpg" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Ngô Mỹ</h6>
                                            <span>25.000đ</span>
                                        </div>
                                    </a>
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="body_design/img/latest-product/lp-3.jpg" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Ngô Mỹ</h6>
                                            <span>25.000đ</span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-md-7">
                <div class="product__discount">
                    <div class="section-title product__discount__title">
                        <h2>Giảm giá</h2>
                    </div>
                    <div class="row">
                        <div class="product__discount__slider owl-carousel">
                            <%for(int i = 0; i < 5; i++) {%>
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="body_design/img/product/discount/pd-1.jpg">
                                        <div class="product__discount__percent">-20%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">

                                        <a href="singleProduct.jsp"><span>Gạo</span>
                                            <h5>Gạo ST25</h5>
                                            <div class="product__item__price">50.000đ <span>60.000đ</span></div></a>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
                <div class="filter__item">
                    <div class="row">
                        <div class="col-lg-4 col-md-5">
                            <div class="filter__sort">
                                <span>Sắp xếp</span>
                                <select>
                                    <option value="0">Giảm giá</option>
                                    <option value="0">Giá thấp đến cao</option>
                                    <option value="0">Giá cao đến thấp</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4">
                            <div class="filter__found">
                                <h6><span>16</span> Sản phẩm được tìm thấy</h6>
                            </div>
                        </div>
<%--                        <div class="col-lg-4 col-md-3">--%>
<%--                            <div class="filter__option">--%>
<%--                                <span class="icon_grid-2x2"></span>--%>
<%--                                <span class="icon_ul"></span>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                    </div>
                </div>
                <div class="row">
                    <%
                        List<Product> productList = (List<Product>) request.getAttribute("listRequest");
                        for(Product p: productList) {
                    %>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="<%=p.getSrc()%>">
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <a href="singleProduct.jsp"><%=p.getName()%><br> <span><%=p.getPrice()%>đ</span></a>
                            </div>
                        </div>
                    </div>
                    <%}%>
                </div>
                <div class="product__pagination">
                    <a href="#">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#"><i class="fa fa-long-arrow-right"></i></a>
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