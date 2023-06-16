<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>BHNFoods | Quản lý sản phẩm</title>

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
<style>
    .container .row .form-group .form-control {
        font-size: 16px;
    }

    .ftco-section .col-xl-7 .align-items-end .row_input .col_addprod {
        flex: auto;
        margin-top: 8px;
    }

    .ftco-section .container .input_addpr {
        height: calc(1.5em + .75rem);
    }
</style>

<body

<section class="ftco-section" style=" background: #ededed00">
    <div class="container" style="background-color:  #ededed00">
        <div class="row justify-content-center">
            <div class="col-xl-7 ftco-animate" style="background: #eeeeee">
                <form action="#" class="billing-form" style="margin-top: 5%;">
                    <h4 class="mb-4 billing-heading">Thêm sản phẩm</h4>
                    <div class="row align-items-end" style="font-size: 16px;">
                        <div class="col-md-12 ">
                            <div class="form-group">
                                <label for="">Tên sản phẩm</label>
                                <input type="text" class="form-control input_addpr" placeholder="">
                            </div>
                        </div>

                        <div class="d-flex flex-grow-1  row_input  ">
                            <div class="col-md-6 col_addprod">
                                <div class="form-group">
                                    <label for="">Hình ảnh</label>
                                    <button class="form-control input_addpr" style="background-color: #b5b5b5;">Chọn
                                        tệp
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-6 col_addprod">
                                <div class="form-group">
                                    <label for="">Mã sản phẩm</label>
                                    <input class="form-control input_addpr" placeholder="ID_Product">
                                </div>
                            </div>
                            <div class="col-md-6 col_addprod">
                                <div class="form-group">
                                    <label for="">Danh mục</label>
                                    <select type="text" class="form-control input_addpr">
                                        <option>Gạo</option>
                                        <option>Nếp</option>
                                        <option>Các loại hạt</option>
                                        <option>Các loại bột</option>
                                        <option>Các loại củ, trái</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="d-flex flex-grow-1 row_input ">
                            <div class="col-md-6 col_addprod">
                                <div class="form-group">
                                    <label for="">Giá</label>
                                    <input type="text" class="form-control input_addpr" placeholder="">
                                </div>
                            </div>
                            <div class="col-md-6 col_addprod">
                                <div class="form-group">
                                    <label for="">Khuyến mãi(%)</label>
                                    <input type="text" class="form-control input_addpr" placeholder="">
                                </div>
                            </div>
                        </div>
                        <div class="d-flex flex-grow-1 row_input ">
                            <div class="col-md-6 col_addprod">
                                <div class="form-group">
                                    <label for="">Xuất xứ</label>
                                    <input type="text" class="form-control input_addpr" placeholder="">
                                </div>
                            </div>
                            <div class="col-md-6 col_addprod">
                                <div class="form-group">
                                    <label for="">Thương hiệu</label>
                                    <input type="text" class="form-control input_addpr" placeholder="">
                                </div>
                            </div>
                            <div class="col-md-6 col_addprod">
                                <div class="form-group">
                                    <label for="">Trọng lượng</label>
                                    <input type="text" class="form-control input_addpr" placeholder="">
                                </div>
                            </div>
                        </div>


                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Mô tả</label>
                                <textarea type="text" class="form-control input_addpr"
                                          placeholder="mô tả"> </textarea>
                            </div>
                        </div>

                        <div class="col-md-12 d-flex" style="justify-content: end;">
                            <p><a href="#" class="btn btn-primary py-3 px-4"
                                  style="border-radius:5px; background: #7fad39; border: none;padding: 10px 40px !important;">Hủy</a>
                            </p>
                            <p><a href="#" class="btn btn-primary py-3 px-4"
                                  style="border-radius:5px; background: #7fad39; border: none; padding: 10px !important; margin-left: 20px">Thêm
                                sản phẩm</a>
                            </p>
                        </div>


                    </div>
                </form><!-- END -->
            </div>

        </div>
    </div>
</section>
<!-- Footer Section End -->

</body>

</html>