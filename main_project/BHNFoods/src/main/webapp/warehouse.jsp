<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="org.w3c.dom.ls.LSOutput" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.apache.commons.math3.stat.descriptive.summary.Sum" %>
<%@ page import="org.apache.poi.ss.formula.functions.Count" %>
<%@ page import="com.sun.source.tree.CompilationUnitTree" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.*" %>
<%@ page import="vn.edu.hcmuaf.fit.service.WarehouseService" %>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
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

        #detailsWh.xem_chi_tiet {
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
            max-height: 500px;
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

        .row_input {
            justify-content: space-around;
        }

        .row_input .col_addwh {
            width: 30%;
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
                    <a href="http://localhost:8080/AdminManagePr?kind=0&page=1 "
                       class="dropdown-item preview-item">
                        <div class="preview-item-content flex-grow py-2">
                            <p class="preview-subject ellipsis font-weight-medium text-dark">Tất cả </p>
                        </div>
                    </a>
                    <a href="http://localhost:8080/AdminManagePr?kind=1&page=1"
                       class="dropdown-item preview-item">
                        <div class="preview-item-content flex-grow py-2">
                            <p class="preview-subject ellipsis font-weight-medium text-dark">Gạo</p>
                        </div>
                    </a>
                    <a href="http://localhost:8080/AdminManagePr?kind=2&page=1 "
                       class="dropdown-item preview-item">
                        <div class="preview-item-content flex-grow py-2">
                            <p class="preview-subject ellipsis font-weight-medium text-dark">Nếp </p>
                        </div>
                    </a>
                    <a href="http://localhost:8080/AdminManagePr?kind=3&page=1"
                       class="dropdown-item preview-item">
                        <div class="preview-item-content flex-grow py-2">
                            <p class="preview-subject ellipsis font-weight-medium text-dark">Các loại hạt </p>
                        </div>
                    </a>
                    <a href="http://localhost:8080/AdminManagePr?kind=4&page=1"
                       class="dropdown-item preview-item">
                        <div class="preview-item-content flex-grow py-2">
                            <p class="preview-subject ellipsis font-weight-medium text-dark">Các loại bột </p>

                        </div>
                    </a>
                    <a href="http://localhost:8080/AdminManagePr?kind=5&page=1 "
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
                <form class="search-form" >
                    <i class="icon-search"></i>
                    <input oninput="searchwh(this)" type="search" class="form-control" placeholder="Search Here" name="searchAD"
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
            <a href="/ListOrdersAdmin" class="nav-item-link">
                <i style="margin-right: 5px;" class="fa-solid fa-bars-progress"></i>
                <span>Quản lý đơn hàng</span>
            </a>
        </div>
        <div class="nav-item">
            <a href="/HistoryOrdersAdmin" class="nav-item-link">
                <i style="margin-right: 5px;" class="fa-solid fa-clock-rotate-left"></i>
                <span>Lịch sử đơn hàng</span>
            </a>
        </div>
        <div class="nav-item">
            <a href="/AdminManagePr?kind=0&page=1" class="nav-item-link">
                <i style="margin-right: 5px;" class="menu-icon mdi mdi-view-module"></i>
                <span>Quản lý sản phẩm</span>
            </a>
        </div>
        <div class="nav-item">
            <a href="/Warehouse" class="nav-item-link">
                <i style="margin-right: 5px;" class="fa-solid fa-arrow-down-wide-short"></i>
                <span>Nhập kho</span>
            </a>
        </div>

        <div class="nav-item">
            <a href="/logOut" class="nav-item-link">
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
                                                                    <th>Số mặt hàng</th>
                                                                    <th>Nhân viên nhập</th>
                                                                    <th>Ngày nhập lô</th>
                                                                    <th>Tổng tiền</th>
                                                                    <th></th>
                                                                </tr>
                                                                </thead>
                                                                <tbody id="idTbody">
                                                                <%
                                                                    List<Warehouse> listwh = (List<Warehouse>) request.getAttribute("listwh");

                                                                    for (Warehouse w : listwh) {
                                                                        int sumPrice = 0;
                                                                        List<DetailsWH> detailWH = WarehouseService.getInstance().getDetail_WH(w.getId_shipment());
                                                                        for (DetailsWH d : detailWH) {
                                                                            sumPrice += d.getPRICE_IMPORT() * d.getAMOUNT_PR();
                                                                        }
                                                                %>
                                                                <tr>
                                                                    <td>
                                                                        <div class="d-flex ">
                                                                            <div>
                                                                                <h6>[<%=w.getCode_wh()%>]
                                                                                </h6>
                                                                            </div>
                                                                        </div>
                                                                    </td>

                                                                    <td>
                                                                        <div class=" ">
                                                                            <p><%=detailWH.size()%>
                                                                            </p>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div class=""><%=w.getName_employee()%>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <h6><%=w.getDate_import_shipment()%>
                                                                        </h6>
                                                                    </td>
                                                                    <td>
                                                                        <div class=""><%=sumPrice%>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div class="btn_edit">
                                                                            <button onclick="details('<%=w.getId_shipment()%>')">
                                                                                <h4 class="card-title card-title-dash">
                                                                                    Xem chi tiết
                                                                                </h4></button>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <%}%>
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
<div  class="edit_formUser edit_formAdd add_warehouse form_add_sp">
    <div class="container" style="background:none;">
        <div class="col-xl-7 ftco-animate cen-div  row ftco-section justify-content-center">
            <form id="idform" class="billing-form" style="margin-top: 5%;" action="/AddWarehouse" method="post"
                  enctype="multipart/form-data">
                <div class="contai"></div>
                <h4 class="mb-4 billing-heading">Nhập Lô hàng</h4>
                <div class="d-flex flex-grow-1 row_input ">
                    <div class="col-md-6 col_addwh">
                        <div class="form-group">
                            <label>Mã Lô Hàng</label>
                            <input id="idShipment" name="codewh" type="text" class="form-control input_addpr"
                                   placeholder=""
                                   value="">
                        </div>
                    </div>

                    <div class=" col-md-6 col_addwh">
                        <div class="form-group">
                            <label>Ngày nhập hàng</label>
                            <input id="idDateImport" name="date" type="date" class="form-control input_addpr"
                                   placeholder="" value="">
                        </div>
                    </div>
                </div>

                <h4 class="mb-4 billing-heading">Sản phẩm</h4>
                <div class="row align-items-end" style="font-size: 16px;">
                    <div id="boundingRows">
                        <div id="warehouse1" class=" d-flex flex-grow-1 row_input rowWarehouse">
                            <div class="" style=" margin-top: 2rem">
                                <div class="">
                                    <input class="number_pr" type="button" name="indexRow" onclick="" value="1">
                                </div>
                            </div>
                            <div class="col-md-6 col_addprod">
                                <div class="form-group">
                                    <label>Danh mục</label>
                                    <select id="menu1" onchange="selectMenu('menu1', 'product1')" type="text"
                                            class="elementMenu form-control input_addpr" name="menu" required>
                                        <option value="m1">Gạo</option>
                                        <option value="m2">Nếp</option>
                                        <option value="m3">Các loại hạt</option>
                                        <option value="m4">Các loại bột</option>
                                        <option value="m5">Các loại củ, trái</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6 col_addprod">
                                <div class="form-group">
                                    <label>Tên sản phẩm</label>
                                    <select id="product1" type="text" class="elementMenu form-control input_addpr"
                                            name="nameProduct" required>
                                    </select>
                                </div>
                            </div>
                            <div class=" col-md-6 col_addprod">
                                <div class="form-group">
                                    <label>Giá nhập</label>
                                    <input id="price1" min="0" name="price" type="number"
                                           class="elementInputPrice form-control input_addpr"
                                           placeholder=""
                                           value="" required>
                                </div>
                            </div>
                            <div class=" col-md-6 col_addprod">
                                <div class="form-group">
                                    <label>Số lượng</label>
                                    <input id="amount1" min="1" name="amount" type="number"
                                           class="elementQuantity form-control input_addpr "
                                           placeholder=""
                                           value="" required>
                                </div>
                            </div>
                            <div class=" col-md-6 col_addprod">
                                <div class="form-group">
                                    <label>Trọng lượng</label>
                                    <input id="weight1" name="weight" type="text"
                                           class="elementWeight form-control input_addpr "
                                           placeholder=""
                                           value="">
                                </div>
                            </div>
                            <div class="" style=" margin-top: 2rem">
                                <div class="">
                                    <input class="" type="button" onclick="remove('warehouse1')" value="x">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 d-flex ">
                        <input id="btnAddRow" type="button" value="+">
                    </div>
                    <div class="col-md-12 d-flex btn_huy_update" style="justify-content: end;">
                        <input id="jsonItem" name="jsonItem" value="" style="display: none">
                        <input type="button" onclick="huy()" value="Huỷ">
                        <input type="button" onclick="submitForm()" value="Tạo">

                    </div>
                </div>
            </form>
        </div>
    </div>

</div>

<%------------Form xem chi tiết lô--%>
<div id="detailsWh">

</div>
<%--<div class="edit_formUser form_add_sp xem_chi_tiet">--%>
<%--    <div class="container" style="background:none;">--%>
<%--        <div class="col-xl-7 ftco-animate cen-div  row ftco-section justify-content-center">--%>
<%--            <form class="billing-form" style="margin-top: 5%;" action="/Warehouse" method="post"--%>
<%--                  enctype="multipart/form-data">--%>
<%--                <h4 class="mb-4 billing-heading">Chi tiết lô hàng:</h4>--%>
<%--                <h4 class="mb-4 billing-heading">Ngày nhập: </h4>--%>
<%--                <h4 class="mb-4 billing-heading" style="display: none">ID: </h4>--%>
<%--                &lt;%&ndash;  in ra danh sách sp trong lô hàng&ndash;%&gt;--%>
<%--                <div class="table-responsive  mt-1">--%>
<%--                    <table class="table select-table">--%>
<%--                        <thead>--%>
<%--                        <tr>--%>
<%--                            <th>Tên sản phẩm</th>--%>
<%--                            <th>Danh mục</th>--%>
<%--                            <th>Số lượng</th>--%>
<%--                            <th>Giá nhập</th>--%>
<%--                            <th>Trọng lượng</th>--%>
<%--                        </tr>--%>
<%--                        </thead>--%>
<%--                        <tbody>--%>
<%--                        <tr>--%>
<%--                            <td>--%>
<%--                                <div class="d-flex ">--%>
<%--                                    <div>--%>
<%--                                        <p>Gạo thơm hạt ngọc trời Thiên Vương 5kg</p>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </td>--%>
<%--                            <td>--%>
<%--                                <p>gạo</p>--%>
<%--                            </td>--%>
<%--                            <td>--%>
<%--                                <div>--%>
<%--                                    <div class="d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap">--%>
<%--                                        <p>200--%>
<%--                                        </p>--%>
<%--                                    </div>--%>

<%--                                </div>--%>
<%--                            </td>--%>
<%--                            <td>--%>
<%--                                <div class="">16.000--%>
<%--                                </div>--%>
<%--                            </td>--%>
<%--                            <td>--%>
<%--                                <div class="">600g--%>
<%--                                </div>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                        </tbody>--%>

<%--                    </table>--%>
<%--                </div>--%>
<%--                &lt;%&ndash;-----&ndash;%&gt;--%>
<%--                <div class="col-md-12 d-flex btn_huy_update" style="justify-content: end;">--%>
<%--                    <input type="button" onclick="huy()" value="Hủy">--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>


<script>
    function submitForm() {
        const listMenu = document.getElementsByName('menu');
        const listName = document.getElementsByName('nameProduct');
        const listPrice = document.getElementsByName('price');
        const listAmount = document.getElementsByName('amount');
        const listWeight = document.getElementsByName('weight');
        let total = document.getElementsByClassName('rowWarehouse').length;
        var arr = [];
        for (let i = 0; i < total; i++) {
            var item = {
                ID_MENU: listMenu[i].value,
                ID_PR: listName[i].value,
                PRICE_IMPORT: listPrice[i].value,
                AMOUNT_PR: listAmount[i].value,
                WEIGHT_PR: listWeight[i].value
            }
            arr[i] = item;
        }
        console.log(arr)
        var jsonItem = JSON.stringify(arr);
        $('#jsonItem').val(jsonItem)
        $.ajax({
            url: "/AddWarehouse",
            type: 'post',
            data: {
                codewh: $('#idShipment').val(),
                date: $('#idDateImport').val(),
                jsonItem: $('#jsonItem').val(),

            },
            success: function (data) {
                alert("thanh cong");
                location.reload();
            },
            error: function () {
            },

        });
        $('.add_warehouse').css("display", "none");
    }

    // danh sach rowWareHouse.length = ? -> có được số lượng item
    // Tao ra var arr = [];
    // duyệt for i = 1 i <= số item i++ {
    //
    // var item = {
    //     danhmuc : $('#menu' + i).val(),
    //     tensanpham : $('#product' + i).val(),
    //     gianhap : 10,
    //     soluong : 20,
    //     trongluong : 200,
    // }
    // arr[i - 1] = item
    // }
    // var jsonItem = JSON.stringify(arr);
    // $('#jsonItem').val(jsonItem)
    // this.submit();

    function testAdd() {
        $('#boundingRows').append('<h1>Hello</h1>');
    }


    function details(id_shipment) {
        $.ajax({
            url: "/ViewDetailsWh",
            type: 'get',
            data: {
                idShipment: id_shipment,

            },
            success: function (data) {
                const content = document.getElementById('detailsWh');
                content.innerHTML = data;
            },
            error: function () {
            }
        });
        $(".xem_chi_tiet").css("display", "block");
    }

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
    function remove(id){
        document.getElementById(id).remove();
        const totalRow = document.getElementsByClassName('rowWarehouse').length;
        var elementIndexRow = document.getElementsByName('indexRow');
        for (let i = 1; i <= totalRow; i++) {
            elementIndexRow[i - 1].value = i;
        }
    }

    document.getElementById('btnAddRow').addEventListener('click', () => {
        let index = document.getElementsByClassName('rowWarehouse').length + 1;
        $('#boundingRows').append("<div id=\"warehouse"+index+"\" class=\"d-flex flex-grow-1 row_input rowWarehouse\">\n" +
            "                            <div class=\"\" style=\" margin-top: 2rem\">\n" +
            "                                <div class=\"\">\n" +
            "                                    <input class=\"number_pr\" type=\"button\" name=\"indexRow\" onclick=\"\" value=\"" + index + "\">\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                            <div class=\"col-md-6 col_addprod\">\n" +
            "                                <div class=\"form-group\">\n" +
            "                                    <label>Danh mục</label>\n" +
            "                                    <select id=\"menu" + index + "\" onchange=\"selectMenu('menu" + index + "', 'product" + index + "')\" type=\"text\" class=\"elementMenu form-control input_addpr\" name=\"menu\" required>\n" +
            "                                        <option value=\"m1\">Gạo</option>\n" +
            "                                        <option value=\"m2\">Nếp</option>\n" +
            "                                        <option value=\"m3\">Các loại hạt</option>\n" +
            "                                        <option value=\"m4\">Các loại bột</option>\n" +
            "                                        <option value=\"m5\">Các loại củ, trái</option>\n" +
            "                                    </select>\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                            <div class=\"col-md-6 col_addprod\">\n" +
            "                                <div class=\"form-group\">\n" +
            "                                    <label>Tên sản phẩm</label>\n" +
            "                                    <select id=\"product" + index + "\" type=\"text\" class=\"elementMenu form-control input_addpr\" name=\"nameProduct\" required>\n" +
            "                                    </select>\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                            <div class=\" col-md-6 col_addprod\">\n" +
            "                                <div class=\"form-group\">\n" +
            "                                    <label>Giá nhập</label>\n" +
            "                                    <input  id=\"price" + index + "\" min=\"0\" name=\"price\" type=\"number\" class=\"elementInputPrice form-control input_addpr\"\n" +
            "                                           placeholder=\"\"\n" +
            "                                           value=\"\" required>\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                            <div class=\" col-md-6 col_addprod\">\n" +
            "                                <div class=\"form-group\">\n" +
            "                                    <label>Số lượng</label>\n" +
            "                                    <input id=\"amount" + index + "\" min=\"1\" name=\"amount\" type=\"number\" class=\"elementQuantity form-control input_addpr \"\n" +
            "                                           placeholder=\"\"\n" +
            "                                           value=\"\" required>\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                            <div class=\" col-md-6 col_addprod\">\n" +
            "                                <div class=\"form-group\">\n" +
            "                                    <label>Trọng lượng</label>\n" +
            "                                    <input id=\"weight" + index + "\" name=\"weight\" type=\"text\" class=\"elementWeight form-control input_addpr \"\n" +
            "                                           placeholder=\"\"\n" +
            "                                           value=\"\" >\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                            <div class=\"\" style=\" margin-top: 2rem\">\n" +
            "                                <div class=\"\">\n" +
            "                                    <input class=\"\" type=\"button\" onclick=\"remove('warehouse"+index+"')\" value=\"x\">\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                        </div>");
    });

    function selectMenu(id, idElementSelect) {
        var idMenu = $('#' + id).val();
        $.ajax({
            url: "/AddMenu",
            type: 'get',
            data: {
                idMenu: idMenu
            },
            success: function (data) {
                const content = document.getElementById(idElementSelect);
                content.innerHTML = data;
            },
            error: function () {
                alert("Thêm lô hàng thát bại");
            }
        });
    }
    function searchwh(data){
        var code= data.value;
        console.log(code)
        $.ajax({
            url:"/SearchWH",
            type: 'get',
            data:{
                code: code
            },
            success: function (data){
                var row= document.getElementById('idTbody');
                row.innerHTML= data;
                console.log(data)
            }
        })
    }

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