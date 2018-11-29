<%--
  Created by IntelliJ IDEA.
  User: Yang
  Date: 2018/11/28
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的购物车</title>
    <style>
        .top{
            border-bottom: 3px solid red;
        }
        .inside{
            height: 700px;
        }
        .bottom{
            height: 50px;
        }
    </style>
</head>
<body>
<div class="top">
    <h1 class="head" align="center">我的购物车</h1>
    <div class="top_user">
        <a href="" class="userInfo">用户</a>&nbsp;&nbsp;<a href="" class="clean">注销</a>
    </div>
</div>
</br>
</br>
<form action="" method="post">
    <table id="table1" class="main" border="1" width="100%" cellpadding="0" cellspacing="0">
        <tbody id="table2">
        <tr>
            <th>
                <input type="checkbox" id="theadInp"/>全选
            </th>
            <th align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
            <th>单价</th>
            <th>数量</th>
            <th>金额</th>
            <th>操作</th>
        </tr>
        <tr class="inside">

        </tr>
        <tr class="bottom">
            <td align="center">
                <input type="checkbox" id="theadInp"/>全选
            </td>
            <td align="left"><a href="javascript:void(0)" onclick="Delete()">删除</a> </td>
            <td align="center">已选商品 件</td>
            <td>合计</td>
            <td><a href="">结算</a> </td>
        </tr>
        </tbody>
    </table>
    <center>
    <span id="spanFirst">第一页</span> <span id="spanPre">上一页</span> <span id="spanNext">下一页</span> <span id="spanLast">最后一页</span> 第<span id="spanPageNum"></span>页/共<span id="spanTotalPage"></span>页
    </center>
</form>
<script>
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
