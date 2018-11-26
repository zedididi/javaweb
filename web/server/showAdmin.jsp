<%@ page import="vo.admin" %><%--
  Created by IntelliJ IDEA.
  User: 16051
  Date: 2018/11/25
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%--获取管理员信息并输出到后台页面--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    response.setCharacterEncoding("utf-8");
    request.setCharacterEncoding("utf-8");
    admin admin= (vo.admin) session.getAttribute("admin");
    //out.print("admin "+admin.toString());
%>
<div class="caption" style="text-align-all: center">
    <h2>管理员信息：</h2>
    <br>
    <ul>
        <li>ID:<%=admin.getId()%></li>
        <li>名字：<%=admin.getAdminname()%></li>
        <li>密码：<%=admin.getPassword()%></li>
    </ul>
</div>

</body>
</html>
