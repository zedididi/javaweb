<%--
  Created by IntelliJ IDEA.
  User: 16051
  Date: 2018/10/31
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%--从数据库获取相应类型的所有书本--%>
<%@ page import="java.sql.*,dao.*" contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.getConn" %>
<html>
<head>
    <title>getBook</title>
</head>
<style>
    .operation{
        position: absolute;
        bottom: 20px;
    }
    .bookpadding{
        padding: 0;
        margin: 0;

    }
</style>
<body>
<%

    String sql = "select id,name,author,price,image,description,category_id from book" +
            " where category_id = ?";
    String categoryID = request.getParameter("id");
    Connection conn = new getConn().getConn();
    PreparedStatement pstat = conn.prepareStatement(sql);
    pstat.setString(1,categoryID);
    ResultSet rs = pstat.executeQuery();
    while (rs.next()) {

%>
<div class="col-sm-9 col-md-3 bookpadding" >
    <div class="thumbnail" >
        <img src=<%=rs.getString("image")%>>
        <div class="caption">
            <h4><%=rs.getString("name")%></h4>
            <p namne="description"><%=rs.getString("description")%></p>
            <div class="operation">
            <p>
                <button class="btn btn-primary " onclick="addBook(<%=rs.getString("id")%>)">加入购物车</button>
                <a href="" class="btn btn-default " role="button" data-toggle="modal" data-target="#<%=rs.getString("name")%>">查看详情</a>
            </p>
            </div>
            </div>
        </div>
    </div>
</div>

<!--查看详情模态框-->
<div class="modal fade" id="<%=rs.getString("name")%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">书本详情    &nbsp;&nbsp;&nbsp;&nbsp;《<%=rs.getString("name")%>》</h4>
            </div>
            <div class="modal-body">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString("description")%></div>
            <div class="modal-footer">

                <div align="left"><img src="<%=rs.getString("image")%>"></div>
                <p>作者：<%=rs.getString("author")%></p>
                <p>售价：￥<%=rs.getString("price")%></p>
                <button class="btn btn-primary" onclick="addBook(<%=rs.getString("id")%>)">加入购物车</button><button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<%
    }
     pstat.close();
    conn.close();
%>
</body>
</html>
