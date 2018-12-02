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
    <meta charset="UTF-8">
    <title>updateBook</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
    <link href="../css/server.css" rel="stylesheet">
</head>
<body onload="initAJAX()">

<div>
    <%
        request.setCharacterEncoding("utf-8");
        String message= (String) request.getAttribute("message");
        String id= (String) request.getAttribute("id");
        request.setAttribute("message",null);
        request.setAttribute("id",null);
        System.out.println("message"+message);
        System.out.println("id"+id);
        String bookId=null,bookName=null;
        if (message!=null&&id!=null){
            bookId=id;
            out.print("<h3 id=\"message\">"+message+"</h3>");
        }else {
            bookId=request.getParameter("bookId");
            bookName=request.getParameter("bookName");
            System.out.println("updateBook :"+bookId+bookName);
        }
    %>
    <h4>提示：</h4>
    <h5><span style="font-size: 23px">1.</span>输入序号或者书名点击搜索来查询所需修改的书籍</h5>
    <h5><span style="font-size: 23px">2.</span>在出现的表格上修改书籍信息，点击修改，修改书籍信息</h5>
</div>
<div class="modal-body">
    <form class="form-group" action="updateBook.jsp" method="post" >
        <fieldset>
            <legend>书籍信息查询</legend>
            <div class="form-group">
                <label>序号：</label>
                <input name="bookId" class="form-control" type="search" placeholder="非零的正整数"   pattern="^[1-9]\d*$">
            </div>
            <div class="form-group">
                <label>书名：</label>
                <input name="bookName" class="form-control" type="search" placeholder="中文、英文、数字包括下划线"  pattern="^[\u4E00-\u9FA5A-Za-z0-9_]+$">
            </div>
            <div>
            <input type="submit" value="查 询" >
            </div>
        </fieldset>
    </form>
</div>
<%

    bookUtil bookUtil=new bookUtil();

    if (bookId!=null||bookName!=null){//当输入不都为空时
        if (bookId!=""||bookName!=""){         //这是个bug.刚开始加载时，bookId与bookName都为null，当不输入点击搜索，bookId与bookName都为""
%>
<div id="table1">
<table class="hovertable" border="1" width="100%">
    <caption>
        <h2>
            书籍信息
        </h2>
    </caption>
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
    <div class="modal-body">
    <form class="form-group" method="post" action="/updateAndChangeBookServlet" enctype="multipart/form-data">
        <fieldset>
            <legend>书籍信息修改</legend>
            <div class="form-group">
                <label>序号：</label>
                <input name="bookId" class="form-control" type="text" value="<%=book.getId()%>" placeholder="中文、英文、数字包括下划线"  pattern="^[\u4E00-\u9FA5A-Za-z0-9_]+$" required disabled="disabled">
            </div>
            <div class="form-group">
                <label>书名：</label>
                <input name="bookName" class="form-control" type="text" value="<%=book.getName()%>" placeholder="中文、英文、数字包括下划线" required pattern="^[\u4E00-\u9FA5A-Za-z0-9_]+$">
            </div>
            <div class="form-group">
                <label>作者：</label>
                <input name="bookAuthor" class="form-control" type="text" value="<%=book.getAuthor()%>" placeholder="中文、英文、数字包括下划线" required pattern="^[\u4E00-\u9FA5A-Za-z0-9_]+$">
            </div>
            <div class="form-group">
                <label>单价：</label>
                <input name="bookPrice" class="form-control" type="text"  value="<%=book.getPrice()%>" placeholder="有1~2位小数的正实数" required pattern="^[0-9]+(.[0-9]{1,2})?$">
            </div>
            <div class="form-group">
                <label>类型：</label>
                <input name="category_id" class="form-control" type="text" list="list1" placeholder="非零的正整数"  required pattern="^[1-9]\d*$">
                <datalist id="list1">
                    <%
                        ArrayList<category> categoryArrayList=bookUtil.getAllCategory();
                        //System.out.println(categoryArrayList);
                        for (category c:categoryArrayList
                                ) {
                    %>
                    <option value="<%=c.getId()%>"><%=c.getName()%></option>
                    <%
                        }
                    %>
                </datalist>
            </div>
            <div class="form-group">
                <label>描述：</label>
                <textarea name="bookDescription" class="form-control"  placeholder="请输入描述" required><%=book.getDescription()%></textarea>
            </div>

            <%--<input type="radio">--%>
            <div class="form-group">
                <label>图片：</label>
                <input type="file" class="form-control"  placeholder="请选择图片" required name="photo">
            </div>

        </fieldset>
        <div>
            <input type="submit"  value="修 改" >
        </div>
    </form>
    </div>
    <%
    }else {//输入了，但是书本不存在
    %>
    <tr>
        <td colspan="7">此书不存在</td>
    </tr>
    <%
        }
        }
    }
    %>
    </table>
</div>

<script src="../js/jquery.min.js" ></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/commons.js"></script>
</body>
</html>
