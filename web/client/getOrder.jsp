<%@ page import="controller.transform" %>
<%@ page import="dao.orderUtil" %>
<%@ page import="model.BookModel" %>
<%@ page import="model.order" %>
<%@ page import="model.orderItem" %>
<%@ page import="model.user" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Date" %><%--
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
    user user= (model.user) request.getSession().getAttribute("user");
    HashMap<Integer, Map.Entry<BookModel,Integer>> shoppingCar= (HashMap<Integer, Map.Entry<BookModel, Integer>>) request.getSession().getAttribute("ShoppingCar");//获取购物车内容
    order order=null;
    if (user!=null)            //当用户已登录
        order=new transform().getOrder(shoppingCar, Integer.parseInt(user.getId()));  //把购物车的格式转换成order类型
    if (order!=null){         //当购物车不为空，且用户已登陆
        order.setDate(new Date());
    System.out.println("getOrder.jsp+order: "+order);

    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<div align="center">全部订单</div>
<hr color="#5f9ea0">
<a class="home" href="../index.jsp" rel="tooltip" data-placement="bottom" data-
   placement="bottom"  data-toggle="modal" data-target="#myModal"><img src="../images/home.png"></a>
<div align="right">
    <a href="../client/UserOrder.jsp" class="pay"><img src="../images/pay.jpg" width="50" height="50"></a>
</div>
<input type="checkbox" name="selectAll" value="value" id="check" >全选<a href="#bottom" style="float: right;text-decoration: none;">直达底部</a>

<table id="table1">
    <tbody id="table2">
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
        <td><img src="<%=orderItem.getBook().getImage()%>" width="100" height="100"></br>
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
    </tbody>
</table>

<center>
    <span id="spanFirst">第一页</span> <span id="spanPre">上一页</span> <span id="spanNext">下一页</span> <span id="spanLast">最后一页</span> 第<span id="spanPageNum"></span>页/共<span id="spanTotalPage"></span>页
</center>
<%
    }else
        out.print("你未登录，无法结算！！！！！！");
%>
<%--设置bottom，实现直达底部功能--%>
<div name="bottom" style="position:fixed ; bottom:0px;width: 1500px;">

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

    var theTable = document.getElementById("table2");
    var totalPage = document.getElementById("spanTotalPage");
    var pageNum = document.getElementById("spanPageNum");

    var spanPre = document.getElementById("spanPre");
    var spanNext = document.getElementById("spanNext");
    var spanFirst = document.getElementById("spanFirst");
    var spanLast = document.getElementById("spanLast");

    var numberRowsInTable = theTable.rows.length;
    var pageSize = 5;
    var page =1;

    //下一页
    function next() {
        hideTable();
        currentRow = pageSize * page;
        maxRow = currentRow + pageSize;
        if (maxRow > numberRowsInTable) maxRow = numberRowsInTable;
        for (var i = currentRow; i < maxRow; i++) {

            theTable.rows[i].style.display = '';
        }
        page++;

        if (maxRow == numberRowsInTable) {
            nextText();
            lastText();
        }
        showPage();
        preLink();
        firstLink();
    }

    //上一页
    function pre() {
        hideTable();
        page--;
        currentRow = pageSize * page;
        maxRow = currentRow - pageSize;
        if (currentRow > numberRowsInTable) currentRow = numberRowsInTable;
        for (var i = maxRow; i < currentRow; i++) {
            theTable.rows[i].style.display = '';
        }

        if (maxRow == 0) {
            preText();
            firstText();
        }
        showPage();
        nextLink();
        lastLink();
    }

    //第一页
    function first() {
        hideTable();
        page = 1;
        for (var i = 0; i < pageSize; i++) {
            theTable.rows[i].style.display = '';
        }
        showPage();
        preText();
        nextLink();
        lastLink();
    }

    //最后一页
    function last() {
        hideTable();
        page = pageCount();
        currentRow = pageSize * (page - 1);
        for (var i = currentRow; i < numberRowsInTable; i++) {
            theTable.rows[i].style.display = '';
        }
        showPage();
        preLink();
        nextText();
        firstLink();
    }

    function hideTable() {
        for (var i = 0; i < numberRowsInTable; i++) {
            theTable.rows[0].style.display = '';
            theTable.rows[i].style.display = 'none';
        }
    }

    function showPage() {
        pageNum.innerHTML = page;
    }


    //总共页数
    function pageCount() {
        var count = 0;
        if (numberRowsInTable % pageSize != 0) count = 1;
        return parseInt(numberRowsInTable / pageSize) + count;
    }

    //显示链接
    function preLink() {
        spanPre.innerHTML = "<a href='javascript:pre();'>上一页</a>";
    }

    function preText() {
        spanPre.innerHTML = "上一页";
    }

    function nextLink() {
        spanNext.innerHTML = "<a href='javascript:next();'>下一页</a>";
    }

    function nextText() {
        spanNext.innerHTML = "下一页";
    }


    function firstLink() {
        spanFirst.innerHTML = "<a href='javascript:first();'>第一页</a>";
    }

    function firstText() {
        spanFirst.innerHTML = "第一页";
    }

    function lastLink() {
        spanLast.innerHTML = "<a href='javascript:last();'>最后一页</a>";
    }

    function lastText() {
        spanLast.innerHTML = "最后一页";
    }

    //隐藏表格
    function hide() {
        for (var i = pageSize; i < numberRowsInTable; i++) {
            theTable.rows[i].style.display = 'none';
        }

        totalPage.innerHTML = pageCount();
        pageNum.innerHTML = '1';

        nextLink();
        lastLink();
    }
    hide();
</script>
</body>
</html>
