
<%@ page import="dao.userUtil" %>
<%@ page import="model.user" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 16051
  Date: 2018/11/25
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%--获取所有用户的信息--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>getUser</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
    <link href="../css/server.css" rel="stylesheet">
</head>
<body onload="initAJAX()">
<div>
    <h4>提示：</h4>
    <h5><span style="font-size: 23px">1.</span>输入序号或者用户名点击搜索来查询</h5>
    <h5><span style="font-size: 23px">2.</span>当不输入查询为查询所有</h5>
    <h5><span style="font-size: 23px">2.</span>当都输入查询，以序号为索引</h5></h5>
</div>
<div class="modal-body">
    <form class="form-group" action="getUser.jsp" method="post" >
        <fieldset>
            <legend>用户信息查询</legend>
            <div class="form-group">
                <label>序号：</label>
                <input name="userId" class="form-control" type="search" placeholder="非零的正整数"  pattern="^[1-9]\d*$">
            </div>
            <div class="form-group">
                <label>用户名：</label>
                <input name="userName" class="form-control" type="search" placeholder="中文、英文、数字包括下划线"  pattern="^[\u4E00-\u9FA5A-Za-z0-9_]+$">
            </div>
            <div>
                <input type="submit" value="查 询" >
            </div>

        </fieldset>
    </form>
</div>
<%
    request.setCharacterEncoding("utf-8");
    String userName=request.getParameter("userName");
    String userId=request.getParameter("userId");
    int i=0;
    userUtil userUtil=new userUtil();
    if (userId!=null||userName!=null){        //当输入不都为空时
            %>
<div id="table1">
    <table class="hovertable" border="1" width="100%">
        <caption><h2>用户信息</h2></caption>
        <tr>
            <th >序号</th>
            <th >ID</th>
            <th >用户名</th>
            <th>密码</th>
            <th >座机号</th>
            <th >手机号</th>
            <th >邮箱</th>
            <th >地址</th>
        </tr>
        <%
            if (userId!=""||userName!=""){  //这是个bug.刚开始加载时，Id与Name都为null，当不输入点击搜索，Id与Name都为""
                user user=null;
            if (userId!=""){  //只要id不为空   查询user以id为索引
                user=userUtil.getUser(Integer.parseInt(userId),null);
            }else  //查询user以name为索引
                user=userUtil.getUser(0,userName);
                if (user!=null){//输入了，人存在
        %>
        <tr>
            <td><%=i%></td>
            <td><%=user.getId()%></td>
            <td><%=user.getUsername()%></td>
            <td><%=user.getPassword()%></td>
            <td><%=user.getCellphone()%></td>
            <td><%=user.getPhone()%></td>
            <td><%=user.getEmail()%></td>
            <td><%=user.getAddress()%></td>
        </tr>
    <%
        }else {//输入了，但是人不存在
    %>
        <tr>
            <td colspan="8">此人不存在</td>
        </tr>
        <%
        }

        }else {
                ArrayList<user> userArrayList=userUtil.getAllUser();
                for (user user:userArrayList
                        ) {
        %>
        <tr>
            <td><%=i%></td>
            <td><%=user.getId()%></td>
            <td><%=user.getUsername()%></td>
            <td><%=user.getPassword()%></td>
            <td><%=user.getCellphone()%></td>
            <td><%=user.getPhone()%></td>
            <td><%=user.getEmail()%></td>
            <td><%=user.getAddress()%></td>
        </tr>
        <%

                }
            }
    }
%>

    </table>
</div>
<script src="../js/bgDataQuery.js"></script>
</body>
</html>
