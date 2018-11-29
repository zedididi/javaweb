<%@ page import="dao.getUser" %>
<%@ page import="model.user" %><%--
  Created by IntelliJ IDEA.
  User: 16051
  Date: 2018/11/28
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>initOrders</title>
    <style>
    table.hovertable {
        margin-top: 50px;
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
<body>
<div>
    <form action="getInitorder.jsp.jsp" method="post">
        <fieldset>
            <legend>初始订单查询</legend>
            <label>用户名：
                <input type="search" name="search"/>
            </label>
            <input type="submit" value="搜索" >
        </fieldset>
    </form>
</div>
<%
    request.setCharacterEncoding("utf-8");
    String search=request.getParameter("search");
    if (search!=null){
        out.print(search);
        user user=new getUser().getUser(search);
        if (user!=null){

        }
    }
%>
</body>
</html>
