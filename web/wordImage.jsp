<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="java.awt.*" %>
<%@ page import="java.awt.image.BufferedImage" %><%--
  Created by IntelliJ IDEA.
  User: 16051
  Date: 2018/12/4
  Time: 13:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>test</title>
    <style>


    </style>
</head>
<body>
<%
    response.setHeader("Cache-Control","no-cache");
    int width=60,height=20;
    BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
    Graphics2D g2d = image.createGraphics();
    // ----------  增加下面的代码使得背景透明  -----------------
    image = g2d.getDeviceConfiguration().createCompatibleImage(width, height, Transparency.TRANSLUCENT);
    g2d.dispose();
    g2d = image.createGraphics();
// ----------  背景透明代码结束  -----------------


// 画图
    g2d.setColor(new Color(199,21,13));
    //g2d.setStroke(new BasicStroke(1));
    request.setCharacterEncoding("utf-8");
    String img= String.valueOf(request.getParameter("img"));
    g2d.setFont(new Font("宋体",Font.BOLD,19));
    g2d.drawString(img,0,17);
//释放对象
    g2d.dispose();
// 保存文件
    ImageIO.write(image, "png", response.getOutputStream());
    out.clear();
    out=pageContext.pushBody();
%>
</body>
</html>