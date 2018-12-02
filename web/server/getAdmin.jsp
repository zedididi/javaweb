<%--
  Created by IntelliJ IDEA.
  User: 16051
  Date: 2018/11/25
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>

<%--判断管理登陆信息是否正确--%>
<%@ page import="model.*,dao.*" contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String adminname=request.getParameter("adminname");
    String password=request.getParameter("password");
    admin admin=new adminUtil().getAdmin(adminname);
    if (admin!=null&&admin.getPassword().equals(password)){
        session.setAttribute("admin",admin);
        System.out.println(session.getAttribute("admin").toString());
        %>
       <jsp:forward page="adminUI.jsp"></jsp:forward>
<%
    }
    else
        response.sendRedirect("admin.html");
%>

</body>
</html>
