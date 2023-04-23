<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Đăng nhập </title>
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
<% String error = (String) request.getAttribute("error");
    String block = (String) request.getAttribute("block");
%>

<div class="container-scroller background">

    <!-- partial -->
    <div style="padding: 0" class="container-fluid page-body-wrapper">
        <div class="main-panel" style="    width: 100%;">
            <div class="content-wrapper">
                <div class="row">

                    <div class="card" style=" margin:auto;">
                        <div class="card-body">
                            <p class="card-description">
                                <a href="index.jsp" style="text-decoration: none ; color: rgb(112, 112, 112);"> <i
                                        class="fa-solid fa-chevron-left"></i>Quay lại</a>
                            </p>
                            <h4 class="card-title logoBHN">BHNFoods</h4>
                            <p class="card-description login">
                                Đăng nhập
                            </p>
                            <form class="forms-sample" action="/BHNFoods/Login" method="post">
                                <% if (error != null) { %>
                                <div class="form-group">
                                    <label for="exampleInputName1" style="color: #CC3636"><%=error%>
                                    </label>
                                </div>
                                <%}%>
                                <% if (block != null) {%>

                                <%}%>
                                <div class="form-group">
                                    <label for="exampleInputName1">Email hoặc Số điện thoại</label>
                                    <input type="text" class="form-control" name="username" id="exampleInputName1"
                                           placeholder="Nhập Email hoặc số điện thoại" required
                                           value="<%=request.getParameter("username")!=null?request.getParameter("username"):""%>">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword4">Mật khẩu</label>
                                    <input type="password" name="password" class="form-control"
                                           id="exampleInputPassword4" placeholder="Nhập mật khẩu">
                                </div>
                                <div class="">
                                    <a type="button"
                                       href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/BHNFoods/LoginGG&response_type=code
		                                 &client_id=209315281506-9itod9oiojmbqe56ri7567e6nqi2e181.apps.googleusercontent.com&approval_prompt=force">Đăng
                                        nhập với Google</a>
                                    <div class="fb-login-button" data-width="" data-size="small" data-button-type="login_with" data-layout="" data-auto-logout-link="" data-use-continue-as=""></div>                                      <%--   <a class="fb-login-button" href="https://www.facebook.com/dialog/oauth?client_id=223969136958408&redirect_uri=http://localhost:8080/BHNFoods/LoginFacebook">Đăng nhập với Facebook </a>--%>

                                </div>
                                <div class="form-group forgot_pass" style="padding-bottom:30px;">
                                    <a href="changepass.jsp">Quên mật khẩu?</a>
                                </div>
                                <div class="form-group  button_primary">
                                    <button type="submit" class="btn btn-primary  button_primary_height me-2">Đăng
                                        nhập
                                    </button>
                                    </br>
                                    <button style="padding: 0" type="submit"
                                            class="btn btn-primary  button_primary_height me-2"><a href="signup.jsp"
                                                                                                   style="color: #ffffff; width: 100%; height: 100%; padding: 14px 24px;">Đăng
                                        ký</a></button>
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


    function statusChangeCallback(response) {
        console.log('statusChangeCallback');
        console.log(response);
        if (response.status == 'connected') {
            testAPI();
        } else {
            document.getElementById('status').innerHTML = 'please log' + 'into this app';
        }
    }

    function checkLoginState() {
        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });


        FB.api('/me', {fields: 'birthday,name,email'}, function (response) {
            console.log(response);
            window.location.href = 'LoginFB?action=Face&name=' + response.name + '&email=' + response.email + '&id=' + response.id;
        });
    }


    window.fbAsyncInit = function () {
        FB.init({
            appId: '761456919098163',
            cookie: true,
            xfbml: true,
            version: 'v16.0'
        });
        FB.AppEvents.logPageView();
        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });
    };


    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {
            return;
        }
        js = d.createElement(s);
        js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));


    function testAPI() {
        console.log('welcome!');
        FB.api('/me', function (response) {
            console.log('Successfull login for:' + response.name);
            document.getElementById('status').innerHTML = 'thanks for login in,' + response.name;
        })
    }

</script>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
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