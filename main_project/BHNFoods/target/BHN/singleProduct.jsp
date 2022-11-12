<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>BHDFoods</title>

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
<section class="product-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="product__details__pic">
                    <div class="product__details__pic__item">
                        <img class="product__details__pic__item--large"
                             src="body_design/img/product/details/product-details-1.jpg" alt="">
                    </div>
                    <div class="product__details__pic__slider owl-carousel">
                        <img data-imgbigurl="body_design/img/product/details/product-details-2.jpg"
                             src="body_design/img/product/details/thumb-1.jpg" alt="">
                        <img data-imgbigurl="body_design/img/product/details/product-details-3.jpg"
                             src="body_design/img/product/details/thumb-2.jpg" alt="">
                        <img data-imgbigurl="body_design/img/product/details/product-details-5.jpg"
                             src="body_design/img/product/details/thumb-3.jpg" alt="">
                        <img data-imgbigurl="body_design/img/product/details/product-details-4.jpg"
                             src="body_design/img/product/details/thumb-4.jpg" alt="">
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="product__details__text">
                    <h3>Tên sản phẩm</h3>
                    <div class="product__details__rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                        <span>(18 đánh giá)</span>
                    </div>
                    <div class="product__details__price">50.000đ</div>
                    <p>Đây là phầm mô tả về sản phẩm, mình cần viết những thông tin cơ bản như nó được sản xuất ở đâu,
                    giống gì, cam kết chất lượng, tốt cho sức khoẻ người dùng này kia nọ...</p>
                    <div class="product__details__quantity">
                        <div class="quantity">
                            <div class="pro-qty">
                                <input type="text" value="1">
                            </div>
                        </div>
                    </div>
                    <a href="#" class="primary-btn">THÊM VÀO GIỎ HÀNG</a>
                    <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                    <ul>
                        <li><b>Hạn sử dụng</b> <span>Còn 10 tháng</span></li>
                        <li><b>Giao hàng</b> <span>Trong 3 giờ <samp>Miễn phí trong 1.5km</samp></span></li>
                        <li><b>Trọng lượng</b> <span>0.5 kg</span></li>
<%--                        <li><b>Share on</b>--%>
<%--                            <div class="share">--%>
<%--                                <a href="#"><i class="fa fa-facebook"></i></a>--%>
<%--                                <a href="#"><i class="fa fa-twitter"></i></a>--%>
<%--                                <a href="#"><i class="fa fa-instagram"></i></a>--%>
<%--                                <a href="#"><i class="fa fa-pinterest"></i></a>--%>
<%--                            </div>--%>
<%--                        </li>--%>
                    </ul>
                </div>
            </div>
            <%--                <div class="col-lg-12">--%>
            <%--                    <div class="product__details__tab">--%>
            <%--                        <ul class="nav nav-tabs" role="tablist">--%>
            <%--                            <li class="nav-item">--%>
            <%--                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"--%>
            <%--                                    aria-selected="true">Description</a>--%>
            <%--                            </li>--%>
            <%--                            <li class="nav-item">--%>
            <%--                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"--%>
            <%--                                    aria-selected="false">Information</a>--%>
            <%--                            </li>--%>
            <%--                            <li class="nav-item">--%>
            <%--                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"--%>
            <%--                                    aria-selected="false">Reviews <span>(1)</span></a>--%>
            <%--                            </li>--%>
            <%--                        </ul>--%>
            <%--                        <div class="tab-content">--%>
            <%--                            <div class="tab-pane active" id="tabs-1" role="tabpanel">--%>
            <%--                                <div class="product__details__tab__desc">--%>
            <%--                                    <h6>Products Infomation</h6>--%>
            <%--                                    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.--%>
            <%--                                        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Vivamus--%>
            <%--                                        suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam sit amet quam--%>
            <%--                                        vehicula elementum sed sit amet dui. Donec rutrum congue leo eget malesuada.--%>
            <%--                                        Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat,--%>
            <%--                                        accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a--%>
            <%--                                        pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet quam vehicula--%>
            <%--                                        elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus--%>
            <%--                                        et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam--%>
            <%--                                        vel, ullamcorper sit amet ligula. Proin eget tortor risus.</p>--%>
            <%--                                        <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem--%>
            <%--                                        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet--%>
            <%--                                        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum--%>
            <%--                                        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus--%>
            <%--                                        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.--%>
            <%--                                        Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed--%>
            <%--                                        porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum--%>
            <%--                                        sed sit amet dui. Proin eget tortor risus.</p>--%>
            <%--                                </div>--%>
            <%--                            </div>--%>
            <%--                            <div class="tab-pane" id="tabs-2" role="tabpanel">--%>
            <%--                                <div class="product__details__tab__desc">--%>
            <%--                                    <h6>Products Infomation</h6>--%>
            <%--                                    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.--%>
            <%--                                        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.--%>
            <%--                                        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam--%>
            <%--                                        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo--%>
            <%--                                        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.--%>
            <%--                                        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent--%>
            <%--                                        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac--%>
            <%--                                        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante--%>
            <%--                                        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;--%>
            <%--                                        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.--%>
            <%--                                        Proin eget tortor risus.</p>--%>
            <%--                                    <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem--%>
            <%--                                        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet--%>
            <%--                                        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum--%>
            <%--                                        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus--%>
            <%--                                        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>--%>
            <%--                                </div>--%>
            <%--                            </div>--%>
            <%--                            <div class="tab-pane" id="tabs-3" role="tabpanel">--%>
            <%--                                <div class="product__details__tab__desc">--%>
            <%--                                    <h6>Products Infomation</h6>--%>
            <%--                                    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.--%>
            <%--                                        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.--%>
            <%--                                        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam--%>
            <%--                                        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo--%>
            <%--                                        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.--%>
            <%--                                        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent--%>
            <%--                                        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac--%>
            <%--                                        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante--%>
            <%--                                        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;--%>
            <%--                                        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.--%>
            <%--                                        Proin eget tortor risus.</p>--%>
            <%--                                </div>--%>
            <%--                            </div>--%>
            <%--                        </div>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
        </div>
        <div class="comment">
            <h3>Đánh giá sản phẩm</h3>
            <div class="comment-user mt-4">
                <span class="comment-name mr-3">Xuân Hoa</span>
                <span class="comment-star">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                </span>
                <div class="content-padding"><span class="comment-content">Gạo ngon tuyệt zời ông mặt trời luôn é</span></div>
                <span class="comment-date">12/10/2021</span>
            </div>

            <div class="comment-user mt-4">
                <span class="comment-name mr-3">Xuân Hoa</span>
                <span class="comment-star">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                </span>
                <div class="content-padding"><span class="comment-content">Gạo ngon tuyệt zời ông mặt trời luôn é</span></div>
                <span class="comment-date">12/10/2021</span>
            </div>

            <div class="comment-user mt-4">
                <span class="comment-name mr-3">Xuân Hoa</span>
                <span class="comment-star">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                </span>
                <div class="content-padding"><span class="comment-content">Gạo ngon tuyệt zời ông mặt trời luôn é</span></div>
                <span class="comment-date">12/10/2021</span>
            </div>

            <div class="comment-input mt-4">
                <h3>Phản hồi về sản phẩm</h3>
                <div class="btn-star pt-2">
                    <button style="color: #0b0b0b" >1 <i class="fa fa-star star-color-yellow"></i></button>
                    <button style="color: #0b0b0b">2 <i class="fa fa-star star-color-yellow"></i></button>
                    <button style="color: #0b0b0b" >3 <i class="fa fa-star star-color-yellow"></i></button>
                    <button style="color: #0b0b0b" >4 <i class="fa fa-star star-color-yellow"></i></button>
                    <button style="color: #0b0b0b">5 <i class="fa fa-star star-color-yellow"></i></button>
                </div>
                <textarea style="resize: none; width: 100%; margin-top: 10px;" name="" id="" rows="5"  placeholder="Hãy nhập phản hồi về sản phẩm"></textarea>
                <div class="btn-star pt-2" style="display: flex; justify-content: end">
                    <button class="" style="color: #ffffff; background: #0b0b0b !important;" >Gửi</button>

                </div>
            </div>

        </div>
    </div>
    </div>
    
</section>
<!-- Product Details Section End -->

<!-- Related Product Section Begin -->
<section class="related-product">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title related__product__title">
                    <h2>SẢN PHẨM LIÊN QUAN</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="body_design/img/product/product-1.jpg">
                        <ul class="product__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">Gạo Ngô Khoai Sắn</a></h6>
                        <h5>50.0000đ</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="body_design/img/product/product-2.jpg">
                        <ul class="product__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">Gạo Ngô Khoai Sắn</a></h6>
                        <h5>50.0000đ</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="body_design/img/product/product-3.jpg">
                        <ul class="product__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">Gạo Ngô Khoai Sắn</a></h6>
                        <h5>50.0000đ</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="body_design/img/product/product-7.jpg">
                        <ul class="product__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">Gạo Ngô Khoai Sắn</a></h6>
                        <h5>50.0000đ</h5>
                    </div>
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