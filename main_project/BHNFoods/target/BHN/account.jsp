<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>BHDFoods| Tài khoản</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
          rel="stylesheet">

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

<section class="ftco-section" style=" background: #ededed70">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-7 ftco-animate" style="background: white">
                <form action="#" class="billing-form">
                    <h4 class="mb-4 billing-heading">Tài khoản</h4>
                    <div class="row align-items-end" style="font-size: 18px;">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="firstname">Họ và Tên</label>
                                <input type="text" class="form-control" placeholder="Nhập họ tên đầy đủ">
                            </div>
                        </div>
                        <div class="col-md-6 d-flex">
                            <label for="">Giới tính</label>
                            <div class="form-group" style="margin-left: 40px;">
                                <input type="radio" class="form-" placeholder="">
                                <label for="">Nữ</label>
                            </div>
                            <div class="form-group" style="margin-left: 40px;">
                                <input type="radio" class="form-" placeholder="">
                                <label for="">Nam</label>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="country">Ngày sinh</label>
                                <div class="select-wrap">

                                    <input type="date" name="" id="" class="form-control"
                                           placeholder="Ngày/Tháng/Năm">

                                </div>
                            </div>
                        </div>
                        <div class="d-flex flex-grow-1">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="phone">Số điện thoại</label>
                                    <input type="text" class="form-control"
                                           placeholder="Nhập số điện thoại">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="emailaddress">Email</label>
                                    <input type="text" class="form-control"
                                           placeholder="Nhập địa chỉ Email">
                                </div>
                            </div>
                        </div>
                        <div class="d-flex flex-grow-1">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="phone">Tạo mật khẩu mới</label>
                                    <input type="password" class="form-control"
                                           placeholder="Nhập mật khẩu mới">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="emailaddress">Nhập lại mật khẩu</label>
                                    <input type="password" class="form-control"
                                           placeholder="Nhập lại mật khẩu">
                                </div>
                            </div>
                        </div>
                        <div class="w-100"></div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="country">Địa chỉ</label>
                                <div class="select-wrap">

                                    <input name="" id="" class="form-control"
                                           placeholder="">

                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 d-flex" style="justify-content: end;">
                            <p><a href="#" class="btn btn-primary py-3 px-4"
                                  style="border-radius:5px; background: #7fad39; border: none; font-size: 18px;">Cập
                                nhật</a></p>
                        </div>
                    </div>
                </form><!-- END -->
            </div>
        </div>
    </div>
</section>


<!-- Footer Section End -->

<!-- Js Plugins -->

<%@include file="footer.jsp" %>
</body>

</html>