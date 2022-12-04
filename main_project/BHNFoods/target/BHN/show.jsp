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
<%for(int i = 0; i < 20; i++) { %>
       <h3><%=list.get(i).getNamePro()%></h3>
    <%}%>
</body>
</html>
