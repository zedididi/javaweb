<%@ page import="model.admin" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="java.awt.*" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="java.util.Random" %><%--
  Created by IntelliJ IDEA.
  User: 16051
  Date: 2018/12/3
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    response.setHeader("Cache-Control","no-cache");
    int width=60,height=20;
    BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
    Graphics g=image.getGraphics();
    g.setColor(new Color(255,255,255));
    g.fillRect(0,0,width,height);
    //admin admin= (model.admin) request.getSession().getAttribute("admin");
    request.setCharacterEncoding("utf-8");
    String img= String.valueOf(request.getParameter("img"));
    g.setColor(new Color(32,178,170));
    g.setFont(new Font("宋体",Font.BOLD+Font.ITALIC,20));
    g.drawString(img,10,17);
    ImageIO.write(image,"JPEG",response.getOutputStream());
    out.clear();
    out=pageContext.pushBody();
%>
</body>
</html>
