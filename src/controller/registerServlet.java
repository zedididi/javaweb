package controller;

import dao.getUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @auther: Markson
 * @date: Create in 2018/11/26  18:57
 * @package: ${PACKAGE_NAME}
 * @project: javaweb
 */
@WebServlet(name = "resumeServlet")
public class registerServlet extends HttpServlet {


    private static final long serialVersionUID=1L;

    public registerServlet() {
        super();
    }

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
        //HttpSession se=request.getSession();
        getUser u=new getUser();
        PrintWriter out=response.getWriter();
        if(u.getUser(username)!=null) {
          out.println("<font color='red'>该用户名已经存在，请重新输入!</font>:1");
          return;
        } else {
          /* double money=10000;
            user user = new user(null, username, password, phone,cellphone, email, address,money);
            out.println(user);
            new insertUser().insertUser(user);*/
            out.println("<font color='green'>恭喜您，该用户名可以使用!</font>:2");
            return;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
