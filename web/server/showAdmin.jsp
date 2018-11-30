<%@ page import="model.admin" %><%--
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
    <meta charset="UTF-8">
    <title>showAdmin</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
    <style>
        li{
            font-weight: initial;
            font-style: italic;
            font-family: 方正兰亭超细黑简体;
        }
    </style>
</head>
<body>
<%
    response.setCharacterEncoding("utf-8");
    request.setCharacterEncoding("utf-8");
    admin admin= (model.admin) session.getAttribute("admin");
%>
<div class="modal-body" style="text-align-all: center">
    <h2>管理员信息：</h2>
    <br>
    <ul>
        <li>ID:<%=admin.getId()%></li>
        <li>名字：<%=admin.getAdminname()%></li>
        <li>密码：<%=admin.getPassword()%></li>
    </ul>
</div>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>
</html>
