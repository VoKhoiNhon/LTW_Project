<%@ page import="vn.edu.hcmuaf.fit.beans.SingleProduct" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.ImgForSingleProd" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Feedback" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.service.LoveProdService" %>
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
                        <img style="width: 504px; height: 405px" class="product__details__pic__item--large"
                            <%List<SingleProduct> single = (List<SingleProduct>) request.getAttribute("singleProduct");
                             DecimalFormat dec = new DecimalFormat("#,###");
                             int price= single.get(0).getPrice() - single.get(0).getPrice()*single.get(0).getDiscount()/100;
                             %>
                             src="<%=single.get(0).getUrl()%>" alt="">
                    </div>
                    <%
                        List<ImgForSingleProd> listURL = (List<ImgForSingleProd>) request.getAttribute("listURL");
                        List<Feedback> listFeedback = (List<Feedback>) request.getAttribute("listFeedBack");
                    %>
                    <div class="product__details__pic__slider owl-carousel">
                        <%for (ImgForSingleProd s : listURL) {%>
                        <img data-imgbigurl="<%=s.getUrl()%>"
                             src="<%=s.getUrl()%>" alt="">
                        <%}%>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="product__details__text">
                    <h3><%=single.get(0).getNamePr()%>
                    </h3>
                    <div class="product__details__rating">
                        <%
                            if (listFeedback.size() > 0) {
                                double avgScore = 0;
                                for (Feedback f : listFeedback) {
                                    avgScore += f.getScoreStar();
                                }
                                avgScore /= listFeedback.size();
                                for (int i = 0; i < Math.floor(avgScore); i++) {
                        %>
                        <i class="fa fa-star"></i>
                        <%
                            }
                            if (avgScore - (int) avgScore != 0.0) {
                        %>
                        <i class="fa fa-star-half-o"></i>
                        <%}%>
                        <%}%>
                        <span>(<%=listFeedback.size()%> đánh giá)</span>
                    </div>
                    <div class="product__details__price"><%=dec.format(price).replace(',', '.')%>đ
                    </div>
                    <p><%=single.get(0).getDescribe()%>
                    </p>
                    <div class="product__details__quantity">
                        <div class="quantity">
                            <div class="pro-qty">
                                <input id="amountProd" type="text" value="1">
                            </div>
                        </div>
                    </div>
                    <button onclick="addToCart()" style="padding: 15px 28px 12px; height: auto !important; background-color: #82ae46; color: white" class="primary-btn">THÊM VÀO GIỎ HÀNG</button>
                    <%if(LoveProdService.getInstance().checkLiked(idU, request.getParameter("id"))) {%>
                    <button id="heart" onclick="love()" class="heart-icon background-button" style="padding: 12px 17px 12px; height: auto !important;color: white" ><span class="icon_heart_alt"></span></button>
                    <%} else {%>
                    <button id="heart" onclick="love()" class="heart-icon" style="padding: 12px 17px 12px; height: auto !important;color: #82ae46" ><span class="icon_heart_alt"></span></button>
                    <%}%>
<%--                    <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>--%>
                    <ul>
                        <li><b>Xuất xứ</b> <span><%=single.get(0).getOrigin()%></span></li>
                        <li><b>Hạn sử dụng</b> <span><%=single.get(0).getHsd()%></span></li>
                        <li><b>Trọng lượng</b> <span><%=single.get(0).getWeight()%>kg</span></li>
                        <li><b>Giao hàng</b> <span>Trong 2 giờ <span>Miễn phí trong thành phố Thủ Đức</span></span></li>
                    </ul>
                </div>
            </div>
        </div>
        <%if (listFeedback.size() > 0) {%>
        <h3>Đánh giá sản phẩm</h3>
        <%
            }
        %>
        <div id="comment">
            <%
                int size = listFeedback.size() > 3 ? 3 : listFeedback.size();
                for (int i = 0; i < size; i++) {%>
            <div class="comment">
                <div class="comment-user mt-4">
                    <span class="comment-name mr-3"><%=listFeedback.get(i).getNameUser()%></span>
                    <span class="comment-star">
                    <%for (int j = 0; j < listFeedback.get(i).getScoreStar(); j++) {%>
                            <i class="fa fa-star"></i>
                        <%}%>
                    </span>
                    <div class="content-padding">
                        <span class="comment-content"><%=listFeedback.get(i).getText()%></span>
                    </div>
                    <span class="comment-date"><%=listFeedback.get(i).getDate()%></span>
                </div>
            </div>
            <%}%>
        </div>

        <%if(listFeedback.size() > 3) {%>
        <button onclick="loadMoreCommentLeft()"><i class="fa fa-long-arrow-left"></i></button>
        <%
            int count = (int) request.getAttribute("count");
            for (int j = 1; j <= count; j++) {%>
        <button id="btn<%=j%>" class="btn-loadMore" onclick="loadMoreComment(<%=j%>)" style="margin: 10px 4px; color: black;"><%=j%></button>
            <%}%>
        <button onclick="loadMoreCommentRight()"><i class="fa fa-long-arrow-right"></i></button>
        <%}%>
        <div class="comment-input mt-4">
            <%if (listFeedback.size() > 0) {%>
            <h3 class="aboveTextComment">Phản hồi về sản phẩm</h3>
            <%} else {%>
            <h3 class="aboveTextComment">Sản phẩm hiện chưa có phản hồi, bạn nãy nêu cảm nhận của mình</h3>
            <%}%>
            <div  id="abc" class="btn-star pt-2">
                <button value="1" onclick="marking(this.id)" id="oneStar" style="color: #0b0b0b">1 <i class="fa fa-star star-color-yellow"></i></button>
                <button value="2" onclick="marking(this.id)" id="twoStar" style="color: #0b0b0b">2 <i class="fa fa-star star-color-yellow"></i></button>
                <button value="3" onclick="marking(this.id)" id="threeStar" style="color: #0b0b0b">3 <i class="fa fa-star star-color-yellow"></i></button>
                <button value="4" onclick="marking(this.id)" id="fourStar" style="color: #0b0b0b">4 <i class="fa fa-star star-color-yellow"></i></button>
                <button value="5" onclick="marking(this.id)" id="fiveStar" style="color: #0b0b0b">5 <i class="fa fa-star star-color-yellow"></i></button>
            </div>
            <textarea id="textComment" style="resize: none; width: 100%; margin-top: 10px;" name="" id="" rows="5"
                      placeholder="Hãy nhập phản hồi về sản phẩm"></textarea>
            <div class="btn-star pt-2" style="display: flex; justify-content: end">
                <button onclick="sendComment()" id="sendComment" class="" style="color: #ffffff; background: #0b0b0b !important;">Gửi</button>
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
            <%
                List<Product> relatedProducts = (List<Product>) request.getAttribute("relatedProducts");
                int n = relatedProducts.size() >= 4 ? 4 : relatedProducts.size();
                for (int i = 0; i < n; i++) {
            %>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="<%=relatedProducts.get(i).getUrl()%>">
                        <ul class="product__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6>
<<<<<<< Updated upstream
                            <a href="/BHNFoods/oneProduct?id=<%=relatedProducts.get(i).getIdPr()%>"><%=relatedProducts.get(i).getNamePr()%>
=======
                            <a href="/BHNFoods/oneProduct?id=<%=relatedProducts.get(i).getIdPr()%>&idUser=<%=request.getAttribute("idUser")%>"><%=relatedProducts.get(i).getNamePr()%>
>>>>>>> Stashed changes
                            </a></h6>
                        <h5><%=dec.format(relatedProducts.get(i).getPrice())%>đ</h5>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>
<!-- Footer Section End -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
        integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    var current = 1;
    var queryString = window.location.search;
    var urlParams = new URLSearchParams(queryString);
    var idProd = urlParams.get('id');
    var idUser = urlParams.get('idUser');
    var maxCountPage = $('button.btn-loadMore').length;
    $("#btn" + current).addClass('background-button');

    var proQty = $('.pro-qty');
    proQty.prepend('<span onclick="" class="dec qtybtn">-</span>');
    proQty.append('<span class="inc qtybtn">+</span>');
    proQty.on('click', '.qtybtn', function () {
        var $button = $(this);
        var oldValue = $button.parent().find('input').val();
        if ($button.hasClass('inc')) {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            // Don't allow decrementing below one
            if (oldValue > 1) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 1;
            }
        }
        $button.parent().find('input').val(newVal);
    });

    function loadMoreComment(index) {
        $("#btn" + current).removeClass('background-button');
        current = index;
        $("#btn" + current).addClass('background-button');
        $.ajax({
            url: "/BHNFoods/loadMoreComment",
            type: 'get',
            data: {
                id: idProd,
                step: current
            },
            success: function (data) {
                const content = document.getElementById("comment");
                content.innerHTML = data;
            },
            error: function () {
            }
        });
    }

    function loadMoreCommentLeft() {
        $("#btn" + current).removeClass('background-button');
        if (current - 1 >= 1) {
            current -= 1;
        }
        $("#btn" + current).addClass('background-button');
        $.ajax({
            url: "/BHNFoods/loadMoreComment",
            type: 'get',
            data: {
                id: idProd,
                step: current
            },
            success: function (data) {
                const content = document.getElementById("comment");
                content.innerHTML = data;
            },
            error: function () {
            }
        });
    }

    function loadMoreCommentRight() {
        $("#btn" + current).removeClass('background-button');
        if (parseInt(current) + 1 <= maxCountPage) {
            current = parseInt(current) + 1;
        }
        $("#btn" + current).addClass('background-button');
        $.ajax({
            url: "/BHNFoods/loadMoreComment",
            type: 'get',
            data: {
                id: idProd,
                step: current
            },
            success: function (data) {
                const content = document.getElementById("comment");
                content.innerHTML = data;
            },
            error: function () {
            }
        });
    }
    function sendComment() {
        var idU = idUser;
        var idP = idProd;
        if(idU != "null")  {
            if($('button.lightGreenBtn').val() !== undefined && $('textarea#textComment').val() !== "") {
                $.ajax({
                    url: "/BHNFoods/sendComment",
                    type: 'get',
                    data: {
                        text: $('textarea#textComment').val(),
                        idU: idUser,
                        idP: idProd,
                        star: $('button.lightGreenBtn').val()
                    },
                    success: function (data) {
                        if($('div.comment').length >=3) {
                            $('div.comment:last-child').remove();
                        }
                        $('button.lightGreenBtn').removeClass('lightGreenBtn');
                        $("div#comment").prepend(data);
                        $("textarea#textComment").val("");
                        $('h3.aboveTextComment').remove();
                        $('div.comment-input').prepend("<h3 class=\"aboveTextComment\">Phản hồi về sản phẩm</h3>");

                    },
                    error: function () {
                    }
                });
            } else alert("Hãy đánh giá số sao và nhập phản hồi trước khi gửi nhé!");
        } else alert("Hãy đăng nhập trước khi bình luận nhé");
    }
    function marking(id) {
        $('button.lightGreenBtn').removeClass('lightGreenBtn');
        $('button#' + id).addClass('lightGreenBtn');
    }
    function addToCart() {
        $.ajax({
            url: "/BHNFoods/addToCart",
            type: 'get',
            data: {
                id: idProd,
                amount: $('input#amountProd').val()
            },
            success: function (data) {
                const content = document.getElementById('totalCart');
                content.innerHTML = data;
            },
            error: function () {
            }
        });
    }
    function love() {
        let condition = 0; //0 la detele khoi database, 1 la insert vao database
        if(document.getElementById('heart').classList.contains('background-button')) {
            $('#heart').removeClass('background-button');
            $('#heart').css('color', '#82ae46')
            condition = 0;
        } else {
            $('#heart').addClass('background-button');
            $('#heart').css('color', 'white')
            condition = 1;
        }
        $.ajax({
            url: "/BHNFoods/addToLoveProd",
            type: 'get',
            data: {
                id: idProd,
                condition : condition
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