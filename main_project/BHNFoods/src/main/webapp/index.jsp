<%@ page import="vn.edu.hcmuaf.fit.beans.Product" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>BHNFoods | Trang chủ</title>
</head>

<body>



<%@ include file="header.jsp" %>

<%boolean hasACart = request.getAttribute("hasACart") == null ? false : (boolean) request.getAttribute("hasACart");
    boolean hasAListLove = request.getAttribute("hasACart") == null ? false : (boolean) request.getAttribute("hasAListLove");


    if(hasACart) {
        if(listProductFromCartInSession.size() > 0) {%>
<div class="over_play" style="position: fixed; width: 100%; height: 100%; background: black; opacity: 0.3; z-index: 99"></div>
<div id="cart_session" class="container" style="position: fixed;background: white; z-index: 100;width: auto;top: 50%;left: 50%;transform:  translate(-50%, -50%);display: inline-block;border: 3px black solid;border-radius: 10px;margin:2rem auto;">

    <form class="form_content" style="margin: 1rem;" >
        <p>Tìm thấy <span><%=listProductFromCartInSession.size()%></span> sản phẩm trong giỏ hàng:</p>
        <ul>
            <%
                for (String idProduct: listProductFromCartInSession.keySet()) {
                    Product p = ProductService.getInstance().getProductById(idProduct);
                %>
                    <li style="display: flex; list-style-type: none; margin: 1rem 0; align-items: center;">
                    <div class="size_img">
                    <img src="<%=p.getUrl()%>" style="margin-right: 20px;width: 70px;height: auto;">
                </div>
                <div>
                    <p><%=p.getNamePr()%></p>
                </div>
            </li>
                <%}%>
        </ul>
        <div class="item_final" style="display: flex; align-items: center;">
            <p style="margin: 0; padding: 0">Bạn muốn thêm vào tài khoản này không?</p>
                <button onclick="removeCartFromSession()" class="btn" style="padding: 0; background: #7fad39;border: none;margin: 4px;height: 24px;width: 4rem;color: white;">Đéo</button>
                <button onclick="addCartFromSessionToUser()" class="btn" style="padding: 0; background: #7fad39;border: none;margin: 4px;height: 24px;width: 4rem;color: white;">Coá</button>
        </div>
    </form>
</div>
<%}
}%>

<section class="ftco-section img"
         style="background-image: url(images/anhbackgr1.png); border-bottom:1px solid #82ae46; border-top: 1px solid #82ae46; ">
    <div class="container">
        <div class="col-md-6 heading-section ftco-animate deal-of-the-day ftco-animate " style="margin-left:auto">
            <span class="subheading">Giá Tốt Cho Bạn</span>
            <h2 class="mb-4">Ưu đãi trong ngày</h2>
            <p>Luôn mang những sản phẩm chất lượng nhất đến tay khách hàng</p>
            <h3><a href="#">Các loại đậu</a></h3>
            <span class="price">30.000đ <a href="#">chỉ còn 15.000đ</a></span>
            <div id="timer" class="d-flex mt-5">
                <div class="time" id="days"></div>
                <div class="time pl-3" id="hours"></div>
                <div class="time pl-3" id="minutes"></div>
                <div class="time pl-3" id="seconds"></div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section">
    <div class="container">
        <div class="row no-gutters ftco-services">
            <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services mb-md-0 mb-4">
                    <div class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
                        <span class="flaticon-shipped"></span>
                    </div>
                    <div class="media-body">
                        <h3 class="heading">Miễn phí vận chuyển</h3>
                        <span>Trong 1.5km</span>
                    </div>
                </div>
            </div>
            <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate ">
                <div class="media block-6 services mb-md-0 mb-4">
                    <div class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
                        <span class="flaticon-diet"></span>
                    </div>
                    <div class="media-body">
                        <h3 class="heading">Luôn tươi</h3>
                        <span>Đóng gói cẩn thận</span>
                    </div>
                </div>
            </div>
            <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services mb-md-0 mb-4">
                    <div class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
                        <span class="flaticon-award"></span>
                    </div>
                    <div class="media-body">
                        <h3 class="heading">Chất lượng cao</h3>
                        <span>Sản phẩm chất lượng</span>
                    </div>
                </div>
            </div>
            <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services mb-md-0 mb-4">
                    <div class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
                        <span class="flaticon-customer-service"></span>
                    </div>
                    <div class="media-body">
                        <h3 class="heading">Hỗ trợ</h3>
                        <span>Hỗ trợ 24/7</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section ftco-category ftco-no-pt">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="row">
                    <div class="col-md-6 order-md-last align-items-stretch d-flex">
                        <div class="category-wrap-2 ftco-animate img align-self-stretch d-flex"
                             style="background-image: url(ImageproductNew/background/mid2.png);">
                            <div class="text text-center">
                                <h2>Lương thực</h2>
                                <p>Bảo vệ sức khoẻ của cả gia đình bạn</p>
                                <p><a href="ListProduct" class="btn btn-primary">Mua ngay</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="category-wrap ftco-animate img mb-4 d-flex align-items-end"
                             style="background-image: url(ImageproductNew/background/gao.jpg);">
                            <div class="text px-3 py-1">
                                <h2 class="mb-0"><a href="ListProduct">Gạo</a></h2>
                            </div>
                        </div>
                        <div class="category-wrap ftco-animate img d-flex align-items-end"
                             style="background-image: url(ImageproductNew/background/hat.jpg);">
                            <div class="text px-3 py-1">
                                <h2 class="mb-0"><a href="ListProduct">Hạt</a></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="category-wrap ftco-animate img mb-4 d-flex align-items-end"
                     style="background-image: url(ImageproductNew/background/khoaiTay.jpg);">
                    <div class="text px-3 py-1">
                        <h2 class="mb-0"><a href="ListProduct">Củ</a></h2>
                    </div>
                </div>
                <div class="category-wrap ftco-animate img d-flex align-items-end"
                     style="background-image: url(ImageproductNew/background/Bot.webp);">
                    <div class="text px-3 py-1">
                        <h2 class="mb-0"><a href="ListProduct">Bột</a></h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center mb-3 pb-3">
            <div class="col-md-12 heading-section text-center ftco-animate">
                <span class="subheading">Sản phẩm nổi bật</span>
                <h2 class="mb-4">Sản phẩm của chúng tôi</h2>
                <p>Luôn mang những sản phẩm chất lượng nhất đến tay khách hàng</p>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-lg-3 ftco-animate">
                <div class="product">
                    <a href="#" class="img-prod"><img class="img-fluid"
                                                      src="ImageproductNew/Bot/Bot-bap-meizan/bot-bap-meizan1.jpg"
                                                      alt="Colorlib Template">
                        <span class="status">30%</span>
                        <div class="overlay"></div>
                    </a>
                    <div class="text py-3 pb-4 px-3 text-center">
                        <h3><a href="#">Bột bắp Meizan 150g</a></h3>
                        <div class="d-flex">
                            <div class="pricing">
                                <p class="price"><span class="mr-2 price-dc">12000đ</span><span
                                        class="price-sale">8000đ</span></p>
                            </div>
                        </div>
                        <div class="bottom-area d-flex px-3">
                            <div class="m-auto d-flex">
                                <a href="#"
                                   class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                    <span><i class="fa fa-heart"></i></span>
                                </a>
                                <a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                    <span><i class="fa fa-retweet"></i></span>
                                </a>
                                <a href="#" class="heart d-flex justify-content-center align-items-center ">
                                    <span><i class="fa fa-shopping-cart"></i></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 ftco-animate">
                <div class="product">
                    <a href="#" class="img-prod"><img class="img-fluid"
                                                      src="ImageproductNew/Dau/bap-hat-dong-lanh-mama-food-goi-250g-202205171021267119_300x300.png"
                                                      alt="Colorlib Template">
                        <div class="overlay"></div>
                    </a>
                    <div class="text py-3 pb-4 px-3 text-center">
                        <h3><a href="#">Bắp hạt đông lạnh MamaFood 250g</a></h3>
                        <div class="d-flex">
                            <div class="pricing">
                                <p class="price"><span>20000đ</span></p>
                            </div>
                        </div>
                        <div class="bottom-area d-flex px-3">
                            <div class="m-auto d-flex">
                                <a href="#"
                                   class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                    <span><i class="fa fa-heart"></i></span>
                                </a>
                                <a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                    <span><i class="fa fa-retweet"></i></span>
                                </a>
                                <a href="#" class="heart d-flex justify-content-center align-items-center ">
                                    <span><i class="fa fa-shopping-cart"></i></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 ftco-animate">
                <div class="product">
                    <a href="#" class="img-prod"><img class="img-fluid"
                                                      src="ImageproductNew/Khoai/bap-my/bap-my-sieu-ngot-coop-300x300.jpg"
                                                      alt="Colorlib Template">
                        <div class="overlay"></div>
                    </a>
                    <div class="text py-3 pb-4 px-3 text-center">
                        <h3><a href="#">2 trái bắp Mỹ(từ 600g)</a></h3>
                        <div class="d-flex">
                            <div class="pricing">
                                <p class="price"><span>15000đ</span></p>
                            </div>
                        </div>
                        <div class="bottom-area d-flex px-3">
                            <div class="m-auto d-flex">
                                <a href="#"
                                   class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                    <span><i class="fa fa-heart"></i></span>
                                </a>
                                <a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                    <span><i class="fa fa-retweet"></i></span>
                                </a>
                                <a href="#" class="heart d-flex justify-content-center align-items-center ">
                                    <span><i class="fa fa-shopping-cart"></i></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 ftco-animate">
                <div class="product">
                    <a href="#" class="img-prod"><img class="img-fluid"
                                                      src="ImageproductNew/Nep/nep-bac-viet-san-tui-1kg-202103040810147166_300x300.jpg"
                                                      alt="Colorlib Template">
                        <div class="overlay"></div>
                    </a>
                    <div class="text py-3 pb-4 px-3 text-center">
                        <h3><a href="#">Nếp Bắc Viêt San 1kg</a></h3>
                        <div class="d-flex">
                            <div class="pricing">
                                <p class="price"><span>30000đ</span></p>
                            </div>
                        </div>
                        <div class="bottom-area d-flex px-3">
                            <div class="m-auto d-flex">
                                <a href="#"
                                   class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                    <span><i class="fa fa-heart"></i></span>
                                </a>
                                <a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                    <span><i class="fa fa-retweet"></i></span>
                                </a>
                                <a href="#" class="heart d-flex justify-content-center align-items-center ">
                                    <span><i class="fa fa-shopping-cart"></i></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<%--</footer>--%>
<%@ include file="footer.jsp" %>
<!-- Footer Section End -->

<!-- Js Plugins -->


</body>
<script>
    const userAgent = navigator.userAgent;
    let browserName;
    if (userAgent.indexOf("Firefox") > -1) {
        browserName = "Mozilla Firefox";
    } else if (userAgent.indexOf("Edg") > -1 || userAgent.indexOf("Edge") > -1) {
        browserName = "Microsoft Edge";
    } else if (userAgent.indexOf("OPR") > -1 || userAgent.indexOf("Opera") > -1) {
        browserName = "Opera";
    } else if (userAgent.indexOf("Chrome") > -1 && userAgent.indexOf("Edg") === -1) {
        browserName = "Google Chrome";
    } else if (userAgent.indexOf("Safari") > -1 && userAgent.indexOf("Chrome") === -1) {
        browserName = "Apple Safari";
    } else {
        browserName = "unknown";
    }
    console.log(`Browser name: ${browserName}`);

    <%if(hasAListLove && !hasACart) {
        if(loveProductInSession!= null) {
            if(loveProductInSession.size() > 0) {%>
                showLoveInSession();
            <%}
        }
    }%>

    function removeCartFromSession() {
        $('#cart_session').remove();
        $('.over_play').remove();
        $.ajax({
            url: "/BHNFoods/removeCartFromSession",
            type: 'get',
            error: function () {
            }
        });
    }

    function addCartFromSessionToUser() {
        <%if(listProductFromCartInSession != null) {
            if(listProductFromCartInSession.size() > 0) {%>
            <%for (int i = 0; i < listProductFromCartInSession.keySet().toArray().length; i++) {%>
                 $.ajax({
                    url: "/BHNFoods/addToCart",
                    type: 'get',
                    data: {
                    id: '<%=listProductFromCartInSession.keySet().toArray()[i]%>',
                    amount: '<%=listProductFromCartInSession.get(listProductFromCartInSession.keySet().toArray()[i])%>'
                },
                success: function (data) {
                     const content = document.getElementById('totalCart');
                    content.innerHTML = data;
                    <%if(i == listProductFromCartInSession.keySet().toArray().length - 1) {%>
                    $.ajax({
                        url: "/BHNFoods/removeCartFromSession",
                        type: 'get',
                        error: function () {
                        }
                    });
                    <%}%>
                },
                error: function () {
                }
            });
            <%}%>
        <%}
        }%>


        <%if(hasAListLove) {%>
           showLoveInSession()
        <%}%>
        $('.over_play').remove();
        $('#cart_session').remove();


    }
    function showLoveInSession() {
        <%if(loveProductInSession != null) {
            if(loveProductInSession.size() > 0) {%>
                var content = '';
                <%for(String idProduct: loveProductInSession) {
                Product p = ProductService.getInstance().getProductById(idProduct);%>
                 content += '<li style="display: flex; list-style-type: none; margin: 1rem 0; align-items: center;">' +
                            '<div class="size_img">' +
                            '<img src="<%=p.getUrl()%>" style="margin-right: 20px;width: 70px;height: auto;">' +
                            '</div>' +
                            '<div>' +
                            '<p><%=p.getNamePr()%></p>' +
                            '</div>' +
                            '</li>'
                <%}%>
        $('body').prepend('<div class="over_play" style="position: fixed; width: 100%; height: 100%; background: black; opacity: 0.3; z-index: 99">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</div>' +
            '<div id=\"love_session\" class=\"container\" style=\"position: fixed;background: white; z-index: 100;width: auto;top: 50%;left: 50%;transform:  translate(-50%, -50%);display: inline-block;border: 3px black solid;border-radius: 10px;margin:2rem auto;\">' +
        '\n'+
        '    <form class=\"form_content\" style=\"margin: 1rem;\" >\n'+
        '        <p>Tìm thấy <span><%=loveProductInSession.size()%></span> sản phẩm trong sách yêu thích:</p>\n' +
        '       <ul>\n' +
                    content +
        '        </ul>\n' +
        '        <div class=\"item_final\" style=\"display: flex; align-items: center;\">\n' +
        '            <p style=\"margin: 0; padding: 0\">Bạn muốn thêm vào tài khoản này không?</p>\n' +
        '                <button onclick=\"removeLoveFromSession()\" class=\"btn\" style=\"padding: 0; background: #7fad39;border: none;margin: 4px;height: 24px;width: 4rem;color: white;\">Đéo</button>\n' +
        '                <button onclick=\"addLoveFromSessionToUser()\" class=\"btn\" style=\"padding: 0; background: #7fad39;border: none;margin: 4px;height: 24px;width: 4rem;color: white;\">Coá</button>\n' +
        '       </div>\n' +
        '    </form>\n')
            <%}
        }%>
    }
    function removeLoveFromSession() {
        $('#love_session').remove();
        $('.over_play').remove();
        $.ajax({
            url: "/BHNFoods/removeLoveFromSession",
            type: 'get',
            error: function () {
            }
        });
    }

    function addLoveFromSessionToUser() {
        <%if(loveProductInSession != null) {
            if(loveProductInSession.size() > 0) {%>
        <%for (int i = 0; i < loveProductInSession.size(); i++) {%>
        $.ajax({
            url: "/BHNFoods/addToLoveProd",
            type: 'get',
            data: {
                id: '<%=loveProductInSession.get(i)%>',
            },
            success: function (data) {
                <%if(i == loveProductInSession.size() - 1) {%>
                $.ajax({
                    url: "/BHNFoods/removeLoveFromSession",
                    type: 'get',
                    error: function () {
                    }
                });
                <%}%>
            },
            error: function () {
            }
        });
        <%}%>
        <%}
        }%>

        $('.over_play').remove();
        $('#love_session').remove();

    }
</script>
</html>
