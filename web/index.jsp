<%@ page import="javax.print.DocFlavor" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: 16051
  Date: 2018/10/24
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="controller.adminServlet" %>
<%@ page import="dao.getAdmin" %>
<html>
<head>
    <title>网上书店</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body onload="initAJAX()">
<div class="header">
    <div class="container">
        <div class="row">
            <div class="login span4">
                <h1><a href=""> 欢迎来到<strong>我的</strong>书店</a>
                    <span class="red">.</span></h1>
            </div>
            <div class="links span8">
                <a class="login" href="client/login.html" rel="tooltip" data-placement="bottom" data-toggle="modal"
                   data-target="#myModal"><img src="images/login.png"></a>
                <a class="register" href="client/register.html" rel="tooltip" data-placement="bottom"
                   data-toggle="modal" data-target="#myModal"><img src="images/register.png"></a>
            </div>
        </div>
    </div>
</div>
<%--header--%>
<div class="row"> <%--下方左右div控制--%>
    <div class="col-md-3"> <%--左侧菜单div控制--%>
        <ul class="nav nav-list">
            <li class="nav-header">书籍管理</li>
            <%

                String sql = "select id,name,description from category";
                getConn connectionUtil = new getConn();
                Connection conn = connectionUtil.getConn();
                Statement stat = conn.createStatement();
                ResultSet rs = stat.executeQuery(sql);
                while (rs.next()) {
            %>
            <li>
                <a href='javascript:showBook("<%=rs.getString("id")%>")'><%=rs.getString("name")%>
                </a>
            </li>
            <%
                }
                stat.close();
                conn.close();
            %>
        </ul>
    </div>
    <%--左侧菜单div控制--%>

    <div class="col-md-9" id="book"><%--书籍布局控制--%>
        <%--Ajax的嵌入点--%>
    </div>
</div>
<%--下方左右div控制--%>

<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header"></div>
            <div class="modal-body"></div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>
<script src="js/bootstrap.min.js"></script>
<script src="js/commons.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/dataQuery.js"></script>
<script language="JavaScript">
    /* function showBook(categoryID) {
         xmlHttp.onreadystatechange=function () {
             if (xmlHttp.readyState==4){
                 if (xmlHttp.status==200){
                     var data=xmlHttp.responseText;
                     document.getElementById("book").innerHTML=data;
                 }
             }
         }
         xmlHttp.open("GET","getBook.jsp?id="+categoryID,true);
         xmlHttp.send();
     }*/
</script>
</body>
</html>
