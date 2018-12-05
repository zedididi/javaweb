package controller;

import dao.insertUser;
import dao.userUtil;
import model.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "insertServlet")
public class insertServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("Cache-Control","no-cache");
        response.setContentType("text/html;charser=utf-8");
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String phone=request.getParameter("password2");
        String cellphone=request.getParameter("cellphone");
        String email=request.getParameter("email");
        String address=request.getParameter("address");
        //生成要插入的user
        user user = new user(null, username, password, phone,cellphone, email, address);
        //插入
        new insertUser().insertUser(user);
        //查询user
        userUtil userUtil=new userUtil();
        user=userUtil.getUser(-1,username);
        HttpSession session=request.getSession();
        session.setAttribute("user", user);
        System.out.println("registerSeesion:"+session.getAttribute("user"));
        System.out.println("registerUser:"+user);
        response.sendRedirect("/index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request,response);
    }
}
