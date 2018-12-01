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
    <title>updateBook</title>
    <style>

        form2{
            width: 50%;
            font-family: Arial;
            font-size: 15px;
        }
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
        div{
            margin-left: 50px;
        }
        form2 input{
            margin-top: 2px;
            height: 30px;
            width: 90%;
        }
    </style>
</head>
<body onload="initAJAX()">

<div>

    <h2>提示：</h2>
    <h3><span style="font-size: 23px">1.</span>输入序号或者书名点击搜索来查询所需修改的书籍</h3>
    <h3><span style="font-size: 23px">2.</span>在出现的表格上修改书籍信息，点击修改，修改书籍信息</h3>
</div>
<div>
    <form id="form1" action="updateBook.jsp" method="post" >
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
        if (bookId!=""||bookName!=""){         //这是个bug.刚开始加载时，bookId与bookName都为null，当不输入点击搜索，bookId与bookName都为""
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
    <div>
    <form id="from2" method="post" enctype="multipart/form-data">
        <fieldset>
            <legend>书籍信息修改</legend>
            <label>序号：
                <input type="text" name="bookId" value="<%=book.getId()%>" required/>
            </label><br>
            <label>书名：
                <input type="text" name="bookName" value="<%=book.getName()%>" required/>
            </label><br>
            <label>作者：
                <input type="text" name="bookAuthor" value="<%=book.getAuthor()%>" required/>
            </label><br>
            <label>单价：
                <input type="text" name="bookPrice" value="<%=book.getPrice()%>" required/>
            </label><br>
            <label>描述：
                <textarea name="bookDescription" required><%=book.getDescription()%></textarea>
            </label><br>
            <label>类型：
                <input type="text" name="category_id" list="list1" required/>
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
            </label><br>
            <%--<input type="radio">--%>
            <input type="file" required name="photo">

        </fieldset>
        <div>
            <input type="button" value="确认" onclick="outputForm()" >
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
<script>
    function showMessage() {
        xmlHttp.onreadystatechange = function() {
            if (xmlHttp.readyState == 4) {
                if(xmlHttp.status == 200) {
                    var data = xmlHttp.responseText;
                    document.getElementById("book").innerHTML = data;
                }
            }
        };
        xmlHttp.open("GET", "client/getBook.jsp?id="+categoryID, true);
        xmlHttp.send();
    }

    function showMessage2() {
        
        var form = new FormData(document.getElementById("form2"));
        var req = new XMLHttpRequest();
        req.open("post", "/testServlet", true);
        req.send(form);
    }
    
    function outputForm() {
        var form = new FormData(document.getElementById("form2"));
//             var req = new XMLHttpRequest();
//             req.open("post", "${pageContext.request.contextPath}/public/testupload", false);
//             req.send(form);
        $.ajax({
            url:"/testServlet",
            type:"post",
            data:form,
            processData:false,
            contentType:false,
            success:function(data){
                window.clearInterval(timer);
                console.log("over..");
            },
            error:function(e){
                alert("错误！！");
                window.clearInterval(timer);
            }
        });
        get();//此处为上传文件的进度条
    }
    
</script>
<script src="../js/jquery.min.js" ></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/commons.js"></script>
</body>
</html>
