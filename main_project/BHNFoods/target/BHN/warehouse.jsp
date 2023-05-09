<%@ page import="java.text.DecimalFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.SingleProduct" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.User" %>
<%@ page import="org.w3c.dom.ls.LSOutput" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>BHNFoods Admin </title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="admin_template/vendors/feather/feather.css">
    <link rel="stylesheet" href="admin_template/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="admin_template/vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="admin_template/vendors/typicons/typicons.css">
    <link rel="stylesheet" href="admin_template/vendors/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="admin_template/vendors/css/vendor.bundle.base.css">

    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="vendors/datatables.net-bs4/dataTables.bootstrap4.css">
    <link rel="stylesheet" href="admin_template/js/select.dataTables.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="admin_template/css/vertical-layout-light/style.css">

    <!-- endinject -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <style>
        .card-body a .btn_add_delete {
            width: 60px;
            height: 30px;
            border: none;
            color: #1f1f1fbf;
            font-weight: 600 !important;
            border-radius: 5px;

        }

        .row .form-group .form-control {
            font-size: 13px;
        }

        .align-items-end .row_input .col_addprod {
            flex: auto;
            margin-top: 8px;
            position: relative;
            width: 100%;
            padding-right: 15px;
            padding-left: 15px;
        }


        .edit_formUser .input_addpr {
            height: calc(1.5em + .75rem);
        }

        .edit_formUser .col-xl-7 .row .col-md-12 .edit_img {
            /*width: 80%;*/
            height: 60px;
            border: gray;
            border-style: dashed;
            margin: 0 20px;
            padding: 0;

        }

        .edit_formUser .col-xl-7 .row .col-md-12 .edit_img .btnX_img {
            padding: 0 4px;

        }

        .number_pr {
            border-radius: 10%;
            border: 0.1px solid gray;
            padding: 2px 9px;
        }


        .edit_formUser {
            height: 500%;
            width: 100%;
            background: rgba(0, 0, 0, 0.73);
            position: absolute;
            z-index: 1500;
            top: 0;
        }

        .form_add_sp {
            display: none;
        }

        .add_warehouse {
            display: none;
        }

        .xem_chi_tiet {
            display: none;
        }

        .with_50 {
            width: 50%;
        }


        .edit_formUser .cen-div {
            margin: auto;
            background: #f1f1f1;
            width: 50%;
            margin-top: 2%;
            border-radius: 5px;
        }

        .form_add_sp .cen-div {
            margin: auto;
            background: #f1f1f1;
            width: 80%;
            margin-top: 2%;
            border-radius: 5px;
        }

        .edit_formUser .cen-div form .form-group {
            margin-bottom: 1.1rem;
        }

        .edit_formUser .cen-div form .form-group label {
            font-size: 15px;
            display: inline;
        }

        .btn_huy_update {
            margin-bottom: 20px;
            justify-content: end;
        }

        .btn_huy_update input {
            border-radius: 5px;
            background: #7fad39;
            border: none;
            padding: 8px 20px;
            color: white;
        }

        .btn_huy_update input:last-child {
            margin-left: 20px;
        }

        .edit_formUser textarea {
            min-height: 6rem;
        }

        .btn_edit button {
            border: none;
            border-radius: 5px;
            padding: 5px 10px;
        }

        .card {
            width: 400px;
            height: auto;
            padding: 15px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
            border-radius: 5px;
            overflow: hidden;
            background: #fafbff;
        }

        .card .top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
        }

        .card p {
            font-size: 0.9rem;
            font-weight: 600;
            color: #878a9a;
        }

        .card button:hover {
            opacity: 0.8;
        }

        .card button:active {
            transform: translateY(5px);
        }

        .card .drag-area {
            width: 100%;
            height: 160px;
            border-radius: 5px;
            border: 2px dashed #d5d5e1;
            color: #c8c9dd;
            font-size: 0.9rem;
            font-weight: 500;
            position: relative;
            background: #dfe3f259;
            display: flex;
            justify-content: center;
            align-items: center;
            user-select: none;
            -webkit-user-select: none;
            margin-top: 10px;
        }

        .card .drag-area .visible {
            font-size: 18px;
        }

        .card .select {
            color: #5256ad;
            margin-left: 5px;
            cursor: pointer;
            transition: 0.4s;
        }

        .card .select:hover {
            opacity: 0.6;
        }

        .contai {
            width: 100%;
            height: auto;
            display: flex;
            justify-content: flex-start;
            align-items: flex-start;
            flex-wrap: wrap;
            max-height: 200px;
            overflow-y: auto;
            margin-top: 10px;
        }

        .contai .image {
            width: auto;
            margin-right: 15px;
            height: 75px;
            position: relative;
            margin-bottom: 8px;
        }


        .contai .image span {
            position: absolute;
            top: -2px;
            font-size: 20px;
            cursor: pointer;
        }

        /* dragover class will used in drag and drop system */
        .card .drag-area.dragover {
            background: rgba(0, 0, 0, 0.4);
        }

        .card .drag-area.dragover .on-drop {
            display: inline;
            font-size: 28px;
        }

        .card input,
        .card .drag-area .on-drop,
        .card .drag-area.dragover .visible {
            display: none;
        }
    </style>
</head>

<body>
<nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row">
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
        <div>
            <a class="navbar-brand brand-logo" href="index.html">
                BHNFoods
            </a>
        </div>
    </div>
    <div class="navbar-menu-wrapper d-flex align-items-top colorheader ">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item dropdown d-none d-lg-block">
                <a class="nav-link dropdown-bordered dropdown-toggle dropdown-toggle-split" id="messageDropdown"
                   href="#"
                   data-bs-toggle="dropdown" aria-expanded="false"> Lọc theo </a>
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0"
                     aria-labelledby="messageDropdown">
                    <!-- <a class="dropdown-item py-3">
                      <p class="mb-0 font-weight-medium float-left">Lọc</p>
                    </a> -->
                    <div class="dropdown-divider"></div>
                    <a href="http://localhost:8080/BHNFoods/AdminManagePr?kind=0&page=1 "
                       class="dropdown-item preview-item">
                        <div class="preview-item-content flex-grow py-2">
                            <p class="preview-subject ellipsis font-weight-medium text-dark">Tất cả </p>
                        </div>
                    </a>
                    <a href="http://localhost:8080/BHNFoods/AdminManagePr?kind=1&page=1"
                       class="dropdown-item preview-item">
                        <div class="preview-item-content flex-grow py-2">
                            <p class="preview-subject ellipsis font-weight-medium text-dark">Gạo</p>
                        </div>
                    </a>
                    <a href="http://localhost:8080/BHNFoods/AdminManagePr?kind=2&page=1 "
                       class="dropdown-item preview-item">
                        <div class="preview-item-content flex-grow py-2">
                            <p class="preview-subject ellipsis font-weight-medium text-dark">Nếp </p>
                        </div>
                    </a>
                    <a href="http://localhost:8080/BHNFoods/AdminManagePr?kind=3&page=1"
                       class="dropdown-item preview-item">
                        <div class="preview-item-content flex-grow py-2">
                            <p class="preview-subject ellipsis font-weight-medium text-dark">Các loại hạt </p>
                        </div>
                    </a>
                    <a href="http://localhost:8080/BHNFoods/AdminManagePr?kind=4&page=1"
                       class="dropdown-item preview-item">
                        <div class="preview-item-content flex-grow py-2">
                            <p class="preview-subject ellipsis font-weight-medium text-dark">Các loại bột </p>

                        </div>
                    </a>
                    <a href="http://localhost:8080/BHNFoods/AdminManagePr?kind=5&page=1 "
                       class="dropdown-item preview-item">
                        <div class="preview-item-content flex-grow py-2">
                            <p class="preview-subject ellipsis font-weight-medium text-dark">Các loại củ, trái </p>
                        </div>
                    </a>

                </div>
            </li>
            <li class="nav-item d-none d-lg-block">
                <div id="datepicker-popup" class="input-group date datepicker navbar-date-picker">
            <span class="input-group-addon input-group-prepend border-right">
              <span class="icon-calendar input-group-text calendar-icon"></span>
            </span>
                    <input type="text" class="form-control">
                </div>
            </li>
            <li class="nav-item">
                <form class="search-form" action="/BHNFoods/SearchAdmin" method="post">
                    <i class="icon-search"></i>
                    <input type="search" class="form-control" placeholder="Search Here" name="searchAD"
                           title="Search here">
                </form>
            </li>

        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button"
                data-bs-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
        </button>
    </div>
</nav>
<!-- partial -->
<div class="container-fluid page-body-wrapper">
    <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <div class="nav-item">
            <a href="/BHNFoods/ListOrdersAdmin" class="nav-item-link">
                <i style="margin-right: 5px;" class="fa-solid fa-arrow-down-wide-short"></i>
                <span>Quản lý đơn hàng</span>
            </a>
        </div>
        <div class="nav-item">
            <a href="/BHNFoods/HistoryOrdersAdmin" class="nav-item-link">
                <i style="margin-right: 5px;" class="fa-solid fa-arrow-down-wide-short"></i>
                <span>Lịch sử đơn hàng</span>
            </a>
        </div>
        <div class="nav-item">
            <a href="/BHNFoods/AdminManagePr?kind=0&page=1" class="nav-item-link">
                <i style="margin-right: 5px;" class="menu-icon mdi mdi-view-module"></i>
                <span>Quản lý sản phẩm</span>
            </a>
        </div>
        <div class="nav-item">
            <a href="" class="nav-item-link">
                <i style="margin-right: 5px;" class="fa-solid fa-arrow-down-wide-short"></i>
                <span>Nhập kho</span>
            </a>
        </div>

        <div class="nav-item">
            <a href="/BHNFoods/Login" class="nav-item-link">
                <i style="margin-right: 5px;" class="fa-solid fa-arrow-right-from-bracket"></i>
                <span>Đăng xuất</span>
            </a>
        </div>
    </nav>
    <!-- partial -->
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <div class="home-tab">
                        <div class="d-sm-flex align-items-center justify-content-between border-bottom">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active ps-0" id="home-tab" data-bs-toggle="tab" href="#overview"
                                       role="tab"
                                       aria-controls="overview" aria-selected="true">Tổng quan</a>
                                </li>

                            </ul>
                            <div>
                            </div>
                        </div>
                        <div class="tab-content tab-content-basic">
                            <div class="tab-pane fade show active" id="overview" role="tabpanel"
                                 aria-labelledby="overview">
                                <div class="row">
                                    <div class="col-lg-8 d-flex flex-column">
                                        <div class="row flex-grow">
                                            <div class="col-12 grid-margin stretch-card">
                                                <div class="card card-rounded">
                                                    <div class="card-body">
                                                        <div class="d-sm-flex justify-content-between align-items-start">
                                                            <div>
                                                                <a href="#" STYLE="text-decoration: none">
                                                                    <button onclick="add()"
                                                                            class="card-title card-title-dash btn_add_delete">
                                                                        Thêm
                                                                    </button>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive  mt-1">
                                                            <table class="table select-table">
                                                                <thead>
                                                                <tr>
                                                                    <th>Mã lô hàng</th>
                                                                    <th>Ngày nhập lô</th>
                                                                    <th>Số lượng sản phẩm</th>
                                                                    <th>Nhân viên nhập</th>
                                                                    <th>Tổng giá lô</th>
                                                                    <th></th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <div class="d-flex ">
                                                                            <div>
                                                                                <h6>MÃ lô</h6>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <h6>ngày nhập lô
                                                                        </h6>
                                                                    </td>
                                                                    <td>
                                                                        <div>
                                                                            <div class="d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap">
                                                                                <p>giá lượng mặt hàng
                                                                                </p>
                                                                            </div>
                                                                            <div class="progress progress-md">
                                                                                <div class="progress-bar bg-success"
                                                                                     role="progressbar"
                                                                                     style="width: 100px"

                                                                                     aria-valuemin="0"
                                                                                     aria-valuemax="100"></div>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div class="">Nguyễn Văn A
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div class="">13.000.000
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div class="btn_edit">
                                                                            <button onclick="details()">
                                                                                <h4 class="card-title card-title-dash">
                                                                                    Xem chi tiết <i
                                                                                        class="fa-regular fa-pen-to-square"></i>
                                                                                </h4></button>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--form thêm lô hàng--%>
<div class="edit_formUser edit_formAdd add_warehouse">
    <div class="container" style="background:none;">
        <div class="col-xl-7 ftco-animate cen-div  row ftco-section justify-content-center">
            <form class="billing-form" style="margin-top: 5%;" action="" method="post"
                  enctype="multipart/form-data">
                <div class="contai"></div>
                <h4 class="mb-4 billing-heading">Nhập Lô hàng</h4>
                <div class="row align-items-end" style="font-size: 16px;">
                    <div class="d-flex flex-grow-1 row_input ">
                        <div class="col-md-6 col_addprod">
                            <div class="form-group">
                                <label>Mã Lô Hàng</label>
                                <input name="" type="text" class="form-control input_addpr" placeholder=""
                                       value="">
                            </div>
                        </div>
                        <div class=" col-md-6 col_addprod">
                            <div class="form-group">
                                <label>Nhân viên nhận hàng</label>
                                <input type="text" class="form-control input_addpr" name="" placeholder="" value="">
                            </div>
                        </div>
                        <div class=" col-md-6 col_addprod">
                            <div class="form-group">
                                <label>Nhà cung cấp</label>
                                <input type="text" class="form-control input_addpr" name="" placeholder="" value="">
                            </div>
                        </div>
                    </div>
                    <div class=" d-flex flex-grow-1 row_input">
                        <div class=" d-flex flex-grow-1 row_input">
                            <div class="col-md-6 col_addprod">
                                <div class="form-group">
                                    <label>Tổng tiền lô hàng</label>
                                    <input name="" type="text" class="form-control input_addpr" placeholder="" value="">
                                </div>
                            </div>
                            <div class=" col-md-6 col_addprod">
                                <div class="form-group">
                                    <label>Ngày nhập hàng</label>
                                    <input name="" type="date" class="form-control input_addpr" placeholder="" value="">
                                </div>
                            </div>
                            <div class=" col-md-6 col_addprod">
                                <div class="form-group">
                                    <label>Số lượng mặt hàng</label>
                                    <input name="" type="text" class="form-control input_addpr" placeholder="" value="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 d-flex btn_huy_update" style="justify-content: end;">
                        <input type="button" onclick="huy()" value="Hủy">
                        <input onclick="next()" type="button" value="Tiếp =>">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
x
<%--// form thêm sp trong lô--%>
<div class="edit_formUser edit_formAdd form_add_sp">
    <div class="container" style="background:none;">
        <div class="col-xl-7 ftco-animate cen-div  row ftco-section justify-content-center">
            <form class="billing-form" style="margin-top: 5%;" action="" method="post"
                  enctype="multipart/form-data">
                <div class="contai"></div>
                <h4 class="mb-4 billing-heading">Sản phẩm</h4>
                <div class="row align-items-end" style="font-size: 16px;">
                    <div class=" d-flex flex-grow-1 row_input">
                        <div class="" style=" margin-top: 2rem">
                            <div class="">
                                <input class="number_pr" type="button" onclick="" value="1">
                            </div>
                        </div>

                        <div class="col-md-6 col_addprod">
                            <div class="form-group">
                                <label>Tên sản phẩm</label>
                                <input name="" type="text" class="form-control input_addpr" placeholder=""
                                       value="">
                            </div>
                        </div>
                        <div class="col-md-6 col_addprod">
                            <div class="form-group">
                                <label>Danh mục</label>
                                <select type="text" class="form-control input_addpr" name=""> required
                                    <option value="m1">Gạo</option>
                                    <option value="m2">Nếp</option>
                                    <option value="m3">Các loại hạt</option>
                                    <option value="m4">Các loại bột</option>
                                    <option value="m5">Các loại củ, trái</option>
                                </select>
                            </div>
                        </div>
                        <div class=" col-md-6 col_addprod">
                            <div class="form-group">
                                <label>Giá nhập</label>
                                <input name="" type="number" class="form-control input_addpr" placeholder=""
                                       value="">
                            </div>
                        </div>
                        <div class=" col-md-6 col_addprod">
                            <div class="form-group">
                                <label>Số lượng</label>
                                <input name="weight" type="text" class="form-control input_addpr with_50"
                                       placeholder=""
                                       value="">
                            </div>
                        </div>
                        <div class=" col-md-6 col_addprod">
                            <div class="form-group">
                                <label>Trọng lượng</label>
                                <input name="weight" type="text" class="form-control input_addpr with_50"
                                       placeholder=""
                                       value="">
                            </div>
                        </div>
                    </div>
<%--                    djhfsjdf--%>
                    <div class=" d-flex flex-grow-1 row_input">
                        <div class="" style=" margin-top: 2rem">
                            <div class="">
                                <input class="number_pr" type="button" onclick="" value="2">
                            </div>
                        </div>

                        <div class="col-md-6 col_addprod">
                            <div class="form-group">
                                <label>Tên sản phẩm</label>
                                <input name="" type="text" class="form-control input_addpr" placeholder=""
                                       value="">
                            </div>
                        </div>
                        <div class="col-md-6 col_addprod">
                            <div class="form-group">
                                <label>Danh mục</label>
                                <select type="text" class="form-control input_addpr" name=""> required
                                    <option value="m1">Gạo</option>
                                    <option value="m2">Nếp</option>
                                    <option value="m3">Các loại hạt</option>
                                    <option value="m4">Các loại bột</option>
                                    <option value="m5">Các loại củ, trái</option>
                                </select>
                            </div>
                        </div>
                        <div class=" col-md-6 col_addprod">
                            <div class="form-group">
                                <label>Giá nhập</label>
                                <input name="" type="number" class="form-control input_addpr" placeholder=""
                                       value="">
                            </div>
                        </div>
                        <div class=" col-md-6 col_addprod">
                            <div class="form-group">
                                <label>Số lượng</label>
                                <input name="weight" type="text" class="form-control input_addpr with_50"
                                       placeholder=""
                                       value="">
                            </div>
                        </div>
                        <div class=" col-md-6 col_addprod">
                            <div class="form-group">
                                <label>Trọng lượng</label>
                                <input name="weight" type="text" class="form-control input_addpr with_50"
                                       placeholder=""
                                       value="">
                            </div>
                        </div>
                    </div>
<%--                    jhfjsd--%>
                    <div class="col-md-12 d-flex ">
                        <input type="button" onclick="" value="+">
                    </div>
                    <div class="col-md-12 d-flex btn_huy_update" style="justify-content: end;">
                        <input type="button" onclick="huy()" value="Huỷ">
                        <input type="submit" value="Tạo">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<%-------------Form xem chi tiết lô--%>
<div class="edit_formUser  xem_chi_tiet">
    <div class="container" style="background:none;">
        <div class="col-xl-7 ftco-animate cen-div  row ftco-section justify-content-center">
            <form class="billing-form" style="margin-top: 5%;" action="" method="post"
                  enctype="multipart/form-data">
                <div class="contai"></div>
                <h4 class="mb-4 billing-heading">Thêm sản phẩm</h4>
                <div class="col-md-12 d-flex btn_huy_update" style="justify-content: end;">
                    <input type="button" onclick="huy()" value="Hủy">
                </div>
            </form>
        </div>
    </div>
</div>


<script>

    function add() {
        $(".add_warehouse").css("display", "block");
    }

    function next() {
        $(".form_add_sp").css("display", "block");
        $(".add_warehouse").css("display", "none");
    }

    function huy() {
        $(".form_add_sp,.add_warehouse,  .xem_chi_tiet").css("display", "none");
    }

    function details() {
        $(".xem_chi_tiet").css("display", "block");
    }


    // checkbox all hoặc ko
    function checkAll(elementInput) {
        if (elementInput.checked) { // check select status
            $(':checkbox').each(function () { //loop through each checkbox
                this.checked = true;  //select all checkboxes with class "checkbox1"
            });
        } else {
            $(':checkbox').each(function () { //loop through each checkbox
                this.checked = false; //deselect all checkboxes with class "checkbox1"
            });
        }
    }

    let files = [],
        dragArea = document.querySelector('.drag-area'),
        input = document.querySelector('.drag-area input'),
        button = document.querySelector('.card button'),
        select = document.querySelector('.drag-area .select'),
        container = document.querySelector('.contai');

    let text;
    /** CLICK LISTENER */
    select.addEventListener('click', () => input.click());
    /* INPUT CHANGE EVENT */
    input.addEventListener('change', () => {
        let file = input.files;

        // if user select no image
        if (file.length == 0) return;

        for (let i = 0; i < file.length; i++) {
            if (file[i].type.split("/")[0] != 'image') continue;
            if (!files.some(e => e.name == file[i].name)) files.push(file[i])
            alert(files[i].name);
            text += files[i].name;

        }
        document.getElementById('textname').value = text
        showImages();
    });

    /** SHOW IMAGES */
    function showImages() {
        container.innerHTML = files.reduce((prev, curr, index) => {
            return `${prev}
		    <div class="image">
			    <span onclick="delImage(${index})">&times;</span>
			    <img src="${URL.createObjectURL(curr)}" style="max-width: 100px; max-height: 100%;" />
			</div>`
        }, '');
    }

    /* DELETE IMAGE */
    function delImage(index) {
        files.splice(index, 1);
        showImages();
    }

    /* DRAG & DROP */
    dragArea.addEventListener('dragover', e => {
        e.preventDefault()
        dragArea.classList.add('dragover')
    })

    /* DRAG LEAVE */
    dragArea.addEventListener('dragleave', e => {
        e.preventDefault()
        dragArea.classList.remove('dragover')
    });

    /* DROP EVENT */
    dragArea.addEventListener('drop', e => {
        e.preventDefault()
        dragArea.classList.remove('dragover');

        let file = e.dataTransfer.files;
        for (let i = 0; i < file.length; i++) {
            /** Check selected file is image */
            if (file[i].type.split("/")[0] != 'image') continue;

            if (!files.some(e => e.name == file[i].name)) files.push(file[i])

        }
        showImages();
    });

</script>

<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="admin_template/vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<script src="admin_template/vendors/chart.js/Chart.min.js"></script>
<script src="admin_template/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script src="admin_template/vendors/progressbar.js/progressbar.min.js"></script>

<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="admin_template/js/off-canvas.js"></script>
<script src="admin_template/js/hoverable-collapse.js"></script>
<script src="admin_template/js/template.js"></script>
<script src="admin_template/js/settings.js"></script>
<script src="admin_template/js/todolist.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="admin_template/js/jquery.cookie.js" type="text/javascript"></script>
<script src="admin_template/js/dashboard.js"></script>
<script src="admin_template/js/Chart.roundedBarCharts.js"></script>

<!-- End custom js for this page-->
</body>

</html>