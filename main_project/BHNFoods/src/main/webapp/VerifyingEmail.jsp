<%@ page import="vn.edu.hcmuaf.fit.beans.User" %>
<%@ page import="vn.edu.hcmuaf.fit.service.UserService" %><%--
  Created by IntelliJ IDEA.
  User: baota
  Date: 06/03/2023
  Time: 23:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Verify</title>
</head>
<body>
<style>
    form {
        display: flex;
        flex-direction: column;
        width: 300px;
        margin: auto;
        align-items: center;
    }

    input {
        margin-bottom: 8px;
    }
</style>
</head>

<body>

<%String timeOut = (String) request.getAttribute("outOfTime");%>


<%if(timeOut != null) {%>
<div style="text-align: center">
        <h2>Đã quá thời gian xác nhận, vui lòng thực hiện lại chức năng quên mật khẩu</h2>
        <a style="text-decoration: none; color: black; padding: 8px; background: #f4ffe3" href="login.jsp">OK</a>
</div>
<%} else {%>
<%User user = UserService.getInstance().getUserById(request.getParameter("userId"));
session.setAttribute("userId", user.getIdUser());%>
<form action="/verifyingEmail" method="post" id="changePassForm">
    <h2>Cảm ơn bạn đã xác thực</h2>
    <input disabled value="<%=user.getEmail()%>">
    <input style="display: none" value="<%=user.getEmail()%>">
    <input id="newPassword" type="password" placeholder="Nhập mật khẩu mới">
    <input id="confirmNewPassword" name="pass" type="password" placeholder="Xác nhận lại mật khẩu mới">
    <button type="submit">Đổi mật khẩu</button>
</form>
<%}%>
</body>

<script>
    document.getElementById('changePassForm').addEventListener('submit', function(event) {
        var newPassword = document.getElementById('newPassword')
        var confirmNewPassword = document.getElementById('confirmNewPassword')

        if (newPassword.value.length == 0 || confirmNewPassword.value.length == 0) {
            event.preventDefault();
            alert('Vui lòng nhập đầy đủ thông tin.');
        } else if (newPassword.value != confirmNewPassword.value) {
            event.preventDefault();
            alert('Mật khẩu mới không trùng khớp. Vui lòng kiểm tra lại.');
        }
    });
</script>
</body>
</html>
