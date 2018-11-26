package controller;

import dao.getUser;
import vo.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/11/24  23:08
 * @package: ${PACKAGE_NAME}
 * @project: javaweb
 */
@WebServlet(name = "loginServlet")
public class loginServlet extends HttpServlet {
    private static final long serialVersionUID=1L;

    public loginServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        user user=new getUser().getUser(username);
        if (user!=null&&user.getUsername().equals(password)){
            Cookie userCookie=new Cookie(user.getId(),user.getUsername());
            userCookie.setMaxAge(60*60*24*7);
            response.addCookie(userCookie);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
