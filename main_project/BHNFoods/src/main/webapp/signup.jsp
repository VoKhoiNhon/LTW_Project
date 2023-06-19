<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Đăng kí </title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="admin_template/vendors/feather/feather.css">
  <link rel="stylesheet" href="admin_template/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="admin_template/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="admin_template/vendors/typicons/typicons.css">
  <link rel="stylesheet" href="admin_template/vendors/simple-line-icons/css/simple-line-icons.css">
  <link rel="stylesheet" href="admin_template/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="admin_template/vendors/select2/select2.min.css">
  <link rel="stylesheet" href="admin_template/vendors/select2-bootstrap-theme/select2-bootstrap.min.css">

  <link rel="stylesheet" href="admin_template/css/vertical-layout-light/style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  <style>
    .container-scroller .main-panel .forms-sample .form-group .form-control{
      height: 38px;
      border: 1px solid #D0D0D0;
      font-size: 17px;
    }
  </style>
</head>

<body>
<%
  String errorAcc= (String) request.getAttribute("errorAcc");
  String errorDup= (String) request.getAttribute("errorDup");

%>
<div class="container-scroller background ">
  <!-- <img src="css/vertical-layout-light/hinh5.jpg" alt="" style="position: relative;"> -->

  <!-- partial -->
  <div class="container-fluid page-body-wrapper" style=" padding-top: 0px;" >
    <div class="main-panel" style="    width: 100%;">
      <div class="content-wrapper">

        <div class="row">

          <div class="card" style=" margin:auto; width: 25rem;">
            <div class="card-body">
              <p class="card-description">
                <a href="login.jsp" style="text-decoration: none ; color: rgb(123, 123, 123);"> <i class="fa-solid fa-chevron-left"></i>Quay lại</a>
              </p>
              <h4 class="card-title logoBHN">BHNFoods</h4>
              <p class="card-description login">
                Đăng ký
              </p>
              <form class="forms-sample" action="/SignUp" method="post">
                <% if( errorAcc!=null){ %>
                <label for="exampleInputName1" style="color: #CC3636"><%=errorAcc%></label>
                <%}%>
                <div class="form-group">
                  <label for="exampleInputName1">Họ và tên  </label>

                  <input type="text" name="fullName" class="form-control" id="exampleInputName1"
                         placeholder="Nhập đầy đủ họ tên" required value="<%=request.getParameter("fullName")!=null?request.getParameter("fullName"):""%>">
                </div>
                <div class="form-group">
                  <label for="exampleInputName1">Địa chỉ Email</label>
                  <input type="email" name="email" class="form-control" id="exampleInputName1"
                         placeholder="Nhập Email" required value="<%=request.getParameter("email")!=null?request.getParameter("email"):""%>">
                </div>
                <div class="form-group">
                  <label for="exampleInputName1">Số điện thoại</label>
                  <input type="text" name="phone" class="form-control" id="exampleInputName1"
                         placeholder="Nhập số điện thoại" required value="<%=request.getParameter("phone")!=null?request.getParameter("phone"):""%>">
                </div>

                <div class="form-group">
                  <label for="exampleInputPassword4">Tạo mật khẩu</label>
                  <input type="password" name="pass" class="form-control" id="pass" placeholder="Nhập mật khẩu mới">
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword4">Nhập lại mật khẩu</label>
                  <% if( errorDup!=null){ %>
                  <label for="exampleInputName1" style="color: #CC3636"><%=errorDup%></label>
                  <%}%>
                  <input type="password"name="repass" class="form-control" id="exampleInputPassword4" placeholder="Nhập lại mật khẩu">
                </div>
                <div class="form-group button_primary">
                  <button type="submit" onclick="validateInput(event)" style="margin-bottom: 0" class="btn btn-primary  button_primary_height me-2" >Tạo tài khoản</button>
                </div>
                <div class="form-group forgot_pass" style="padding-bottom:30px;">
                  <a href="index.jsp" style="color:rgb(119, 119, 119) ;">Trang chủ</a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

</div>

<script>
  function validateInput(event) {
    const input = document.getElementById('pass').value;
    if (input.length < 8) {
      alert('Vui lòng nhập mật khẩu đủ 8 kí tự');
      event.preventDefault(); // Ngăn không cho form submit
    }
  }
</script>

<script src="admin_template/vendors/js/vendor.bundle.base.js"></script>

<script src="admin_template/vendors/typeahead.js/typeahead.bundle.min.js"></script>
<script src="admin_template/vendors/select2/select2.min.js"></script>
<script src="admin_template/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>

<script src="admin_template/js/off-canvas.js"></script>
<script src="admin_template/js/hoverable-collapse.js"></script>
<script src="admin_template/js/template.js"></script>
<script src="admin_template/js/settings.js"></script>
<script src="admin_template/js/todolist.js"></script>

<script src="admin_template/js/file-upload.js"></script>
<script src="admin_template/js/typeahead.js"></script>
<script src="admin_template/js/select2.js"></script>

</body>

</html>