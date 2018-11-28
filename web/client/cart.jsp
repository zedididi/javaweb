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
    <table class="main" border="1" width="100%" cellpadding="0" cellspacing="0">
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
    </table>
</form>
<script>

</script>
</body>
</html>
