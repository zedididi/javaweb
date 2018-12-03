<%@ page import="dao.getConn" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Yang
  Date: 2018/12/3
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SuperGod的书店</title>
    <style>
        body{
            background-image: url("../images/头像.jpg");
            background-size: cover;
        }
        .head{
            text-align: center;
        }
        .item_head{
            margin-left: 18.25%;
            /*text-align: center;*/
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
    <img src="../images/1.jpg">
</div>

<div class="item">
    <div class="item_head">
        <img src="../images/重磅推荐.jpg">
    </div>
    <div class="item_body">
        <%

            String sql = "select id,name,author,price,image,description,category_id from book" +
                    " where category_id= ?";
            String category_id = request.getParameter("category_id");
            Connection conn = new getConn().getConn();
            PreparedStatement pstat = conn.prepareStatement(sql);
            pstat.setString(1,category_id);
            ResultSet rs = pstat.executeQuery();
            while (rs.next()) {

        %>
        <div class="item_body_book">
            <div style="text-align: center">
                <a href="bookInfo.jsp?bookId=<%=rs.getString("id")%>"><img width="149" height="149" src="<%=rs.getString("image")%>"></a>
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
