<%@ page import="dao.getUser" %>
<%@ page import="dao.orderUtil" %>
<%@ page import="model.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: 16051
  Date: 2018/11/29
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>initOrders</title>
    <style>
        table.hovertable {
            margin-top: 2px;
            margin-bottom: 0px;
            text-align: center;
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
        }
        table.hovertable tr {
            background-color:#d4e3e5;
        }
        table.hovertable td {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #a9c6c9;
        }
    </style>
</head>
<body>
<div>
    <form action="getFinishOrder.jsp" method="post">
        <fieldset>
            <legend>已完成订单查询</legend>
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
        user user=new getUser().getUser(search);
        if (user!=null){
            userOrders userOrders=new orderUtil().getUserOrders(Integer.parseInt(user.getId()),1);
            if (userOrders!=null){
                ArrayList<order> orderArrayList=userOrders.getOrderArrayList();
                SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<table class="hovertable" border="1" width="100%">
    <caption><h2>初始订单</h2></caption>
    <tr>
        <th>用户ID</th>
        <th>用户名</th>
        <th>订单个数</th>
        <th>总金额</th>
    </tr>
    <tr>
        <td><%=user.getId()%></td>
        <td><%=user.getUsername()%></td>
        <td><%=userOrders.getOrderArrayList().size()%></td>
        <td><%=userOrders.getPrice()%></td>
    </tr>
</table>

<%
                for (order order:orderArrayList
                     ) {
 %>
<table class="hovertable" border="1" width="100%">
    <tr>
        <th>订单号</th>
        <th>订单时间</th>
        <th>订单金额</th>
        <th>订单状态</th>
    </tr>
    <tr>
        <td><%=order.getId()%></td>
        <td><%=sdf.format(order.getDate())%></td>
        <td><%=order.getPrice()%></td>
        <td>已完成</td>
    </tr>
</table>
<table class="hovertable" width="100%" border="1">
    <tr>
        <th>子订单号</th>
        <th>书本序号</th>
        <th>书名</th>
        <th>类型</th>
        <th>数量</th>
        <th>单价</th>
        <th>子订单金额</th>
    </tr>
<%
                    ArrayList<orderItem> orderItemArrayList=order.getOrderItemArrayList();
                    for (orderItem orderItem:orderItemArrayList
                         ) {
                        %>
<tr>
    <td><%=orderItem.getId()%></td>
    <td><%=orderItem.getBook().getId()%></td>
    <td><%=orderItem.getBook().getName()%></td>
    <td><%=orderItem.getBook().getCategory_name()%></td>
    <td><%=orderItem.getQuantity()%></td>
    <td><%=orderItem.getBook().getPrice()%></td>
    <td><%=orderItem.getPrice()%></td>
</tr>
<%
                    }
                    %>
</table>
    <%
                 }
            }
        }
    }
%>
</body>
</html>

