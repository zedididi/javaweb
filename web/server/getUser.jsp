<%@ page import="com.sun.istack.internal.localization.NullLocalizable" %>
<%@ page import="model.admin" %>
<%@ page import="dao.getUser" %>
<%@ page import="model.user" %><%--
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
    <style>
    table.hovertable {
    font-family: verdana,arial,sans-serif;
    font-size:15px;
    color:#333333;
    border-width: 1px;
    border-color: #999999;
    border-collapse: collapse;
    }
    table.hovertable th {

    background-color:#c3dde0;
    border-width: 1px;
    padding: 8px;
    border-style: solid;
    border-color: #a9c6c9;
      /*  width: 10%;
        word-wrap: break-word;*/
    }
    table.hovertable tr {
    background-color:#d4e3e5;
    }
    table.hovertable td {
       /* heig: 10%;
        word-wrap: break-word;*/
    border-width: 1px;
    padding: 8px;
    border-style: solid;
    border-color: #a9c6c9;
    }
    </style>
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
    int i=0;
    if (search!=null){
        out.print(search);
        user user=new getUser().getUser(search);
        if (user!=null){
            out.print(user);
            %>
    <table class="hovertable" border="1">
        <caption><h2>用户信息</h2></caption>
        <tr>
            <th rowspan="2">序号</th>
            <th rowspan="2">ID</th>
            <th rowspan="2">用户名</th>
            <th rowspan="2">密码</th>
            <th rowspan="2">座机号</th>
            <th rowspan="2">手机号</th>
            <th rowspan="2">邮箱</th>
            <th rowspan="2">地址</th>
        </tr>
       <%-- <%
            out.print("<tr>\n" +
                    "<td>"+i+"</td>\n" +
                    "<td>"+user.getId()+"</td>\n" +
                    "<td>"+user.getUsername()+"</td>\n" +
                    "<td>"+user.getPassword()+"</td>]\n" +
                    "<td>"+user.getCellphone()+"</td>\n" +
                    "<td>"+user.getPhone()+"</td>\n" +
                    "<td>"+user.getEmail()+"</td>\n" +
                    "<td"+user.getAddress()+"</td>\n" +
                    "</tr>\n");
        %>--%>
        <br>
        <tr>
            <td><%=i%></td>
            <td><%=user.getId()%></td>
            <td><%=user.getUsername()%></td>
            <td><%=user.getPassword()%></td>
            <td><%=user.getCellphone()%></td>
            <td><%=user.getPhone()%></td>
            <td><%=user.getEmail()%></td>
            <td><%=user.getAddress()%></td>
        </tr>
    </table>
    <%
        }

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
