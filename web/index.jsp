<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="dao.getConn" %>
<%@ page import="java.sql.PreparedStatement" %><%--
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
        .item_body{
            position: relative;
            left: 18.25%;
            width: 1200px;
            height: auto;
        }
        .item_body_book{
            background: white;
            float: left;
            width: 200px ;
            height: 250px;
        }
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

        <div id="myCarousel" class="carousel slide" style="width: 90%;">
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
                    <a href="client/cartoon.jsp?category_id=3"><img src="images/1.jpg" alt="Second slide"></a>
                    <div class="carousel-caption"></div>
                </div>
                <div class="item">
                    <a href=""><img src="images/2.jpg" alt="Third slide"></a>
                    <div class="carousel-caption"></div>
                </div>
            </div>
            <!-- 轮播（Carousel）导航 -->
            <a class="carousel-control left" href="#myCarousel"
               data-slide="prev"> <span _ngcontent-c3="" aria-hidden="true" class="glyphicon glyphicon-chevron-right"></span></a>
            <a class="carousel-control right" href="#myCarousel"
               data-slide="next">&rsaquo;</a>
        </div>


        <%

            String sql1 = "select id,name,author,price,image,description from book";
            Connection conn1 = new getConn().getConn();
            PreparedStatement pstat1 = conn1.prepareStatement(sql1);
            ResultSet rs1 = pstat1.executeQuery();
            while (rs1.next()) {

        %>
        <div class="item_body_book">
            <div style="text-align: center">
                <a href="" class="btn btn-default" role="button" data-toggle="modal" data-target="#<%=rs1.getString("name")%>"><img width="149px" height="149px" src=<%=rs1.getString("image")%>></a>
            </div>
            <div style="text-align: center">
                <p><%=rs1.getString("name")%></p>
                <p style="color: red">￥<%=rs1.getString("price")%></p>
            </div>
        </div>


<div class="modal fade" id="<%=rs1.getString("name")%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">书本详情    &nbsp;&nbsp;&nbsp;&nbsp;《<%=rs1.getString("name")%>》</h4>
            </div>
            <div class="modal-body">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs1.getString("description")%></div>
            <div class="modal-footer">

                <div align="left"><img src="<%=rs1.getString("image")%>"></div>
                <p>作者：<%=rs1.getString("author")%></p>
                <p style="color: red">售价：￥<%=rs1.getString("price")%></p>
                <button class="btn btn-primary" onclick="addBook(<%=rs1.getString("id")%>)">加入购物车</button><button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<%
    }
    pstat1.close();
    conn.close();
%>

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

