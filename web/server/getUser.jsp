<%@ page import="com.sun.istack.internal.localization.NullLocalizable" %><%--
  Created by IntelliJ IDEA.
  User: 16051
  Date: 2018/11/25
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%--获取所有用户的信息--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>getUser</title>
</head>
<body  onload="initAJAX()">
<div>
    <form action="getUser.jsp" method="post">
        <fieldset>
            <legend>用户信息查询</legend>
            <label>用户名：
                <input type="search" name="search"/>
            </label>
            <input type="submit" value="搜索" onclick='showAdmin("秋水")'>
        </fieldset>
    </form>
</div>
<ul>
<%
    request.setCharacterEncoding("utf-8");
    String search=request.getParameter("search");
    if (search!=null){
        out.print(search);

        %>
    <div class="book">

    </div>
<%
    }
    else{
        %>
    <li>不存在</li>

<%
    }
%>


</ul>
<script src="../js/bgDataQuery.js"></script>
</body>
</html>
