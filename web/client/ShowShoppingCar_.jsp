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
            border-bottom: 3px solid #5f9ea0;
        }
        .top_user{
            display: inline;
        }
        .main{

        }

        .bottom{
            background-color:#5f9ea0 ;
        }

        table{
            border-collapse:collapse;
            border: 10px;
        }

        td{
            text-align: center;
        }

        th{
            text-align: center;
        }
        a{
            text-decoration: none;
        }
    </style>
    <script src="../js/commons.js"></script>
</head>
<body onload="initAJAX()">
<div class="top">
    <h1 class="head" align="center">我的购物车</h1>

</div>
</br>

<div class="top_user">
    <input type="checkbox" onclick="selectAll(this)"/>全选
    <button style="float: right"><a href="" class="userInfo">用户</a></button>&nbsp;&nbsp;
    <button style="float: right"><a href="" class="clean">注销</a></button>
    <a style="float: right" href="../index.jsp"><img src="../images/home.png"></a>

</div>
    <table id="table1" class="main"  width="100%">
        <tbody id="table2">
        <tr  bgcolor="#5f9ea0">
            <th width="30px">
            </th>
            <th align="center" width="30%">商品信息</th>
            <th width="20%">单价(¥)</th>
            <th width="20%">数量</th>
            <th width="15%">金额(¥)</th>
            <th width="15%">操作</th>
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
            <td><img src=<%=bookModel.getImage()%> width="100" height="100"></br>
                书名:<%=bookModel.getName()%> 作者:<%=bookModel.getAuthor()%>
            </td>
            <td><%=bookModel.getPrice()%></td>
            <td>
                <input type="button" value="-" onclick="minus(<%=bookModel.getId()%>)">
                <span id="amount"><%=quality%></span>
                <input type="button" value="+" onclick="plus(<%=bookModel.getId()%>)">
            </td>
            <td id="price"><%=bookModel.getPrice()*quality%></td>
            <td align="left"><a href="/DeleteBookServlet?BookID=<%=bookModel.getId()%>">删除</a></td>
        </tr>
        <%
            }
        %>


        </tbody>
        <tr class="bottom" >
            <th>
            </th>
            <th align="left"><input type="button" value="删除" onclick="delete_()"></th>
            <th id="selectedNum">已选商品0件</th>
            <th id="total">合计￥0</th>
            <th><a href="getOrder.jsp">结算</a></th>
            <th></th>
        </tr>
    </table>
<center>
    <span id="spanFirst">第一页</span> <span id="spanPre">上一页</span> <span id="spanNext">下一页</span> <span id="spanLast">最后一页</span> 第<span id="spanPageNum"></span>页/共<span id="spanTotalPage"></span>页
</center>
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
            document.getElementById("total").innerHTML = "合计￥0";
        }
        var url = "/BalanceServlet?BookIDs=" + bookIDs;
        xmlHttp.open("POST",url,true);
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 4 && xmlHttp.status == 200){
                var array = xmlHttp.responseText.split(" ");
                document.getElementById("selectedNum").innerHTML = "已选商品" + array[0] +"件";
                document.getElementById("total").innerHTML = "合计" +"￥"+array[1] ;
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
