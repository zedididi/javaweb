<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="dao.getConn" %><%--
  Created by IntelliJ IDEA.
  User: 16051
  Date: 2018/11/28
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/style.css" rel="stylesheet"/>
    <title>网上书店</title>
</head>
<body  onload="initAJAX()">
<script src="js/jquery.min.js" ></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/commons.js"></script>
<div class="header">
    <div class="container">
        <div class="row">
            <div class="login span4">
                <h1><a href="server/admin.html"  rel="tooltip" data-placement="bottom" data-
                       placement="bottom" data-toggle="modal" data-target="#myModal"> 欢迎来到<strong>我的</strong>书店</a>
                    <span class="red">.</span></h1>
            </div>
            <div class="links span8">
                <a class="car" rel="tooltip" data-placement="bottom" data-
                   placement="bottom" data-toggle="modal" href="client/ShowShoppingCar_.jsp"></a>
                <a class="login" href="client/login.html" rel="tooltip" data-placement="bottom" data-
                   placement="bottom"  data-toggle="modal" data-target="#myModal"></a>
                <a class="register" href="client/register.html" rel="tooltip" data-placement="bottom"
                   data-toggle="modal" data-target="#myModal"></a>
            </div>
        </div>
    </div>
</div> <%--header--%>
<div class="row"> <%--下方左右div控制--%>
    <div class="col-md-3"> <%--左侧菜单div控制--%>
        <ul class="nav nav-list">
            <li class="nav-header">书籍类型</li>
            <%

                String sql = "select id,name,description from category";
                getConn connectionUtil = new getConn();
                Connection conn = connectionUtil.getConn();
                Statement stat = conn.createStatement();
                ResultSet rs = stat.executeQuery(sql);
                while (rs.next()) {
            %>
            <li>
                <a href='javascript:showBook("<%=rs.getString("id")%>")'><%=rs.getString("name")%></a>
            </li>
            <%
                }
                stat.close();
                conn.close();
            %>
        </ul>
    </div><%--左侧菜单div控制--%>
    <div class="col-md-9" id="book"></div>
</div><%--下方左右div控制--%>
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header"></div>
            <div class="modal-body"></div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>
<script language="JavaScript">
    function showBook(categoryID) {
        xmlHttp.onreadystatechange = function() {
            if (xmlHttp.readyState == 4) {
                if(xmlHttp.status == 200) {
                    var data = xmlHttp.responseText;
                    document.getElementById("book").innerHTML = data;
                }
            }
        }
        xmlHttp.open("GET", "client/getBook.jsp?id="+categoryID, true);
        xmlHttp.send();
    }

    function addBook(bookID) {
        xmlHttp.open("POST","/AddBookServlet?BookID=" + bookID,true);
        xmlHttp.onreadystatechange=function () {
            if (xmlHttp.readyState == 4 && xmlHttp.status == 200){
                alert("加入购物车成功")
            }
        }
        xmlHttp.send();
    }
</script>
</body>
</html>

