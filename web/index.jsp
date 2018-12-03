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
    <style>
        /*body{
            background-image: url("images/preview3.jpg");
            background-position: center center;
            background-size: cover;
        }*/
    </style>
</head>
<body  onload="initAJAX()" <%--style="background-image: url("images/preview3.jpg")--%>>
<script src="js/jquery.min.js" ></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/commons.js"></script>
<div class="header">
    <div class="container">
        <div class="row">
            <div class="login span4 ">
                <h1><a href="server/admin.html"  rel="tooltip" data-placement="bottom" data-
                       placement="bottom" data-toggle="modal"> 欢迎来到<strong>SuperGod</strong>的书店</a>
                    <span class="red ">.</span></h1>
                <a class="home" href="index.jsp" rel="tooltip" data-placement="bottom" data-
                   placement="bottom"  data-toggle="modal" data-target="#myModal"></a>
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
    <div class="col-md-2"> <%--左侧菜单div控制--%>
        <ul class="nav nav-list">
            <li class="nav-header text-center text-dark"  ><strong >书籍类型</strong></li>
            <%

                String sql = "select id,name,description from category";
                getConn connectionUtil = new getConn();
                Connection conn = connectionUtil.getConn();
                Statement stat = conn.createStatement();
                ResultSet rs = stat.executeQuery(sql);
                while (rs.next()) {

            %>
            <li class=" text-center">
                <a href='javascript:showBook("<%=rs.getString("id")%>")'><strong><%=rs.getString("name")%></strong></a>
            </li>
            <%
                }
                stat.close();
                conn.close();
            %>
        </ul>
    </div><%--左侧菜单div控制--%>
    <div class="col-md-10" id="book">

        <div id="myCarousel" class="carousel slide" style="width: 80%;">
            <!-- 轮播（Carousel）指标 -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <!-- 轮播（Carousel）项目 -->
            <div class="carousel-inner">
                <div class="item active">
                    <a href="client/subject.jsp?author=金庸"><img src="images/0.jpg" alt="First slide"></a>
                    <div class="carousel-caption"></div>
                </div>
                <div class="item">
                    <a href="client/subject.jsp"><img src="images/1.jpg" alt="Second slide"></a>
                    <div class="carousel-caption"></div>
                </div>
                <div class="item">
                    <a href="client/subject.jsp"><img src="images/2.jpg" alt="Third slide"></a>
                    <div class="carousel-caption"></div>
                </div>
            </div>
            <!-- 轮播（Carousel）导航 -->
            <a class="carousel-control left" href="#myCarousel"
               data-slide="prev"> <span _ngcontent-c3="" aria-hidden="true" class="glyphicon glyphicon-chevron-right"></span></a>
            <a class="carousel-control right" href="#myCarousel"
               data-slide="next">&rsaquo;</a>
        </div>


    </div>
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
        };
        xmlHttp.open("GET", "client/getBook.jsp?id="+categoryID, true);
        xmlHttp.send();
    }

    function addBook(bookID) {
        xmlHttp.open("POST","/AddBookServlet?BookID=" + bookID,true);
        xmlHttp.onreadystatechange=function () {
            if (xmlHttp.readyState == 4 && xmlHttp.status == 200){
                alert("加入购物车成功")
            }
        };
        xmlHttp.send();
    }
</script>
</body>
</html>

