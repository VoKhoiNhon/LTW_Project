<%@ page import="java.awt.*" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Product" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: XUAN HOA
  Date: 04/12/2022
  Time: 5:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<button onclick="downloadFile()">ExportPDF</button>
<button onclick="downloadFileEX()">ExportEx</button>
<script>
    function downloadFileEX() {

        window.location.href = "/BHNFoods/ExportUserExcel";
    }
    function downloadFile() {
        window.location.href = "/BHNFoods/ExportUserPDF";
    }
</script>
<script>
    function downloadFile() {
        window.location.href = "/BHNFoods/ExportLogPDF";
    }
</script>
</body>
</html>
