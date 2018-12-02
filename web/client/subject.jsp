<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="dao.getConn" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Yang
  Date: 2018/12/2
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SuperGod的书店</title>
    <style>
        body{
            background-image: url("../images/金庸.jpg");
            background-size: cover;
        }
        .head{
            text-align: center;
        }
        .item_head{
            text-align: center;
        }
        .item_body{
            position: relative;
            left: 18.25%;
            width: 1200px;
            height: auto;
        }
        .item_body_book{
            background: white;
            float: left;
            width: 200px ;
            height: 250px;
        }
    </style>
</head>
<body>
<div class="head">
    <img src="../images/0.jpg">
</div>

<div class="item">
    <div class="item_head">
    <img src="../images/金庸简介.jpg">
    </div>
    <div class="item_body">
<%

    String sql = "select id,name,author,price,image,description,category_id from book" +
            " where author= ?";
    String author = request.getParameter("author");
    Connection conn = new getConn().getConn();
    PreparedStatement pstat = conn.prepareStatement(sql);
    pstat.setString(1,author);
    ResultSet rs = pstat.executeQuery();
    while (rs.next()) {

%>
        <div class="item_body_book">
            <div style="text-align: center">
            <a href=""><img width="149" height="149" src="<%=rs.getString("image")%>"></a>
            </div>
            <div style="text-align: center">
            <p><%=rs.getString("name")%></p>
            <p style="color: red">￥<%=rs.getString("price")%></p>
            </div>
        </div>


<%
        }
        pstat.close();
        conn.close();
%>
    </div>
</div>
</body>
</html>
