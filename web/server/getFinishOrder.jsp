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
    <meta charset="UTF-8">
    <title>finishOrders</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
    <link href="../css/server.css" rel="stylesheet">
</head>
<body>
<div class="modal-body">
    <form class="form-group" action="getFinishOrder.jsp" method="post">
        <fieldset>
            <legend>已完成订单查询</legend>
            <div class="form-group">
                <label>用户名：</label>
                <input name="search" class="form-control" type="search" placeholder="中文、英文、数字包括下划线" required pattern="^[\u4E00-\u9FA5A-Za-z0-9_]+$">
            </div>
            <div>
                <input type="submit" value="查 询" >
            </div>
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
<div id="table1">
<table class="hovertable" border="1" width="100%">
    <caption><h2>已完成订单</h2></caption>
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
</div>
</body>
</html>

