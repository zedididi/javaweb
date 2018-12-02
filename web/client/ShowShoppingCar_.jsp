<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="model.BookModel" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/28
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head onload="initAJAX()">
    <meta charset="UTF-8">
    <title>我的购物车</title>
    <style>
        .top{
            border-bottom: 3px solid red;
        }
        .main{

        }
        .bottom{
            height: 50px;
        }

        td{
            text-align: center;
        }

        th{
            text-align: center;
        }
    </style>
    <script src="../js/commons.js"></script>
</head>
<body onload="initAJAX()">
<div class="top">
    <h1 class="head" align="center">我的购物车</h1>
    <div class="top_user">
        <a href="" class="userInfo">用户</a>&nbsp;&nbsp;<a href="" class="clean">注销</a>
    </div>
</div>
</br>
</br>
<form action="/DeleteSelectedServlet" method="post" id="delete">
    <table class="main" border="2" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <th>
                <input type="checkbox" onclick="selectAll(this)"/>全选
            </th>
            <th align="center" width="45%">商品信息</th>
            <th>单价</th>
            <th>数量</th>
            <th>金额</th>
            <th>操作</th>
        </tr>
        <%
            HashMap<Integer,Map.Entry<BookModel,Integer>> map = (HashMap<Integer, Map.Entry<BookModel, Integer>>) request.getSession().getAttribute("ShoppingCar");
            for (Map.Entry<Integer,Map.Entry<BookModel,Integer>> entry:map.entrySet()){
                Map.Entry<BookModel,Integer> item = entry.getValue();
                BookModel bookModel = item.getKey();
                int quality = item.getValue();
        %>
        <tr id="<%=bookModel.getId()%>">
            <td><input type="checkbox" name="choose" value="<%=bookModel.getId()%>" onclick="balance()"/></td>
            <td style="text-align: left"><img src=<%=bookModel.getImage()%> width="100" height="100"></br>
                书名:<%=bookModel.getName()%> 作者:<%=bookModel.getAuthor()%>
            </td>
            <td><%=bookModel.getPrice()%></td>
            <td>
                <input type="button" value="-" onclick="minus(<%=bookModel.getId()%>)">
                <span id="amount"><%=quality%></span>
                <input type="button" value="+" onclick="plus(<%=bookModel.getId()%>)">
            </td>
            <td id="price"><%=bookModel.getPrice()*quality%></td>
            <td align="left"><a href="/DeleteBookServlet?BookID=<%=bookModel.getId()%>">删除</a> </td>
        </tr>
        <%
            }
        %>

        <tr class="bottom">
            <td>
                <input type="checkbox" onclick="selectAll(this)"/>全选
            </td>
            <td align="left"><input type="button" value="删除" onclick="delete_()"></td>
            <td id="selectedNum">已选商品 件</td>
            <td id="total">合计</td>
            <td><a href="getOrder.jsp?userID=1">结算</a> </td>
        </tr>
    </table>
</form>

<script>
    //实现全选功能
    function selectAll(obj) {
        var checkbox = document.getElementsByName("choose");
        for (var i = 0;i<checkbox.length;i++){
            checkbox[i].checked = obj.checked;
        }
        balance();
    }

    //更新总价、书籍总数目信息
    function balance() {
        var selected = 0;
        var checkbox = document.getElementsByName("choose");
        var bookIDs="";
        for (var i = 0;i<checkbox.length;i++){
            if (checkbox[i].checked){
                bookIDs += checkbox[i].value+" ";
                ++selected;
            }
        }
        if (selected == 0){
            document.getElementById("selectedNum").innerHTML = "已选商品" + selected +"件";
            document.getElementById("total").innerHTML = "合计0元";
        }
        var url = "/BalanceServlet?BookIDs=" + bookIDs;
        xmlHttp.open("POST",url,true);
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 4 && xmlHttp.status == 200){
                var array = xmlHttp.responseText.split(" ");
                document.getElementById("selectedNum").innerHTML = "已选商品" + array[0] +"件";
                document.getElementById("total").innerHTML = "合计" +array[1] +"元";
            }
        }
        xmlHttp.send();
    }

    //增加一本书
    function plus(bookID) {
        var tr = document.getElementById(bookID);
        var td_quality = tr.cells[3];  //单个书本数量
        var td_price = tr.cells[4];  //单个书本价格  单价*数量
        var td_quality_span = td_quality.getElementsByTagName("span")[0];
        var account = (Number)(td_quality_span.innerText);
        var price = (Number)(td_price.innerText);

        var selectedNum = document.getElementById("selectedNum");  //所有选中书籍的数目
        var total = document.getElementById("total");  //所有选中书籍的总价
        var selected = booleanSelected(bookID);  //判断增加的书本是否选中
        var num = (Number)(selectedNum.innerText.match("\\d+"));  //选中的书本数目
        var total_price = (Number)(total.innerText.match("\\d+[\\.]\\d+"));  //选中的书本总价
        xmlHttp.open("POST","/AddServlet?BookID="+ bookID,true);
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 4 && xmlHttp.status == 200){
                td_quality_span.innerText = (String)(account+1);
                td_price.innerText = (String)((price/account + price).toFixed(2));
                if (selected && num!=null){
                    selectedNum.innerText = "已选商品" + (num+1)+"件";
                    total.innerText = "合计"+ (total_price + price/account).toFixed(2)+"元";
                }
            }
        }
        xmlHttp.send();
    }

    //减少一本书
    function minus(bookID) {
        var tr = document.getElementById(bookID);
        var td_quality = tr.cells[3];  //单个书本数量
        var td_price = tr.cells[4];  //单个书本价格  单价*数量
        var td_quality_span = td_quality.getElementsByTagName("span")[0];
        var account = (Number)(td_quality_span.innerText);
        var price = (Number)(td_price.innerText);

        var selectedNum = document.getElementById("selectedNum");  //所有选中书籍的数目
        var total = document.getElementById("total");  //所有选中书籍的总价
        var selected = booleanSelected(bookID);  //判断增加的书本是否选中
        var num = (Number)(selectedNum.innerText.match("\\d+"));  //选中的书本数目
        var total_price = (Number)(total.innerText.match("\\d+[\\.]\\d+"));  //选中的书本总价
        xmlHttp.open("POST","/MinusServlet?BookID="+ bookID,true);
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 4 && xmlHttp.status == 200){
                if(account == 1) alert("书本最低限购数量为1");
                else{
                    td_quality_span.innerText = (String)(account-1);
                    td_price.innerText = (String)((price - price/account).toFixed(2));
                    if (selected && num!=null){
                        selectedNum.innerText = "已选商品" + (num-1)+"件";
                        total.innerText = "合计"+ ((total_price - price/account).toFixed(2))+"元";
                    }
                }
            }
        }
        xmlHttp.send();
    }


    function booleanSelected(bookID) {
        var selected = false;
        var checkbox = document.getElementsByName("choose");
        for (var i = 0;i<checkbox.length;i++){
            if (checkbox[i].checked)
                if (Number(checkbox[i].value) == Number(bookID)) selected = true;
        }
        return selected;
    }

    //删除所有被选中的
    function delete_() {
        var selected = false;
        var checkbox = document.getElementsByName("choose");
        for (var i = 0;i<checkbox.length;i++){
            if (checkbox[i].checked) selected = true;
        }
        if (selected) document.getElementById("delete").submit();
        else alert("请选择删除的书籍")
    }
</script>
</body>
</html>
