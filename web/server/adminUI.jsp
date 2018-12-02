<%@ page import="model.admin" %><%--
  Created by IntelliJ IDEA.
  User: 16051
  Date: 2018/11/28
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="../css/bootstrap.min.css" rel="stylesheet"/>
    <link href="../css/style.css" rel="stylesheet"/>
    <title>网上书店</title>
</head>
<body  onload="initAJAX()">
<script src="../js/jquery.min.js" ></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/commons.js"></script>
<%
    response.setCharacterEncoding("utf-8");
    request.setCharacterEncoding("utf-8");
    admin admin= (model.admin) session.getAttribute("admin");
%>
<div class="header">
    <div class="container">
        <div class="row">
            <div class="login span4">
                <h1>欢迎来到书店<strong>后台管理</strong>
                    <span class="red">.</span></h1>
            </div>
            <div class="links span8">
                <a  href='showAdmin.jsp' rel="tooltip"  data-
                   placement="bottom" data-toggle="modal" data-target="#myModal"
                ><%=admin.getAdminname()%></a>
                <a  href="admin.html" rel="tooltip" data-placement="bottom"
                   data-toggle="modal" data-target="#myModal">注销</a>
            </div>
        </div>
    </div>
</div> <%--header--%>
<div class="row"> <%--下方左右div控制--%>
    <div class="col-md-3"> <%--左侧菜单div控制--%>
        <ul class="nav nav-list">
            <li class="nav-header" style="font-size: large;font-style: oblique;font-weight: bold">后台功能</li>
            <br>
            <li class="nav-header">全部用户订单</li>
            <li><a href='javascript:setIframe("getInitOrder.jsp")' >初始订单</a> </li>
            <li><a href='javascript:setIframe("getFinishOrder.jsp")'>已完成订单</a> </li>
            <li class="nav-header">用户信息查询</li>
            <li><a href='javascript:setIframe("getUser.jsp")'>用户信息查询</a> </li>
            <li class="nav-header">书籍信息</li>
            <li><a href='javascript:setIframe("getBook.jsp")'>书籍信息查询</a></li>
            <li><a href='javascript:setIframe("updateBook.jsp")'>书籍信息修改</a> </li>
            <li><a href='javascript:setIframe("addBook.jsp")'>书籍信息输入</a> </li>
        </ul>
    </div><%--左侧菜单div控制--%>

    <div class="col-md-9" id="book"><%--书籍布局控制--%>
        <iframe id="iframe1" width="100%" height="100%">

        </iframe>
    </div>
</div><%--下方左右div控制--%>
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header"></div>
            <div class="modal-body"></div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>
<script src="../js/bgDataQuery.js"></script>
<script>
    function setIframe(url) {
        document.getElementById("iframe1").src=url;
    }

</script>
</body>
</html>

