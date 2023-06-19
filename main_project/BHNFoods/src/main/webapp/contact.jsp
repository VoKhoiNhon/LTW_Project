<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>BHDFoods| Liên hệ</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">


    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<style>
    .col-md-3 .info span, .col-md-3 .info .fa-check,.instruct h5  {
        color: #82ae46;
        font-weight: 600;
    }
</style>

<body class="goto-here">
<%@ include file="header.jsp" %>

<div class="hero-wrap hero-bread" style="background-image: url('images/background.jpg');">
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="breadcrumbs"><span class="mr-2"><a class="text-dark"
                                                             href="index.html">Liên hệ -</a></span><span
                        class="text-dark">Hướng dẫn</span>
                </p>
                <h1 class="mb-0 bread text-dark">Liên hệ chúng tôi</h1>
            </div>
        </div>
    </div>
</div>


<section class="ftco-section contact-section bg-light">
    <div class="container">
        <div class="row d-flex mb-5 contact-info">
            <div class="w-100"></div>
            <div class="col-md-3 d-flex">
                <div class="info bg-white p-4">
                    <p><span>Chăm sóc và xử lý khiếu nại:<br></span> <a href="">Khách Hàng có thể liên hệ sđt của
                        website.Khi liên hệ, Khách Hàng phải cung cấp sđt Đơn Đặt Hàng. Nhân viên sẽ tiếp nhận và phản
                        hồi lại cho Khách Hàng trong thời gian sớm nhất.</a></p>
                </div>
            </div>
            <div class="col-md-3 d-flex">
                <div class="info bg-white p-4">
                    <p><span> Giới hạn trách nhiệm:</span> <a href="">BHNFoods không chịu trách nhiệm đối với mọi thiệt
                        hại/mất mát/hư hỏng mà Khách Hàng phải chịu sau thời điểm rủi ro được chuyển từ BHNFoods sang
                        Khách Hàng, trừ khi do lỗi của BHNFoods gây ra.</a></p>
                </div>
            </div>
            <div class="col-md-3 d-flex">
                <div class="info bg-white p-4">
                    <p><span>Đổi, trả sản phẩm:<br></span> <a href="mailto:info@yoursite.com">Việc đổi, trả Sản Phẩm
                        được thực hiện khi khách hàng cung cấp đủ hình ảnh video khi kiểm tra hàng là do lỗi bên
                        BHNFoods.</a></p>
                </div>
            </div>
            <div class="col-md-3 d-flex">
                <div class="info bg-white p-4">
                    <p><span>Cam kết:</span> <a href="mailto:info@yoursite.com"><br><i class="fa-solid fa-check"></i> Sản phẩm an toàn<br><i class="fa-solid fa-check"></i> Chất lượng cam
                        kết<br><i class="fa-solid fa-check"></i> Dịch vụ vượt trội <br><i class="fa-solid fa-check"></i> Giao hàng nhanh tốc chiến
                    </a></p>
                </div>
            </div>
        </div>
        <% List<User> list = (List<User>) request.getAttribute("listCtAccount");
            for (User u : list) {

        %>
        <div class="row block-9">
            <div class="col-md-6 order-md-last d-flex">
                <form action="/ContactInUser" method="post" class="bg-white p-5 contact-form">
                    <h3 style="color: #82ae46">Gửi phản hồi cho chúng tôi</h3>
                    <div class="form-group" style="display: none">
                        <input name="iduser" type="text" class="form-control" placeholder="Họ và tên"
                               value="<%=u.getIdUser()%>">
                    </div>
                    <div class="form-group">
                        <input name="nameuser" type="text" class="form-control" placeholder="Họ và tên" value="<%=u.getNameUser()%>">
                    </div>
                    <div class="form-group">
                        <input name="email" type="text" class="form-control" placeholder="Email" value="<%=u.printCtAccount(u.getEmail())%>">
                    </div>
                    <div class="form-group">
                        <input name="phone" type="text" class="form-control" placeholder="Số điện thoại" value="<%=u.printCtAccount(u.getPhone())%>">
                    </div>
                    <div class="form-group">
                        <textarea name="content" id="" cols="30" rows="7" class="form-control"
                                  placeholder="Nội dung"></textarea>
                    </div>
                    <div class="form-group" style="text-align: right">
                        <input type="submit" value="Gửi" class="btn btn-primary py-3 px-5">
                    </div>
                </form>

            </div>

            <div class="col-md-6 d-flex instruct">
                <div>
                    <h5 style="font-size: 18px">1.Phạm vi áp dụng</h5>

                    <span style="font-size: 17px">
                   - Mua sắm sản phẩm bán trên website BHNFoods.<br>

                   - Hàng hóa được áp dụng triển khai BHNFoods là hàng hóa, sản phẩm trong đăng ký kinh doanh của các BHNFoods áp dụng.<br>

                   - Có nhu cầu được giao Sản phẩm đến các địa điểm phù hợp với Chính sách giao hàng đăng tải trên Website.<br></span>
                    <h5 style="font-size: 18px">2. Xác lập và hủy đơn hàng trên BHNFoods</h5>

                    <span style="font-size: 17px">Mọi thông tin về Sản Phẩm đưa ra trên BHNFoods trong bất kỳ trường hợp nào không được hiểu là đề nghị giao kết hợp đồng của Winmart tới Khách Hàng.

                    Khách Hàng đặt hàng trên Website sẽ hình thành một đơn đặt hàng (Đơn Đặt Hàng). BHNFoods gửi xác nhận Đơn đặt hàng thông qua một trong các hình thức sau:<br>

                    - Qua địa chỉ email mà Khách Hàng đã đăng ký với nội dung: danh sách Sản Phẩm, thời hạn giao hàng, điện thoại liên hệ, thông tin người nhận, người đặt hàng, giá trị thanh toán…<br>

                   - Qua việc cập nhật tình trạng đơn hàng trong hệ thống quản lý tài khoản của Khách Hàng trên Website với nội dung Đơn hàng đã được xác nhận, hoặc nội dung có ý nghĩa tương đương.<br>

                    - Gửi mail cho Khách hàng để xác nhận đơn hàng.
                  </span>
                </div>
            </div>
        </div>
        <%}%>
    </div>
</section>
<%@ include file="footer.jsp" %>

<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
    <svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
        <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                stroke="#F96D00"/>
    </svg>
</div>


<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/aos.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="js/google-map.js"></script>
<script src="js/main.js"></script>

</body>
</html>