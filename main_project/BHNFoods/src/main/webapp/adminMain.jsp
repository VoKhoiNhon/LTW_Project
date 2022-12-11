<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.SingleProduct" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.controller.AdminMain" %>
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

</head>

<body>
<!-- partial:partials/_navbar.html -->
<nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row">
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
        <%--    <div class="me-3">--%>
        <%--      <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-bs-toggle="minimize">--%>
        <%--        <span class="icon-menu"></span>--%>
        <%--      </button>--%>
        <%--    </div>--%>
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
                    <a class="dropdown-item preview-item">
                        <div class="preview-item-content flex-grow py-2">
                            <p class="preview-subject ellipsis font-weight-medium text-dark">Người dùng </p>
                            <p class="fw-light small-text mb-0">Trang chi tiết người dùng</p>
                        </div>
                    </a>
                    <a class="dropdown-item preview-item">
                        <div class="preview-item-content flex-grow py-2">
                            <p class="preview-subject ellipsis font-weight-medium text-dark">Admin</p>
                            <p class="fw-light small-text mb-0">Trang chi tiết Admin</p>
                        </div>
                    </a>
                    <a class="dropdown-item preview-item">
                        <div class="preview-item-content flex-grow py-2">
                            <p class="preview-subject ellipsis font-weight-medium text-dark">Tất cả </p>
                            <p class="fw-light small-text mb-0">Trang chi tiết cho tất cả</p>
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
                <form class="search-form" action="#">
                    <i class="icon-search"></i>
                    <input type="search" class="form-control" placeholder="Search Here" title="Search here">
                </form>
            </li>
            <%--      <li class="nav-item dropdown">--%>
            <%--        <a class="nav-link count-indicator" id="notificationDropdown" href="#" data-bs-toggle="dropdown">--%>
            <%--          <i class="icon-mail icon-lg"></i>--%>
            <%--        </a>--%>
            <%--        <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0"--%>
            <%--             aria-labelledby="notificationDropdown">--%>
            <%--          <a class="dropdown-item py-3 border-bottom">--%>
            <%--            <p class="mb-0 font-weight-medium float-left">Bạn có 3 thông báo mới </p>--%>
            <%--            <span class="badge badge-pill badge-primary float-right">Xem tất cả</span>--%>
            <%--          </a>--%>
            <%--          <a class="dropdown-item preview-item py-3">--%>
            <%--            <div class="preview-thumbnail">--%>
            <%--              <i class="mdi mdi-alert m-auto text-primary"></i>--%>
            <%--            </div>--%>
            <%--            <div class="preview-item-content">--%>
            <%--              <h6 class="preview-subject fw-normal text-dark mb-1">Lỗi ứng dụng</h6>--%>
            <%--              <p class="fw-light small-text mb-0"> Vừa rồi </p>--%>
            <%--            </div>--%>
            <%--          </a>--%>
            <%--          <a class="dropdown-item preview-item py-3">--%>
            <%--            <div class="preview-thumbnail">--%>
            <%--              <i class="mdi mdi-settings m-auto text-primary"></i>--%>
            <%--            </div>--%>
            <%--            <div class="preview-item-content">--%>
            <%--              <h6 class="preview-subject fw-normal text-dark mb-1">Cài đặt</h6>--%>
            <%--              <p class="fw-light small-text mb-0"> Tin nhắn riêng </p>--%>
            <%--            </div>--%>
            <%--          </a>--%>
            <%--          <a class="dropdown-item preview-item py-3">--%>
            <%--            <div class="preview-thumbnail">--%>
            <%--              <i class="mdi mdi-airballoon m-auto text-primary"></i>--%>
            <%--            </div>--%>
            <%--            <div class="preview-item-content">--%>
            <%--              <h6 class="preview-subject fw-normal text-dark mb-1">Đăng kí người dùng mới</h6>--%>
            <%--              <p class="fw-light small-text mb-0">2 ngày trước </p>--%>
            <%--            </div>--%>
            <%--          </a>--%>
            <%--        </div>--%>
            <%--      </li>--%>
            <%--      <li class="nav-item dropdown">--%>
            <%--        <a class="nav-link count-indicator" id="countDropdown" href="#" data-bs-toggle="dropdown"--%>
            <%--           aria-expanded="false">--%>
            <%--          <i class="icon-bell"></i>--%>
            <%--          <span class="count"></span>--%>
            <%--        </a>--%>
            <%--        <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0"--%>
            <%--             aria-labelledby="countDropdown">--%>
            <%--          <a class="dropdown-item py-3">--%>
            <%--            <p class="mb-0 font-weight-medium float-left">Bạn có 7 thông báo chưa đọc </p>--%>
            <%--            <span class="badge badge-pill badge-primary float-right">Xem tất cả</span>--%>
            <%--          </a>--%>
            <%--          <div class="dropdown-divider"></div>--%>
            <%--          <a class="dropdown-item preview-item">--%>
            <%--            <div class="preview-thumbnail">--%>
            <%--              <img src="images/faces/face10.jpg" alt="image" class="img-sm profile-pic">--%>
            <%--            </div>--%>
            <%--            <div class="preview-item-content flex-grow py-2">--%>
            <%--              <p class="preview-subject ellipsis font-weight-medium text-dark">Võ Khôi Nhơn </p>--%>
            <%--              <p class="fw-light small-text mb-0"> Cuộc họp bị hủy </p>--%>
            <%--            </div>--%>
            <%--          </a>--%>
            <%--          <a class="dropdown-item preview-item">--%>
            <%--            <div class="preview-thumbnail">--%>
            <%--              <img src="images/faces/face12.jpg" alt="image" class="img-sm profile-pic">--%>
            <%--            </div>--%>
            <%--            <div class="preview-item-content flex-grow py-2">--%>
            <%--              <p class="preview-subject ellipsis font-weight-medium text-dark">Phạm Gia Bảo </p>--%>
            <%--              <p class="fw-light small-text mb-0">  Cuộc họp bị hủy </p>--%>
            <%--            </div>--%>
            <%--          </a>--%>
            <%--          <a class="dropdown-item preview-item">--%>
            <%--            <div class="preview-thumbnail">--%>
            <%--              <img src="images/faces/face1.jpg" alt="image" class="img-sm profile-pic">--%>
            <%--            </div>--%>
            <%--            <div class="preview-item-content flex-grow py-2">--%>
            <%--              <p class="preview-subject ellipsis font-weight-medium text-dark">Nguyễn Thị Xuân Hoa </p>--%>
            <%--              <p class="fw-light small-text mb-0">  Cuộc họp bị hủy </p>--%>
            <%--            </div>--%>
            <%--          </a>--%>
            <%--        </div>--%>
            <%--      </li>--%>
            <li class="nav-item dropdown d-none d-lg-block user-dropdown">
                <a class="nav-link" id="UserDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                    <img class="img-xs rounded-circle" src="ImageproductNew/background/images.png" alt="Profile image">
                </a>
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
                    <div class="dropdown-header text-center">
                        <%--            <img class="img-md rounded-circle" src="images/faces/face8.jpg" alt="Profile image">--%>
                        <p class="mb-1 mt-3 font-weight-semibold">Võ Khôi Nhơn</p>
                        <p class="fw-light text-muted mb-0">Nhonw@gmail.com</p>
                    </div>
                    <a class="dropdown-item"><i
                            class="dropdown-item-icon mdi mdi-account-outline text-primary me-2"></i> Trang cá nhân</a>
                    <a class="dropdown-item"><i
                            class="dropdown-item-icon mdi mdi-message-text-outline text-primary me-2"></i>
                        Tin nhắn</a>
                    <%--          <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-calendar-check-outline text-primary me-2"></i>--%>
                    <%--            Hoạt động</a>--%>
                    <%--          <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-help-circle-outline text-primary me-2"></i>--%>
                    <%--            Các câu hỏi thường gặp</a>--%>
                    <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-power text-primary me-2"></i>Đăng xuất</a>
                </div>
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
            <a href="http://localhost:8080/BHNFoods/AdminMain" class="nav-item-link">
                <i style="margin-right: 5px;" class="menu-icon mdi mdi-home"></i>
                <span>Trang chủ</span>
            </a>
        </div>
        <div class="nav-item">
            <a href="http://localhost:8080/BHNFoods/AdminManageUser" class="nav-item-link">
                <i style="margin-right: 5px;" class="menu-icon mdi mdi-account-circle"></i>
                <span>Quản lý người dùng</span>
            </a>
        </div>
        <div class="nav-item">
            <a href="http://localhost:8080/BHNFoods/AdminManagePr?kind=0&page=1" class="nav-item-link">
                <i style="margin-right: 5px;" class="menu-icon mdi mdi-view-module"></i>
                <span>Quản lý sản phẩm</span>
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
                                <%--                <div class="btn-wrapper">--%>
                                <%--                  <a href="#" class="btn btn-otline-dark align-items-center"><i class="icon-share"></i> Chia sẻ</a>--%>
                                <%--                  <a href="#" class="btn btn-otline-dark"><i class="icon-printer"></i> In</a>--%>
                                <%--                  <a href="#" class="btn btn-primary text-white me-0"><i class="icon-download"></i> Xuất</a>--%>
                                <%--                </div>--%>
                            </div>
                        </div>
                        <div class="tab-content tab-content-basic">
                            <div class="tab-pane fade show active" id="overview" role="tabpanel"
                                 aria-labelledby="overview">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="statistics-details d-flex align-items-center justify-content-between">
                                            <div>
                                                <p class="statistics-title">Doanh thu/tháng</p>
                                                <h3 class="rate-percentage">20.000.000 VNĐ</h3>
                                                <p class="text-danger d-flex"><i class="mdi mdi-menu-down"></i><span>-0.5%</span>
                                                </p>
                                            </div>
                                            <div>
                                                <p class="statistics-title">Số mặt hàng đã bán</p>
                                                <h3 class="rate-percentage">230 </h3>
                                                <p class="text-success d-flex"><i class="mdi mdi-menu-up"></i><span>+0.1%</span>
                                                </p>
                                            </div>
                                            <div>
                                                <p class="statistics-title">Mặt hàng ngừng kinh doanh</p>
                                                <h3 class="rate-percentage">68</h3>
                                                <p class="text-danger d-flex"><i
                                                        class="mdi mdi-menu-down"></i><span></span></p>
                                            </div>
                                            <div class="d-none d-md-block">
                                                <p class="statistics-title">Tổng lượt xem website</p>
                                                <h3 class="rate-percentage">1781212</h3>
                                                <p class="text-success d-flex"><i class="mdi mdi-menu-down"></i><span>+0.8%</span>
                                                </p>
                                            </div>
                                            <div class="d-none d-md-block">
                                                <p class="statistics-title">Khách hàng mới</p>
                                                <h3 class="rate-percentage">60</h3>
                                                <p class="text-danger d-flex"><i class="mdi mdi-menu-down"></i><span>0.3%</span>
                                                </p>
                                            </div>
                                            <div class="d-none d-md-block">
                                                <!-- <p class="statistics-title">Avg. Time on Site</p>
                                                <h3 class="rate-percentage">2m:35s</h3>
                                                <p class="text-success d-flex"><i class="mdi mdi-menu-down"></i><span>+0.8%</span></p> -->
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row flex-grow">
                                    <div class="col-md-6 col-lg-6 grid-margin stretch-card">
                                        <div class="card card-rounded">
                                            <div class="card-body card-rounded">
                                                <h4 class="card-title  card-title-dash">Ngày nhập lô hàng</h4>

                                                <%  int i = 10;

                                                    List<SingleProduct> list = ProductService.getInstance().getListPrDateImport(i);
                                                    for (SingleProduct s :list) {

                                                %>
                                                <div class="list align-items-center border-bottom py-2">
                                                    <div class="wrapper w-100">
                                                        <p class="mb-2 font-weight-medium">
                                                            <%=s.getNamePr()%>
                                                        </p>
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <div class="d-flex align-items-center">
                                                                <i class="mdi mdi-calendar text-muted me-1"></i>
                                                                <p class="mb-0 text-small text-muted"><%=s.getDateImportPr()%></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%}%>
                                                <input type="button" value="Update" formmethod="post" ></input>
                                                <div class="list align-items-center pt-3">
                                                    <div class="wrapper w-100">
                                                        <p class="mb-0">
                                                            <a href="#" class="fw-bold text-primary">Xem thêm <i
                                                                    class="mdi mdi-arrow-right ms-2"></i> </a>
                                                        </p>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 grid-margin stretch-card">
                                        <div class="card card-rounded">
                                            <div class="card-body">
                                                <div class="d-flex align-items-center justify-content-between mb-3">
                                                    <h4 class="card-title card-title-dash">Sản phẩm bán chạy</h4>
                                                    <%--                        <p class="mb-0">fliter</p>--%>
                                                </div>
                                                <ul class="bullet-line-list">
                                                    <li>
                                                        <div class="d-flex justify-content-between">
                                                            <div><span class="text-light-green">gạo</span> 20000</div>
                                                            <p>VND</p>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex justify-content-between">
                                                            <div><span class="text-light-green">gạo</span> 20000</div>
                                                            <p>VND</p>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex justify-content-between">
                                                            <div><span class="text-light-green">gạo</span> 20000</div>
                                                            <p>VND</p>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex justify-content-between">
                                                            <div><span class="text-light-green">gạo</span> 20000</div>
                                                            <p>VND</p>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex justify-content-between">
                                                            <div><span class="text-light-green">gạo</span> 20000</div>
                                                            <p>VND</p>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex justify-content-between">
                                                            <div><span class="text-light-green">gạo</span> 20000</div>
                                                            <p>VND</p>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex justify-content-between">
                                                            <div><span class="text-light-green">gạo</span> 20000</div>
                                                            <p>VND</p>
                                                        </div>
                                                    </li>
                                                </ul>
                                                <div class="list align-items-center pt-3">
                                                    <div class="wrapper w-100">
                                                        <p class="mb-0">
                                                            <a href="#" class="fw-bold text-primary">Xem thêm <i
                                                                    class="mdi mdi-arrow-right ms-2"></i></a>
                                                        </p>
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
            <!-- content-wrapper ends -->
        </div>
        <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<!-- plugins:js -->
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