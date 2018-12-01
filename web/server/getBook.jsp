<%@ page import="dao.bookUtil" %>
<%@ page import="model.BookModel" %>
<%@ page import="model.category" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 16051
  Date: 2018/11/30
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>getBook</title>
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
    <form action="getBook.jsp" method="post" >
        <fieldset>
            <legend>书籍信息查询</legend>
            <label>序号：
                <input type="search" name="bookIdSearch" />
            </label>
            <label>书名：
                <input type="search" name="bookNameSearch" />
            </label>
            <input type="submit" value="搜索" >
        </fieldset>
    </form>
</div>
<%
    request.setCharacterEncoding("utf-8");
    String bookId=request.getParameter("bookIdSearch");
    String bookName=request.getParameter("bookNameSearch");
    bookUtil bookUtil=new bookUtil();

    if (bookId!=null||bookName!=null){//当输入不都为空时
%>
<table class="hovertable" border="1" width="100%">
    <caption><h2>书籍信息</h2></caption>
    <tr>
        <th>书籍序列号</th>
        <th>书籍名</th>
        <th>作者</th>
        <th>单价</th>
        <th>图片</th>
        <th>概述</th>
        <th>类型</th>
    </tr>
    <%
        if (bookId!=""||bookName!=""){         //这是个bug.刚开始加载时，bookId与bookName都为null，当不输入点击搜索，bookId与bookName都为""
        BookModel book=null;
        if (bookId!="") { //只要id不为空   查询book以id为索引（要看bookUtil().getbook(int id,String name)）
            book = bookUtil.getBook(Integer.parseInt(bookId), null);
        } else   //查询book以name为索引
            book=bookUtil.getBook(0,bookName);
        if (book!=null){  //输入了，书本存在
            category category=bookUtil.getCategory(Integer.parseInt(book.getCategory_id()));
            %>
    <tr>
        <td><%=book.getId()%></td>
        <td><%=book.getName()%></td>
        <td><%=book.getAuthor()%></td>
        <td><%=book.getPrice()%></td>
        <td><img src="<%=book.getImage()%>" alt="<%=book.getName()%>" width="90" height="80"> </td>
        <td width="50%"><%=book.getDescription()%></td>
        <td><%=category.getName()%></td>
    </tr>
<%

        }else {//输入了，但是书本不存在
           %>
    <tr>
        <td colspan="7">此书不存在</td>
    </tr>
    <%

        }
    }else {//当输入都为空时，显示所有的书本
                ArrayList<BookModel> bookModelArrayList=bookUtil.getAllBook();
                category category=null;
            for (BookModel book:bookModelArrayList
                 ) {
                category=bookUtil.getCategory(Integer.parseInt(book.getCategory_id()));

%>
    <tr>
        <td><%=book.getId()%></td>
        <td><%=book.getName()%></td>
        <td><%=book.getAuthor()%></td>
        <td><%=book.getPrice()%></td>
        <td><img src="<%=book.getImage()%>" alt="<%=book.getName()%>" width="90" height="80"> </td>
        <td width="50%"><%=book.getDescription()%></td>
        <td><%=category.getName()%></td>
    </tr>
    <%
                }
        }
    }
%>
</table>
</body>
</html>
