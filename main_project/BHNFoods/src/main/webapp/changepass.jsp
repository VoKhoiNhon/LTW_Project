<%@ page import="vn.edu.hcmuaf.fit.service.UserService" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Thay đổi mật khẩu </title>
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
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="admin_template/css/vertical-layout-light/style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

</head>

<body>
  <div class="container-scroller background">
    <!-- <img src="css/vertical-layout-light/hinh5.jpg" alt="" style="position: relative;"> -->
    <%
      String errorDup= (String) request.getAttribute("errorDup");
      String errorName=(String)  request.getAttribute("errorName");
      String errorCode = (String) request.getAttribute("errorName");
      String mess = (String) request.getAttribute("mess");

    %>
    <!-- partial -->
    <div style="padding: 0" class="container-fluid page-body-wrapper" >
      <div class="main-panel" style="    width: 100%;">
        <div class="content-wrapper">
        <div class="row">

          <div class="card" style=" margin:auto;">
            <div class="card-body">
                <p class="card-description">
                    <a href="login.jsp" style="text-decoration: none ; color: rgb(123, 123, 123);"> <i class="fa-solid fa-chevron-left"></i>Quay lại</a>
                   </p>
              <h4 class="card-title logoBHN">BHNFoods</h4>
              <p class="card-description login">
               Thay đổi mật khẩu
              </p>
              <form class="forms-sample" action="/BHNFoods/ForgotPass" method="post">
                <div class="form-group">
                  <label for="exampleInputName1">Email hoặc Số điện thoại</label>
                  <% if( errorName!=null){ %>
                  <label for="exampleInputName1" style="color: #CC3636"><%=errorName%></label>     <%}%>
                  <input type="text" name="checkUserName" class="form-control" id="exampleInputName1"
                         placeholder="Nhập Email hoặc số điện thoại" value="<%=request.getParameter("checkUserName")!=null?request.getParameter("checkUserName"):""%>">
                </div>
                <div class="form-group">
                  <label for="exampleInputName1">Mã xác nhận</label>
                  <% if( errorCode!=null){ %>
                  <label for="exampleInputName1" style="color: #CC3636"><%=errorCode%></label>     <%}%>
                  <input type="text" class="form-control" id="exampleInputName1" name="code"
                    placeholder="Nhập mã xác nhận">
                </div>

                <div class="form-group">
                    <label for="exampleInputPassword4">Tạo mật khẩu</label>
                    <input type="password" class="form-control" id="exampleInputPassword4" placeholder="Nhập mật khẩu mới" name="pass">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword4">Nhập lại mật khẩu</label> <% if( errorDup!=null){ %>
                    <label for="exampleInputName1" style="color: #CC3636"><%=errorDup%></label>
                    <%}%>
                    <input type="password" class="form-control" id="exampleInputPassword5" placeholder="Nhập lại mật khẩu" name="repass">
                  </div>
                <div class="form-group button_primary">
                  <button type="" onclick="mess(<%=mess%>)" class="btn btn-primary button_primary_height me-2" style="width: 60%;">Gửi mã xác nhận</button> </br>
                  <button type="submit" class="btn btn-primary  button_primary_height me-2" style="width: 60%;">Cập nhật lại tài khoản</button>
                </div>
                <div class="form-group forgot_pass" style="padding-bottom:30px;">
                  <a href="index.jsp" style="color:rgb(108, 108, 108) ;">Trang chủ</a>
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
  function mess(mess){
   <%System.out.println(mess);%>
  alert(mess);
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