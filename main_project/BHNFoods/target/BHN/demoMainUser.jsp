<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>BHNFoods | Trang chủ</title>
  <link rel="stylesheet" href="admin_template/vendors/feather/feather.css">
  <link rel="stylesheet" href="admin_template/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="admin_template/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="admin_template/vendors/typicons/typicons.css">
  <link rel="stylesheet" href="admin_template/vendors/simple-line-icons/css/simple-line-icons.css">
  <link rel="stylesheet" href="admin_template/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="admin_template/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="admin_template/js/select.dataTables.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="admin_template/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
</head>

<body>

<%@ include file="headerUser.jsp" %>

<section class="ftco-section img" style="background-image: url(images/anhbackgr1.png); border-bottom:1px solid #82ae46; border-top: 1px solid #82ae46; ">
  <div class="container">
    <%--        <div class="row justify-content-end">--%>
    <div class="col-md-6 heading-section ftco-animate deal-of-the-day ftco-animate "style= "margin-left:auto">
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
        <%--                </div>--%>
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
            <span>Trong 10km</span>
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
          <a href="#" class="img-prod"><img class="img-fluid" src="ImageproductNew/Bot/Bot-bap-meizan/bot-bap-meizan1.jpg"
                                            alt="Colorlib Template">
            <span class="status">30%</span>
            <div class="overlay"></div>
          </a>
          <div class="text py-3 pb-4 px-3 text-center">
            <h3><a href="#">Bột bắp Meizan</a></h3>
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
          <a href="#" class="img-prod"><img class="img-fluid" src="ImageproductNew/Dau/bap-hat-dong-lanh-mama-food-goi-250g-202205171021267119_300x300.png"
                                            alt="Colorlib Template">
            <div class="overlay"></div>
          </a>
          <div class="text py-3 pb-4 px-3 text-center">
            <h3><a href="#">Bắp hạt đông lạnh</a></h3>
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
          <a href="#" class="img-prod"><img class="img-fluid" src="ImageproductNew/Khoai/bap-my/bap-my-sieu-ngot-coop-300x300.jpg"
                                            alt="Colorlib Template">
            <div class="overlay"></div>
          </a>
          <div class="text py-3 pb-4 px-3 text-center">
            <h3><a href="#">Ngô Mỹ</a></h3>
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
          <a href="#" class="img-prod"><img class="img-fluid" src="ImageproductNew/Nep/nep-bac-viet-san-tui-1kg-202103040810147166_300x300.jpg"
                                            alt="Colorlib Template">
            <div class="overlay"></div>
          </a>
          <div class="text py-3 pb-4 px-3 text-center">
            <h3><a href="#">Nếp Bắc</a></h3>
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

</body>
</html>
