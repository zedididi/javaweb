<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="dao.getConn" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Yang
  Date: 2018/12/2
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>金庸专题</title>
    <style>
        body{
            background-image: url("../images/actor.jpg");
            background-size: cover;
        }
        .item{
            position: relative;
            width: 1200px;
            left: 30%;
            height: auto;
        }
        .item_book{
            float: left;
            width: 400px;
            height: 400px;
        }
        .item_inFo{
            float: left;
            width: 400px;
            height: 400px;
            background: white;
        }
        .bookName{
            height: 25%;
            float: left;
        }
        .author{
            clear: both;
            height: 25%;
        }
        .price{
            background: #e5e5e5;
            width: 400px;
            clear: both;
            height: 25%;
            float: left;
        }
        .description{
            width: 800px;
            clear: both;
            background: white;
        }
        .bottom{
            width:1200px;

        }

    </style>
</head>
<body>

<%
    String sql = "select id,name,author,price,image,description,category_id from book" +
            " where id= ?";
    String id = request.getParameter("bookId");
    Connection conn = new getConn().getConn();
    PreparedStatement pstat = conn.prepareStatement(sql);
    pstat.setString(1,id);
    ResultSet rs = pstat.executeQuery();
%>

<div class="item">
    <div class="item_book">
        <img width="400px" height="400px" src="<%=rs.getString("image")%>">
    </div>
    <div class="item_inFo">
        <div class="bookName">
            <p style="font-size: large"><strong><%=rs.getString("name")%></strong></p>
        </div>
        <div class="author">
            <p style="color: #2e6da4">作者：<%=rs.getString("author")%></p>
        </div>
        <div class="price">
            <p style="text-decoration:line-through;">定 价：￥1000</p>
            <p style="color: red">售 价：<strong>￥<%=rs.getString("price")%></strong></p>
        </div>
    </div>
    <div class="description">
        <dl>
            <dt><strong>简 介</strong></dt>
            <dd>&nbsp;&nbsp;<%=rs.getString("description")%></dd>
        </dl>
    </div>
</div>
<%
    pstat.close();
    conn.close();
%>
</body>
</html>
