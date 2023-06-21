<%@ page import="vn.edu.hcmuaf.fit.beans.User" %>
<%@ page import="java.util.List" %>
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
    font-size: 16px;
  }

  .align-items-end .row_input .col_addprod {
    flex: auto;
    margin-top: 8px;
    position: relative;
    width: 100%;
    padding-right: 15px;
    padding-left: 15px;
  }


  .input_addpr {
    height: calc(1.5em + .75rem);
  }

  .col-xl-7 .row .col-md-12 .edit_img {
    width: 100%;
    height: 100px;
    border: gray;
    border-style: dashed;
    margin: 0 20px;
    padding: 0;

  }

  .col-xl-7 .row .col-md-12 .edit_img .btnX_img {
    padding: 0 4px;

  }

  .padd_right {
    padding-right: 50px;
  }

  .edit_formUser {
    height: 500%;
    width: 100%;
    background: rgba(0, 0, 0, 0.73);
    position: absolute;
    z-index: 1500;
    top: 0;
    display: none;
  }

  .edit_formUser .cen-div {
    margin: auto;
    background: #f1f1f1;
    width: 50%;
    margin-top:5%;
    border-radius: 5px;
  }

  .edit_formUser .btn_huy_update button {
    background: none;
    border: none;
  }

</style>

<body>
<!-- partial:partials/_navbar.html -->
<nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row">
  <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
    <%--      <div class="me-3">--%>
    <%--        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-bs-toggle="minimize">--%>
    <%--          <span class="icon-menu"></span>--%>
    <%--        </button>--%>
    <%--      </div>--%>
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
        <form class="search-form" action="">
          <i class="icon-search"></i>
          <input type="search" class="form-control" name="searchUser" placeholder="Search Here" title="Search here">
        </form>
      </li>
      <%--        <li class="nav-item dropdown">--%>
      <%--          <a class="nav-link count-indicator" id="notificationDropdown" href="#" data-bs-toggle="dropdown">--%>
      <%--            <i class="icon-mail icon-lg"></i>--%>
      <%--          </a>--%>
      <%--          <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0"--%>
      <%--            aria-labelledby="notificationDropdown">--%>
      <%--            <a class="dropdown-item py-3 border-bottom">--%>
      <%--              <p class="mb-0 font-weight-medium float-left">Bạn có 3 thông báo mới </p>--%>
      <%--              <span class="badge badge-pill badge-primary float-right">Xem tất cả</span>--%>
      <%--            </a>--%>
      <%--            <a class="dropdown-item preview-item py-3">--%>
      <%--              <div class="preview-thumbnail">--%>
      <%--                <i class="mdi mdi-alert m-auto text-primary"></i>--%>
      <%--              </div>--%>
      <%--              <div class="preview-item-content">--%>
      <%--                <h6 class="preview-subject fw-normal text-dark mb-1">Lỗi ứng dụng</h6>--%>
      <%--                <p class="fw-light small-text mb-0"> Vừa rồi </p>--%>
      <%--              </div>--%>
      <%--            </a>--%>
      <%--            <a class="dropdown-item preview-item py-3">--%>
      <%--              <div class="preview-thumbnail">--%>
      <%--                <i class="mdi mdi-settings m-auto text-primary"></i>--%>
      <%--              </div>--%>
      <%--              <div class="preview-item-content">--%>
      <%--                <h6 class="preview-subject fw-normal text-dark mb-1">Cài đặt</h6>--%>
      <%--                <p class="fw-light small-text mb-0"> Tin nhắn riêng </p>--%>
      <%--              </div>--%>
      <%--            </a>--%>
      <%--            <a class="dropdown-item preview-item py-3">--%>
      <%--              <div class="preview-thumbnail">--%>
      <%--                <i class="mdi mdi-airballoon m-auto text-primary"></i>--%>
      <%--              </div>--%>
      <%--              <div class="preview-item-content">--%>
      <%--                <h6 class="preview-subject fw-normal text-dark mb-1">Đăng kí người dùng mới</h6>--%>
      <%--                <p class="fw-light small-text mb-0">2 ngày trước </p>--%>
      <%--              </div>--%>
      <%--            </a>--%>
      <%--          </div>--%>
      <%--        </li>--%>
      <%--        <li class="nav-item dropdown">--%>
      <%--          <a class="nav-link count-indicator" id="countDropdown" href="#" data-bs-toggle="dropdown"--%>
      <%--            aria-expanded="false">--%>
      <%--            <i class="icon-bell"></i>--%>
      <%--            <span class="count"></span>--%>
      <%--          </a>--%>
      <%--          <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0"--%>
      <%--            aria-labelledby="countDropdown">--%>
      <%--            <a class="dropdown-item py-3">--%>
      <%--              <p class="mb-0 font-weight-medium float-left">Bạn có 7 thông báo chưa đọc </p>--%>
      <%--              <span class="badge badge-pill badge-primary float-right">Xem tất cả</span>--%>
      <%--            </a>--%>
      <%--            <div class="dropdown-divider"></div>--%>
      <%--            <a class="dropdown-item preview-item">--%>
      <%--              <div class="preview-thumbnail">--%>
      <%--                <img src="images/faces/face10.jpg" alt="image" class="img-sm profile-pic">--%>
      <%--              </div>--%>
      <%--              <div class="preview-item-content flex-grow py-2">--%>
      <%--                <p class="preview-subject ellipsis font-weight-medium text-dark">Võ Khôi Nhơn </p>--%>
      <%--                <p class="fw-light small-text mb-0"> Cuộc họp bị hủy </p>--%>
      <%--              </div>--%>
      <%--            </a>--%>
      <%--            <a class="dropdown-item preview-item">--%>
      <%--              <div class="preview-thumbnail">--%>
      <%--                <img src="images/faces/face12.jpg" alt="image" class="img-sm profile-pic">--%>
      <%--              </div>--%>
      <%--              <div class="preview-item-content flex-grow py-2">--%>
      <%--                <p class="preview-subject ellipsis font-weight-medium text-dark">Phạm Gia Bảo </p>--%>
      <%--                <p class="fw-light small-text mb-0">  Cuộc họp bị hủy </p>--%>
      <%--              </div>--%>
      <%--            </a>--%>
      <%--            <a class="dropdown-item preview-item">--%>
      <%--              <div class="preview-thumbnail">--%>
      <%--                <img src="images/faces/face1.jpg" alt="image" class="img-sm profile-pic">--%>
      <%--              </div>--%>
      <%--              <div class="preview-item-content flex-grow py-2">--%>
      <%--                <p class="preview-subject ellipsis font-weight-medium text-dark">Nguyễn Thị Xuân Hoa </p>--%>
      <%--                <p class="fw-light small-text mb-0">  Cuộc họp bị hủy </p>--%>
      <%--              </div>--%>
      <%--            </a>--%>
      <%--          </div>--%>
      <%--        </li>--%>
      <%
        User user = (User) session.getAttribute("auth");
        if (user != null) {%>
      <% String err =(String) request.getAttribute("err");
        if(err!=null){%>
      <script>alert(<%=err%>)</script>
      <%}%>
      <li class="nav-item dropdown d-none d-lg-block user-dropdown">
        <a class="nav-link" id="UserDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
          <img class="img-xs rounded-circle" src="ImageproductNew/background/images.png" alt="Profile image">
        </a>
        <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
          <div class="dropdown-header text-center">
            <%--              <img class="img-md rounded-circle" src="images/faces/face8.jpg" alt="Profile image">--%>
            <p class="mb-1 mt-3 font-weight-semibold"><%=user.getNameUser()%>
            </p>
            <p class="fw-light text-muted mb-0"><%=user.getEmail()%>
            </p>
          </div>
          <a class="dropdown-item"><i
                  class="dropdown-item-icon mdi mdi-account-outline text-primary me-2"></i> Trang cá nhân</a>
          <a class="dropdown-item"><i
                  class="dropdown-item-icon mdi mdi-message-text-outline text-primary me-2"></i>
            Tin nhắn</a>
          <%--            <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-calendar-check-outline text-primary me-2"></i>--%>
          <%--              Hoạt động</a>--%>
          <%--            <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-help-circle-outline text-primary me-2"></i>--%>
          <%--              Các câu hỏi thường gặp</a>--%>
          <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-power text-primary me-2"></i>Đăng xuất</a>
        </div>
      </li>
      <%}%>
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
      <a href="/BHNFoods/AdminMain" class="nav-item-link">
        <i style="margin-right: 5px;" class="menu-icon mdi mdi-home"></i>
        <span>Trang chủ</span>
      </a>
    </div>
    <div class="nav-item">
      <a href="/BHNFoods/AdminManageUser" class="nav-item-link">
        <i style="margin-right: 5px;" class="menu-icon mdi mdi-account-circle"></i>
        <span>Quản lý người dùng</span>
      </a>
    </div>
    <div class="nav-item">
      <a href="/BHNFoods/AdminManagePr?kind=0&page=1" class="nav-item-link">
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
                <%--                  <div class="btn-wrapper">--%>
                <%--                    <a href="#" class="btn btn-otline-dark align-items-center"><i class="icon-share"></i> Chia sẻ</a>--%>
                <%--                    <a href="#" class="btn btn-otline-dark"><i class="icon-printer"></i> In</a>--%>
                <%--                    <a href="#" class="btn btn-primary text-white me-0"><i class="icon-download"></i> Xuất</a>--%>
                <%--                  </div>--%>
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
                          <div class="card-body" style="padding-top: 0">
                            <div class="d-sm-flex justify-content-between align-items-start">
                              <div>
                                <%--                                                                    <a href="#" STYLE="text-decoration: none">--%>
                                <%--                                                                        <button class="card-title card-title-dash btn_add_delete">--%>
                                <%--                                                                            Thêm--%>
                                <%--                                                                        </button>--%>
                                <%--                                                                    </a>--%>
                                <a href="#" STYLE="text-decoration: none">
                                  <button class="card-title card-title-dash btn_add_delete">
                                    Xóa
                                  </button>
                                </a>
                              </div>
                            </div>
                            <div class="table-responsive  mt-1">
                              <table class="table select-table">
                                <thead>
                                <tr>
                                  <th>
                                    <div class="form-check form-check-flat mt-0">
                                      <label class="form-check-label">
                                        <input type="checkbox"
                                               class="form-check-input"
                                               aria-checked="false"><i
                                              class="input-helper"></i></label>
                                    </div>
                                  </th>
                                  <th>Khách hàng</th>
                                  <th>Số điện thoại và Email</th>
                                  <%--                                                                    <th></th>--%>
                                  <th>Địa chỉ</th>
                                  <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <% List<User> list = (List<User>) request.getAttribute("listSearchUser");
                                  for (User u : list) {
                                %>
                                <tr>
                                  <td>
                                    <div class="form-check form-check-flat mt-0">
                                      <label class="form-check-label">
                                        <input type="checkbox"
                                               class="form-check-input"
                                               aria-checked="false"><i
                                              class="input-helper"></i></label>
                                    </div>
                                  </td>
                                  <td>
                                    <div class="d-flex ">
                                      <img src="ImageproductNew/background/images.png"
                                           alt="">
                                      <div>
                                        <h6><%=u.getNameUser()%>
                                        </h6>
                                        <p><%=u.checkDecentralization()%>
                                        </p>
                                      </div>
                                    </div>
                                  </td>
                                  <td>
                                    <h6><%=u.getPhone()%>
                                    </h6>
                                    <p><%=u.getEmail()%>
                                    </p>
                                  </td>
                                  <td>
                                  </td>
                                  <td>
                                    <div class=""><%=u.getAddress()%>
                                    </div>
                                  </td>
                                  <td>
                                    <div>
                                      <button onclick="mo()" href="#"
                                              style="text-decoration: none">
                                        <h4 class="card-title card-title-dash">
                                          Xem <i
                                                class="fa-regular fa-pen-to-square"></i>
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
  <!-- content-wrapper ends -->
</div>
<!-- main-panel ends -->
</div>
<!-- page-body-wrapper ends -->
</div>

<%--    <section class="ftco-section" style=" background: #ededed00">--%>
<%--        <div class="container" style="background-color:  #ededed00">--%>
<%--            <div class="row justify-content-center">--%>
<div class="edit_formUser">
  <div class="container" style="background:none;">
    <div class="col-xl-7 ftco-animate cen-div  row ftco-section justify-content-center">
      <form action="#" class="billing-form" style="margin-top: 5%;">
        <h3 class="mb-4 billing-heading">Chi tiết</h3>
        <div class="row align-items-end" style="font-size: 16px;">
          <div class="d-flex flex-grow-1 row_input ">
            <div class="col-md-6 col_addprod">
              <div class="form-group">
                <label>Tên Khách Hàng</label>
                <p type="text" class="form-control input_addpr" placeholder="">Nguyễn Văn An Khang</p>
              </div>
            </div>
            <div class="col-md-6 col_addprod">
              <div class="form-group">
                <label>Password</label>
                <p type="text" class="form-control input_addpr" placeholder="">khangn23</p>
              </div>

            </div>
          </div>

          <div class="d-flex flex-grow-1 row_input ">
            <div class="col-md-6 col_addprod">
              <div class="form-group">
                <label>ID User</label>
                <input type="text" class="form-control input_addpr" placeholder="">
              </div>
            </div>
            <div class="col-md-6 col_addprod">
              <div class="form-group">
                <label>Email</label>
                <p type="text" class="form-control input_addpr" placeholder="">kahngan@hakjfskl.com</p>
              </div>
            </div>
            <div class="col-md-6 col_addprod">
              <div class="form-group">
                <label>Số điện thoại</label>
                <p  class="form-control input_addpr" placeholder="">0273872340</p>
              </div>
            </div>

          </div>
          <div class="col-md-12 ">
            <div class="form-group">
              <label>Địa chỉ</label>
              <p  class="form-control input_addpr" placeholder="">239 Lê Lợi, bình thạnh, tp.Hồ
                Chí Minh</p>
            </div>
          </div>
          <%--                    <div class="d-flex flex-grow-1 row_input ">--%>
          <%--                        <div class="col-md-6 col_addprod">--%>
          <%--                            <div class="form-group">--%>
          <%--                                <label>Đơn hàng</label>--%>
          <%--                                <input type="text" class="form-control input_addpr" placeholder="">--%>
          <%--                            </div>--%>
          <%--                        </div>--%>
          <%--                        <div class="col-md-6 col_addprod">--%>
          <%--                            <div class="form-group">--%>
          <%--                                <label>Thương hiệu</label>--%>
          <%--                                <input type="text" class="form-control input_addpr" placeholder="">--%>
          <%--                            </div>--%>
          <%--                        </div>--%>
          <%--                        <div class="col-md-6 col_addprod">--%>
          <%--                            <div class="form-group">--%>
          <%--                                <label>Trọng lượng</label>--%>
          <%--                                <input type="text" class="form-control input_addpr" placeholder="">--%>
          <%--                            </div>--%>
          <%--                        </div>--%>
          <%--                    </div>--%>
          <div class="col-md d-flex col_addprod">
            <div class="form-group  padd_right" style="">
              <label class="">Trạng thái:</label>
            </div>
            <div class="form-group  padd_right" style="">
              <input type="checkbox" class="form-" placeholder="">
              <label class="">User</label>
            </div>
            <div class="form-group padd_right " style="">
              <input type="checkbox" class="form-" placeholder="">
              <label class="">Admin</label>
            </div>
            <div class="form-group padd_right " style="">
              <input type="checkbox" class="form-" placeholder="">
              <label class="">Ẩn</label>
            </div>
          </div>

          <div class="col-md-12 d-flex btn_huy_update" style="justify-content: end;">
            <button onclick="huy()"><a href="#" class="btn btn-primary py-3 px-4"
                                       style="border-radius:5px; background: #7fad39; border: none;padding: 10px 40px !important;">Hủy</a>
            </button>
            <button><a href="#" class="btn btn-primary py-3 px-4"
                       style="border-radius:5px; background: #7fad39; border: none; padding: 10px 30px !important; margin-left: 20px">Cập
              nhật</a>
            </button>
          </div>
        </div>
      </form><!-- END -->
    </div>
  </div>

</div>
<%--        </div>--%>
<%--    </section>--%>
<!-- Button trigger modal -->

<!-- Modal -->

<script>
  function mo() {
    $(".edit_formUser").css("display", "block");
  }

  function huy() {
    $(".edit_formUser").css("display", "none");
  }
</script>

<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
        crossorigin="anonymous"></script>
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