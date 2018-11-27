<%@ page import="java.util.ArrayList" %>
<%@ page import="model.books" %><%--
  Created by IntelliJ IDEA.
  User: 16051
  Date: 2018/11/25
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%

    request.setCharacterEncoding("utf-8");
    String bookname=request.getParameter("bookname");
    ArrayList<books> list= (ArrayList) session.getAttribute("books");
    if (list==null){
        list=new ArrayList();
        //list.add(new books(null,bookname,String.valueOf(1)));
        session.setAttribute("books",list);
        System.out.println("不存在购车");
    }else {
        boolean x=false;   //假设此书在购物车中不存在
        for (books b:list
             ) {
            if(b.getBookname().equals(bookname)){
                b.setNum(String.valueOf(Integer.parseInt(b.getNum())+1));
                x=true;
            }
        }
        if (!x){
           //  list.add(new books(null,bookname,String.valueOf(1)));
            session.setAttribute("books",list);
        }
    }


%>

</body>
</html>
