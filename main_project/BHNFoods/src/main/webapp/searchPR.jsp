<%@ page import="vn.edu.hcmuaf.fit.beans.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.service.CartService" %>
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
                        <select name="sortSearch" class="sort-table" id="sort-tableID">
                            <option class="sort-item" value="0">Tất cả</option>
                            <option class="sort-item" value="1"><a>Giảm Giá</a></option>
                            <option class="sort-item" value="2">Giá thấp đến cao</option>
                            <option class="sort-item" value="3">Giá cao đến thấp</option>
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

        <div id="content" class="row">

            <%
                for (Product p : productList) {
                    int price = p.getPrice();
            %>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="<%=p.getUrl()%>">
                        <%
                            if (p.getDiscount() > 0) {
                                price = p.getPrice() - p.getPrice() * (p.getDiscount()) / 100;
                        %>
                        <div class="discount__percent" style="">-<%=p.getDiscount()%>%</div>
                        <%}%>
                        <ul class="product__item__pic__hover">
                            <%if (LoveProdService.getInstance().checkLiked(idU, p.getIdPr())) {%>
                            <li>
                                <button id="heart<%=p.getIdPr()%>" class="background-button" style="color: white"
                                        onclick="loveInListProd('<%=p.getIdPr()%>', this.id)"><i
                                        class="fa fa-heart"></i></button>
                            </li>
                            <%} else {%>
                            <li>
                                <button id="heart<%=p.getIdPr()%>"
                                        onclick="loveInListProd('<%=p.getIdPr()%>', this.id)"><i
                                        class="fa fa-heart"></i></button>
                            </li>
                            <%}%>
                            <%if (CartService.getInstance().checkExist(idU, p.getIdPr())) {%>
                            <li>
                                <button id="cart<%=p.getIdPr()%>" class="background-button" style="color: white"
                                        onclick="addToCartInListProd('<%=p.getIdPr()%>', this.id)"><i
                                        class="fa fa-shopping-cart"></i></button>
                            </li>
                            <%} else {%>
                            <li>
                                <button id="cart<%=p.getIdPr()%>"
                                        onclick="addToCartInListProd('<%=p.getIdPr()%>', this.id)"><i
                                        class="fa fa-shopping-cart"></i></button>
                            </li>
                            <%}%>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <a href="http://localhost:8080/BHNFoods/oneProduct?id=<%=p.getIdPr()%>&idUser=<%=request.getParameter("idUser")%>"><%=p.getNamePr()%>
                            <br> <span><%=decF.format(price).replace(',', '.')%>đ</span></a>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>

    function loveInListProd(id, idTag) {
        let condition = 0; //0 la detele khoi database, 1 la insert vao database
        if(document.getElementById(idTag).classList.contains('background-button')) {
            $('button#' + idTag).removeClass('background-button');
            $('button#' + idTag).css('color', 'black')
            condition = 0;
        } else {
            $('button#' + idTag).addClass('background-button');
            $('button#' + idTag).css('color', 'white')
            condition = 1;
        }
        $.ajax({
            url: "/BHNFoods/addToLoveProd",
            type: 'get',
            data: {
                id: id,
                condition : condition
            },
            error: function () {
            }
        });
    }
    function addToCartInListProd(id, idTag) {
        $('button#' + idTag).addClass('background-button');
        $('button#' + idTag).css('color', 'white');
        $.ajax({
            url: "/BHNFoods/addToCart",
            type: 'get',
            data: {
                id: id,
                amount: 1
            },
            success: function (data) {
                const content = document.getElementById('totalCart');
                content.innerHTML = data;
            },
            error: function () {
            }
        });
    }

    $('#sort-tableID').change(function () {
        $.ajax({
            url: "/BHNFoods/SortSearchPR",
            type: "get",
            data: {
                sort: $(this).val().trim()
            },
            success: function (data) {
                const content = document.getElementById("content");
                content.innerHTML = data;
            },
            error: function (xhr) {
            }
        })
    })
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