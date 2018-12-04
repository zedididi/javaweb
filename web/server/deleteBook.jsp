<%@ page import="dao.bookUtil" %>
<%@ page import="model.BookModel" %>
<%@ page import="model.category" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 16051
  Date: 2018/12/3
  Time: 18:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>deleteBook</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
    <link href="../css/server.css" rel="stylesheet">
</head>
<body>
<div>
    <h4>提示：</h4>
    <h5><span style="font-size: 23px">1.</span>查询功能与书籍信息查询功能一样</h5>
    <h5><span style="font-size: 23px">2.</span>删除必须输入其中之一，都输入以序号为索引</h5>
</div>
<div class="modal-body">
    <form class="form-group"  method="post" >
        <fieldset>
            <legend>书籍信息删除</legend>
            <div class="form-group">
                <label>序号：</label>
                <input name="bookId" class="form-control" type="search" placeholder="非零的正整数" pattern="^[1-9]\d*$">
            </div>
            <div class="form-group">
                <label>书名：</label>
                <input name="bookName" class="form-control" type="search" placeholder="中文、英文、数字包括下划线"  pattern="^[\u4E00-\u9FA5A-Za-z0-9_]+$">
            </div>
            <div  class="text-right">
                <button class="btn btn-primary" type="submit" formaction="deleteBook.jsp">查 询</button>
                <button class="btn btn-primary" type="submit" formaction="/deleteServlet">删 除</button>
            </div>
        </fieldset>
    </form>
</div>
<%
    request.setCharacterEncoding("utf-8");
    String deleteMessage= String.valueOf(request.getAttribute("deleteMessage"));
    String id= (String) request.getAttribute("deleteBookId");
    request.setAttribute("deleteMessage",null);
    request.setAttribute("deleteBookId",null);

    String bookId=null;
    if (deleteMessage!=null&&id!=null){  //判断请求来自deleteServlet
        bookId=id;
        out.print("<h3 id=\"message\">"+deleteMessage+"</h3>");
    }else {                       ////判断请求来自deleteBook.jsp
        bookId=request.getParameter("bookId");
    }
    String bookName=request.getParameter("bookName");
    bookUtil bookUtil=new bookUtil();

    if (bookId!=null||bookName!=null){//当输入不都为空时
%>
<div id="table1">
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
</div>
</table>
</body>
</html>
