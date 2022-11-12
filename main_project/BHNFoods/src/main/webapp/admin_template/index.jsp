<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>BHNFoods Admin </title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="vendors/feather/feather.css">
  <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="vendors/typicons/typicons.css">
  <link rel="stylesheet" href="vendors/simple-line-icons/css/simple-line-icons.css">
  <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="js/select.dataTables.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

</head>

<body>
  <!-- partial:partials/_navbar.html -->
  <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row">
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
      <div class="me-3">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-bs-toggle="minimize">
          <span class="icon-menu"></span>
        </button>
      </div>
      <div>
        <a class="navbar-brand brand-logo" href="index.html">
          BHNFoods
        </a>
      </div>
    </div>
    <div class="navbar-menu-wrapper d-flex align-items-top colorheader ">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item dropdown d-none d-lg-block">
          <a class="nav-link dropdown-bordered dropdown-toggle dropdown-toggle-split" id="messageDropdown" href="#"
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
        <li class="nav-item dropdown">
          <a class="nav-link count-indicator" id="notificationDropdown" href="#" data-bs-toggle="dropdown">
            <i class="icon-mail icon-lg"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0"
            aria-labelledby="notificationDropdown">
            <a class="dropdown-item py-3 border-bottom">
              <p class="mb-0 font-weight-medium float-left">Bạn có 3 thông báo mới </p>
              <span class="badge badge-pill badge-primary float-right">Xem tất cả</span>
            </a>
            <a class="dropdown-item preview-item py-3">
              <div class="preview-thumbnail">
                <i class="mdi mdi-alert m-auto text-primary"></i>
              </div>
              <div class="preview-item-content">
                <h6 class="preview-subject fw-normal text-dark mb-1">Lỗi ứng dụng</h6>
                <p class="fw-light small-text mb-0"> Vừa rồi </p>
              </div>
            </a>
            <a class="dropdown-item preview-item py-3">
              <div class="preview-thumbnail">
                <i class="mdi mdi-settings m-auto text-primary"></i>
              </div>
              <div class="preview-item-content">
                <h6 class="preview-subject fw-normal text-dark mb-1">Cài đặt</h6>
                <p class="fw-light small-text mb-0"> Tin nhắn riêng </p>
              </div>
            </a>
            <a class="dropdown-item preview-item py-3">
              <div class="preview-thumbnail">
                <i class="mdi mdi-airballoon m-auto text-primary"></i>
              </div>
              <div class="preview-item-content">
                <h6 class="preview-subject fw-normal text-dark mb-1">Đăng kí người dùng mới</h6>
                <p class="fw-light small-text mb-0">2 ngày trước </p>
              </div>
            </a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link count-indicator" id="countDropdown" href="#" data-bs-toggle="dropdown"
            aria-expanded="false">
            <i class="icon-bell"></i>
            <span class="count"></span>
          </a>
          <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0"
            aria-labelledby="countDropdown">
            <a class="dropdown-item py-3">
              <p class="mb-0 font-weight-medium float-left">Bạn có 7 thông báo chưa đọc </p>
              <span class="badge badge-pill badge-primary float-right">Xem tất cả</span>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item preview-item">
              <div class="preview-thumbnail">
                <img src="images/faces/face10.jpg" alt="image" class="img-sm profile-pic">
              </div>
              <div class="preview-item-content flex-grow py-2">
                <p class="preview-subject ellipsis font-weight-medium text-dark">Võ Khôi Nhơn </p>
                <p class="fw-light small-text mb-0"> Cuộc họp bị hủy </p>
              </div>
            </a>
            <a class="dropdown-item preview-item">
              <div class="preview-thumbnail">
                <img src="images/faces/face12.jpg" alt="image" class="img-sm profile-pic">
              </div>
              <div class="preview-item-content flex-grow py-2">
                <p class="preview-subject ellipsis font-weight-medium text-dark">Phạm Gia Bảo </p>
                <p class="fw-light small-text mb-0">  Cuộc họp bị hủy </p>
              </div>
            </a>
            <a class="dropdown-item preview-item">
              <div class="preview-thumbnail">
                <img src="images/faces/face1.jpg" alt="image" class="img-sm profile-pic">
              </div>
              <div class="preview-item-content flex-grow py-2">
                <p class="preview-subject ellipsis font-weight-medium text-dark">Nguyễn Thị Xuân Hoa </p>
                <p class="fw-light small-text mb-0">  Cuộc họp bị hủy </p>
              </div>
            </a>
          </div>
        </li>
        <li class="nav-item dropdown d-none d-lg-block user-dropdown">
          <a class="nav-link" id="UserDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
            <img class="img-xs rounded-circle" src="images/faces/face8.jpg" alt="Profile image"> </a>
          <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
            <div class="dropdown-header text-center">
              <img class="img-md rounded-circle" src="images/faces/face8.jpg" alt="Profile image">
              <p class="mb-1 mt-3 font-weight-semibold">Võ Khôi Nhơn</p>
              <p class="fw-light text-muted mb-0">Nhonw@gmail.com</p>
            </div>
            <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-account-outline text-primary me-2"></i> Trang cá nhân<span class="badge badge-pill badge-danger">1</span></a>
            <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-message-text-outline text-primary me-2"></i>
              Tin nhắn</a>
            <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-calendar-check-outline text-primary me-2"></i>
              Hoạt động</a>
            <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-help-circle-outline text-primary me-2"></i>
              Các câu hỏi thường gặp</a>
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
      <ul class="nav">
        <li class="nav-item">
          <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
            <i class="menu-icon mdi mdi-home"></i>
            <span class="menu-title">Trang chủ</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
            <i class="menu-icon mdi mdi-account-circle"></i>
            <span class="menu-title">Quản lý người dùng</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
            <i class="menu-icon mdi mdi-view-module"></i>
            <span class="menu-title">Quản lý sản phẩm</span>
          </a>
        </li>
      </ul>
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
                    <a class="nav-link active ps-0" id="home-tab" data-bs-toggle="tab" href="#overview" role="tab"
                      aria-controls="overview" aria-selected="true">Tổng quan</a>
                  </li>
                 
                </ul>
                <div>
                  <div class="btn-wrapper">
                    <a href="#" class="btn btn-otline-dark align-items-center"><i class="icon-share"></i> Chia sẻ</a>
                    <a href="#" class="btn btn-otline-dark"><i class="icon-printer"></i> In</a>
                    <a href="#" class="btn btn-primary text-white me-0"><i class="icon-download"></i> Xuất</a>
                  </div>
                </div>
              </div>
              <div class="tab-content tab-content-basic">
                <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview">
                  <div class="row">
                    <div class="col-lg-8 d-flex flex-column">
                      <div class="row flex-grow">
                        <div class="col-12 grid-margin stretch-card">
                          <div class="card card-rounded">
                            <div class="card-body">
                              <div class="d-sm-flex justify-content-between align-items-start">
                                <div>
                                  <h4 class="card-title card-title-dash">Yêu cầu đang xử lý</h4>
                                  <p class="card-subtitle card-subtitle-dash">Bạn có 50+ yêu cầu mới</p>
                                </div>
                                <div>
                                  <h4 class="card-title card-title-dash">Sửa <i class="fa-regular fa-pen-to-square"></i></h4>
                                  <!-- <p class="card-subtitle card-subtitle-dash">Bạn có 50+ yêu cầu mới</p> -->
                                </div>
                              </div>
                              <div class="table-responsive  mt-1">
                                <table class="table select-table">
                                  <thead>
                                    <tr>
                                      <th>
                                        <div class="form-check form-check-flat mt-0">
                                          <label class="form-check-label">
                                            <input type="checkbox" class="form-check-input" aria-checked="false"><i
                                              class="input-helper"></i></label>
                                        </div>
                                      </th>
                                      <th>Khách hàng</th>
                                      <th>Số điện thoại và Email</th>
                                      <th></th>
                                      <th>Tên tài khoản</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td>
                                        <div class="form-check form-check-flat mt-0">
                                          <label class="form-check-label">
                                            <input type="checkbox" class="form-check-input" aria-checked="false"><i
                                              class="input-helper"></i></label>
                                        </div>
                                      </td>
                                      <td>
                                        <div class="d-flex ">
                                          <img src="images/faces/face1.jpg" alt="">
                                          <div>
                                            <h6>Võ Khôi Nhơn</h6>
                                            <p>Admin</p>
                                          </div>
                                        </div>
                                      </td>
                                      <td>
                                        <h6>079548822</h6>
                                        <p>nhonw@gmail.commm</p>
                                      </td>
                                      <td>
<%--                                        <div>--%>
<%--                                          <div--%>
<%--                                            class="d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap">--%>
<%--                                            <p class="text-success">79%</p>--%>
<%--                                            <p>85/162</p>--%>
<%--                                          </div>--%>
<%--                                          <div class="progress progress-md">--%>
<%--                                            <div class="progress-bar bg-success" role="progressbar" style="width: 85%"--%>
<%--                                              aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>--%>
<%--                                          </div>--%>
<%--                                        </div>--%>
                                      </td>
                                      <td>
                                        <div class="">NhonVo</div>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <div class="form-check form-check-flat mt-0">
                                          <label class="form-check-label">
                                            <input type="checkbox" class="form-check-input" aria-checked="false"><i
                                              class="input-helper"></i></label>
                                        </div>
                                      </td>
                                      <td>
                                        <div class="d-flex">
                                          <img src="images/faces/face2.jpg" alt="">
                                          <div>
                                            <h6>Lê Bảo Đặng</h6>
                                            <p>Người dùng</p>
                                          </div>
                                        </div>
                                      </td>
                                      <td>
                                        <h6>037864222</h6>
                                        <p>baodang@gmail.com</p>
                                      </td>
                                      <td>
<%--                                        <div>--%>
<%--                                          <div--%>
<%--                                            class="d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap">--%>
<%--                                            <p class="text-success">65%</p>--%>
<%--                                            <p>85/162</p>--%>
<%--                                          </div>--%>
<%--                                          <div class="progress progress-md">--%>
<%--                                            <div class="progress-bar bg-success" role="progressbar" style="width: 65%"--%>
<%--                                              aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>--%>
<%--                                          </div>--%>
<%--                                        </div>--%>
                                      </td>
                                      <td>
                                        <div class="">LebaoDang</div>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <div class="form-check form-check-flat mt-0">
                                          <label class="form-check-label">
                                            <input type="checkbox" class="form-check-input" aria-checked="false"><i
                                              class="input-helper"></i></label>
                                        </div>
                                      </td>
                                      <td>
                                        <div class="d-flex">
                                          <img src="images/faces/face3.jpg" alt="">
                                          <div>
                                            <h6>Dương Thanh Phụng</h6>
                                            <p>Người dùng</p>
                                          </div>
                                        </div>
                                      </td>
                                      <td>
                                        <h6>026346848</h6>
                                        <p>phung@email.com</p>
                                      </td>
                                      <td>
<%--                                        <div>--%>
<%--                                          <div--%>
<%--                                            class="d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap">--%>
<%--                                            <p class="text-success">65%</p>--%>
<%--                                            <p>85/162</p>--%>
<%--                                          </div>--%>
<%--                                          <div class="progress progress-md">--%>
<%--                                            <div class="progress-bar bg-warning" role="progressbar" style="width: 38%"--%>
<%--                                              aria-valuenow="38" aria-valuemin="0" aria-valuemax="100"></div>--%>
<%--                                          </div>--%>
<%--                                        </div>--%>
                                      </td>
                                      <td>
                                        <div class="">ThanhPhung</div>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <div class="form-check form-check-flat mt-0">
                                          <label class="form-check-label">
                                            <input type="checkbox" class="form-check-input" aria-checked="false"><i
                                              class="input-helper"></i></label>
                                        </div>
                                      </td>
                                      <td>
                                        <div class="d-flex">
                                          <img src="images/faces/face4.jpg" alt="">
                                          <div>
                                            <h6>Phan Thị Quỳnh Như</h6>
                                            <p>Người dùng</p>
                                          </div>
                                        </div>
                                      </td>
                                      <td>
                                        <h6>023476572</h6>
                                        <p>nhuw@gmail.com</p>
                                      </td>
                                      <td>
<%--                                        <div>--%>
<%--                                          <div--%>
<%--                                            class="d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap">--%>
<%--                                            <p class="text-success">65%</p>--%>
<%--                                            <p>85/162</p>--%>
<%--                                          </div>--%>
<%--                                          <div class="progress progress-md">--%>
<%--                                            <div class="progress-bar bg-danger" role="progressbar" style="width: 15%"--%>
<%--                                              aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>--%>
<%--                                          </div>--%>
<%--                                        </div>--%>
                                      </td>
                                      <td>
                                        <div class="">QuynhNhuw</div>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <div class="form-check form-check-flat mt-0">
                                          <label class="form-check-label">
                                            <input type="checkbox" class="form-check-input" aria-checked="false"><i
                                              class="input-helper"></i></label>
                                        </div>
                                      </td>
                                      <td>
                                        <div class="d-flex">
                                          <img src="images/faces/face5.jpg" alt="">
                                          <div>
                                            <h6>Nguyễn Thị Xuân Hoa</h6>
                                            <p>Người dùng</p>
                                          </div>
                                        </div>
                                      </td>
                                      <td>
                                        <h6>077984872</h6>
                                        <p>poong@gmail.com</p>
                                      </td>
                                      <td>
<%--                                        <div>--%>
<%--                                          <div--%>
<%--                                            class="d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap">--%>
<%--                                            <p class="text-success">65%</p>--%>
<%--                                            <p>85/162</p>--%>
<%--                                          </div>--%>
<%--                                          <div class="progress progress-md">--%>
<%--                                            <div class="progress-bar bg-success" role="progressbar" style="width: 65%"--%>
<%--                                              aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>--%>
<%--                                          </div>--%>
<%--                                        </div>--%>
                                      </td>
                                      <td>
                                        <div class="">XuanHoa</div>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <div class="form-check form-check-flat mt-0">
                                          <label class="form-check-label">
                                            <input type="checkbox" class="form-check-input" aria-checked="false"><i
                                              class="input-helper"></i></label>
                                        </div>
                                      </td>
                                      <td>
                                        <div class="d-flex">
                                          <img src="images/faces/face5.jpg" alt="">
                                          <div>
                                            <h6>Phạm Gia Bảo</h6>
                                            <p>Admin</p>
                                          </div>
                                        </div>
                                      </td>
                                      <td>
                                        <h6>0772376872</h6>
                                        <p>baotaolao@gmail.com</p>
                                      </td>
                                      <td>
<%--                                        <div>--%>
<%--                                          <div--%>
<%--                                            class="d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap">--%>
<%--                                            <p class="text-success">65%</p>--%>
<%--                                            <p>85/162</p>--%>
<%--                                          </div>--%>
<%--                                          <div class="progress progress-md">--%>
<%--                                            <div class="progress-bar bg-success" role="progressbar" style="width: 65%"--%>
<%--                                              aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>--%>
<%--                                          </div>--%>
<%--                                        </div>--%>
                                      </td>
                                      <td>
                                        <div class="">BaoHayQua12</div>
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
      <!-- content-wrapper ends -->
    </div>
    <!-- main-panel ends -->
  </div>
  <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

  <!-- plugins:js -->
  <script src="vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="vendors/chart.js/Chart.min.js"></script>
  <script src="vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
  <script src="vendors/progressbar.js/progressbar.min.js"></script>

  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <script src="js/settings.js"></script>
  <script src="js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="js/jquery.cookie.js" type="text/javascript"></script>
  <script src="js/dashboard.js"></script>
  <script src="js/Chart.roundedBarCharts.js"></script>
  <!-- End custom js for this page-->
</body>

</html>