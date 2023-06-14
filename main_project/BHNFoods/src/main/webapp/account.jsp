<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>BHNFoods | Tài khoản</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
          rel="stylesheet">

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
    .padding_account {
        padding: 3rem 0;
        background: #bdbdbd70;
    }

    .edit_FormAccout {
        margin: 40px 10px;
    }


</style>

<body>
<%@include file="header.jsp" %>
<% String error = (String) request.getAttribute("error");
   String birthday= (String) request.getAttribute("birthday");
%>

<section class="ftco-section padding_account">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-7 ftco-animate" style="background: white">
                <form action="/BHNFoods/UpdateCtAccount" method="post" class="billing-form edit_FormAccout">
                    <h3 class="mb-4 billing-heading">Tài khoản</h3>
                    <% List<User> list = (List<User>) request.getAttribute("listCtAccount");
                        for (User u : list) {
                            System.out.println( list);
                    %>
                    <div class="row align-items-end" style="font-size: 20px;">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Họ và Tên</label>
                                <input type="text" name="name" class="form-control" placeholder="Nhập họ tên đầy đủ"
                                       value="<%=u.getNameUser()%>">
                            </div>

                            <div class="form-group" style="display: none">
                                <label>iduser</label>
                                <input type="text" name="iduser" class="form-control" placeholder="Nhập họ tên đầy đủ"
                                       value="<%=u.getIdUser()%>">
                            </div>
                        </div>
                        <div class="col-md-6 d-flex">
                            <label for="">Giới tính</label>
                            <%if(!user.getSex()) {%>
                            <div class="form-group" style="margin-left: 40px;">
                                <input type="radio" name="sex" checked value="1">
                                <label for="">Nữ</label>
                            </div>
                            <div class="form-group" style="margin-left: 40px;">
                                <input type="radio" name="sex" value="0">
                                <label for="">Nam</label>
                            </div>
                            <%} else {%>
                            <div class="form-group" style="margin-left: 40px;">
                                <input type="radio" name="sex" value="1" >
                                <label for="">Nữ</label>
                            </div>
                            <div class="form-group" style="margin-left: 40px;">
                                <input type="radio" name="sex" checked value="0" >
                                <label for="">Nam</label>
                            </div>
                            <%}%>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Ngày sinh</label>
                                <%if(birthday !=null){%>
                                <label style="color:#e03e2d;"><%=birthday%></label>
                                <%}else {%>
                                <div class="select-wrap">
                                    <input type="date" name="birthday" id="" class="form-control" value="<%=u.getBirthday()%>" placeholder="">
                                </div>
                                <%}%>
                            </div>
                        </div>
                        <div class="d-flex flex-grow-1">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Số điện thoại</label>
                                    <input type="text" name="phone" class="form-control"  value="<%=u.printCtAccount(u.getPhone())%>" placeholder="">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="text" class="form-control" name="email"  value="<%=u.printCtAccount(u.getEmail())%>" placeholder="">
                                </div>
                            </div>
                        </div>
                        <div class="d-flex flex-grow-1">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Tạo mật khẩu mới</label>
                                    <input type="password" class="form-control" name="passw"
                                           placeholder="Nhập mật khẩu mới" value="">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <%if(error !=null){%>
                                    <label style="color:#e03e2d;"><%=error%></label>
                                    <%}%>
                                    <label>Nhập lại mật khẩu</label>
                                    <input type="password" name="repassw" class="form-control" placeholder="Nhập lại mật khẩu">

                                </div>
                            </div>
                        </div>
                        <div class="w-100"></div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Địa chỉ</label>
                                <div class="select-wrap">
                                    <input name="address" class="form-control" placeholder="" value="<%=u.printCtAccount(u.getAddress())%>">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 d-flex" style="justify-content: end;">
                            <input type="submit"  onclick="validateInput(event)" class="btn btn-primary" value="Cập nhật"
                                   style="border-radius:5px; background: #7fad39; border: none;">
                        </div>
                    </div>
                    <%}%>
                </form><!-- END -->
            </div>
        </div>
    </div>
</section>


<!-- Footer Section End -->

<!-- Js Plugins -->

<%@include file="footer.jsp" %>
<script>
    function validateInput(event) {
        const input = document.getElementById('pass').value;
        if (input.length < 8) {
            alert('Vui lòng nhập mật khẩu đủ 8 kí tự');
            event.preventDefault(); // Ngăn không cho form submit
        }
    }
</script>
</body>

</html>