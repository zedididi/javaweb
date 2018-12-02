<%@ page import="dao.orderUtil" %>
<%@ page import="model.order" %>
<%@ page import="model.book" %>
<%@ page import="model.orderItem" %>
<%@ page import="model.userOrders" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Yang
  Date: 2018/11/29
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>订单信息</title>
    <style>
        a{
            text-decoration: none;
        }
        table{
            border-collapse:collapse;
            border: 10px;
        }
        td{
            text-align: center;
        }
    </style>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");

    userOrders userOrders=new orderUtil().getUserOrders(Integer.parseInt(user_id),-1);
    ArrayList<order> orderArrayList=userOrders.getOrderArrayList();
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<div align="center">全部订单</div>
<hr color="#5f9ea0">
<input type="checkbox" name="selectAll" value="value" id="check" >全选<a href="#bottom" style="float: right;text-decoration: none;">直达底部</a>
<%
    for (order order:orderArrayList
    ) {
%>
<table>
    <tr bgcolor="#5f9ea0">
        <th width="20px"></th>
        <th width="30%">商品信息</th>
        <th width="20%">下单时间</th>
        <th width="15%">数量</th>
        <th width="10%">单价(¥)</th>
        <th width="15%">总价(¥)</th>
        <th width="10%">交易状态</th>
    </tr>
    <%
        ArrayList<orderItem> orderItemArrayList=order.getOrderItemArrayList();
        for (model.orderItem orderItem:orderItemArrayList
        ) {
    %>
    <tr>
        <td><input type="checkbox" name="item" value="value" ></td>
        <td><img src=" <%=orderItem.getBook().getImage()%>" width="100" height="100"></br>
            <%=orderItem.getBook().getName()%></td>
        <td><%=sdf.format(order.getDate())%></td>
        <td><%=orderItem.getQuantity()%></td>
        <td><%=orderItem.getBook().getPrice()%></td>
        <td><%=orderItem.getPrice()%></td>
        <td id="th1"><%=order.isState()%></td>
    </tr>
    <%
        }
    %>
</table>
<%
    }
%>
<%--设置bottom，实现直达底部功能--%>
<div name="bottom" style="position:fixed ; bottom:0px;width: 1500px;">
    <div align="right">
    <a href="../no.html" class="pay"><img src="../images/pay.jpg" width="50" height="50"></a>
    </div>
</div>


<script language="JavaScript">
    //实现全选功能
    document.getElementById("check").onclick = function(){
        var checked = document.getElementById("check").checked;
        var checkson = document.getElementsByName("item");
        if(checked){
            for(var i = 0; i < checkson.length ;i++){
                checkson[i].checked = true;
            }
        }else{
            for(var i = 0; i < checkson.length ;i++){
                checkson[i].checked = false;
            }
        }
    }
</script>
</body>
</html>
