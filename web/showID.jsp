<%--
  Created by IntelliJ IDEA.
  User: 16051
  Date: 2018/10/31
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>showID</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String id=request.getParameter("id");
    String pwd=request.getParameter("pwd");
    out.println("id:"+id+"<br>");
    out.print("pwd:"+pwd);
%>

</body>
</html>
