<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="model.book" %>
<%@ page import="model.orderItem" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="dao.getConn" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Yang
  Date: 2018/11/29
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>getOrder</title>
</head>
<body>
<%
    Connection conn=new getConn().getConn();
    orderItem orderItem=null;

    ResultSet set=null;
    String sql="select book.id,book.name,author,book.price,book.image,book.description,category.id,category.name,orderitem.id,"+
            "orderitem.quantity,orderitem.price from book,category,orderitem where book.category_id=category.id and orderitem.book_id=book.id and" +
            " orderitem.id=?;";
    String categoryID = request.getParameter("id");
    PreparedStatement pstat = conn.prepareStatement(sql);
    pstat.setString(1,categoryID);
    ResultSet rs = pstat.executeQuery();
    int book_id=set.getInt(1);
%>
<p><%=book_id%></p>
</body>
</html>
