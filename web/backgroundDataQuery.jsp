<%@ page import="model.admin" %><%--
  Created by IntelliJ IDEA.
  User: 16051
  Date: 2018/11/25
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>backgroundDataQuery</title>
</head>
<body>
<%
    response.setCharacterEncoding("utf-8");
    request.setCharacterEncoding("utf-8");
    admin admin= (model.admin) session.getAttribute("admin");
    out.print("admin "+admin.toString());
%>

</body>
</html>
