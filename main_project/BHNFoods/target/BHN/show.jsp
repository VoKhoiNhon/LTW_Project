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
<%List<Product> list = (List<Product>) request.getAttribute("listRequest");%>
<%for(Product p: list) { %>
       <h3><%=p.getNamePr()%></h3>
        <h3 style="color: red"><%=p.getPrice()%></h3>
    <%}%>
</body>
</html>
