<%@ page import="model.admin" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="dao.getConn" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 16051
  Date: 2018/11/25
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%--后台管理页面--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>backgroundDataQuery</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
    <style>
        col-md-3
    </style>
</head>
<body onload="initAJAX()">
<%
    response.setCharacterEncoding("utf-8");
    request.setCharacterEncoding("utf-8");
    admin admin= (model.admin) session.getAttribute("admin");
    //out.print("admin "+admin.toString());
%>
<div class="header">
    <div class="container">
        <div class="row">
            <div class="login span4">
                <h1><a href=""> 欢迎来到书店<strong>后台管理</strong></a>
                    <span class="red">.</span></h1>
            </div>
            <div class="links span8">
                <a href='javascript:showAdmin()'  ><%=admin.getAdminname()%></a>
                <a href="admin.html" rel="tooltip" data-placement="bottom" data-toggle="modal" data-target="#myModal" >注销</a>
            </div>
        </div>
    </div>
</div> <%--header--%>
<div class="row"> <%--下方左右div控制--%>
    <div class="col-md-3"> <%--左侧菜单div控制--%>
        <ul class="nav nav-list">
            <li class="nav-header" style="font-size: large;font-style: oblique;font-weight: bold">后台功能</li>
            <br>
            <%--<%

                String sql="select id,name,description from category";
                Connection conn=new getConn().getConn();
                Statement stat=conn.createStatement();
                ResultSet rs=stat.executeQuery(sql);
                while (rs.next())
                {
            %>
            <li>
                <a href='javascript:showBook("<%=rs.getString("id")%>")'><%=rs.getString("name")%></a>
            </li>
            <%
                }
                stat.close();
                conn.close();
            %>--%>
            <li class="nav-header">全部用户订单</li>
            <li><a href="../no.html" target="book">初始订单</a> </li>
            <li><a href="../no.html">已完成订单</a> </li>
            <li class="nav-header">用户信息查询</li>
            <li><a href='javascript:getUser()'>用户信息查询</a> </li>
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
<script src="../js/bootstrap.min.js"></script>
<script src="../js/commons.js"></script>
<script src="../js/jquery.min.js"></script>
<script src="../js/bgDataQuery.js"></script>
</body>
<script>
    function setIframe() {
        
    }
</script>
</html>
