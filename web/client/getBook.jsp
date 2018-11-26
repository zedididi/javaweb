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
<div class="col-sm-9 col-md-3" >
    <div class="thumbnail" >
        <img src="../images/book.jpg">
        <div class="caption">
            <h4><%=rs.getString("name")%></h4>
            <p><%=rs.getString("description")%></p>
            <p>
                <a href='javascript:shop("<%=rs.getString("name")%>")' class="btn btn-primary" role="button">加入购物车</a>
                <a href="#" class="btn btn-default" role="button">查看详情</a>
            </p>
        </div>
    </div>
</div>
<%
    }
     pstat.close();
    conn.close();
%>
<script>
    function shop(bookName) {
        xmlHttp.onreadystatechange=function () {
            if (xmlHttp.readyState==4){
                if (xmlHttp.status==200){

                }
            }
        }
        xmlHttp.open("GET","setSession.jsp?name="+bookName,true);
        xmlHttp.send();
    }
</script>
</body>
</html>
