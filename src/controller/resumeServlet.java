package controller;

import dao.getUser;
import dao.insertUser;
import vo.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/11/24  18:57
 * @package: ${PACKAGE_NAME}
 * @project: javaweb
 */
@WebServlet(name = "resumeServlet")
public class resumeServlet extends HttpServlet {


    private static final long serialVersionUID=1L;

    public resumeServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String phone=request.getParameter("phone");
        String cellphone=request.getParameter("cellphone");
        String email=request.getParameter("email");
        String address=request.getParameter("address");
        user user=new user(null,username,password,phone,cellphone,email,address);
        new insertUser().insertUser(user);
        user=new getUser().getUser(username);
        Cookie userCookie=new Cookie(user.getId(),user.getUsername());
        userCookie.setMaxAge(60*60*24*7);
        response.addCookie(userCookie);
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><title>get cookies</title>");
        out.println("<body><h2>A cookie has been got from brower</h2>");
        out.println("UserName:" + user.getUsername() + "<br>");
        out.println("Address:" + user.getAddress() + "<br>");
        out.println("</body></html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request,response);
    }
}
