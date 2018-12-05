package controller;

import dao.userUtil;
import model.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/11/24  23:08
 * @package: ${PACKAGE_NAME}
 * @project: javaweb
 */
@WebServlet(name = "loginServlet")
public class loginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public loginServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("gb2312");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        userUtil u=new userUtil();


        user user=u.getUser(0,username);
        if(user!=null) {
            String userPassword = user.getPassword();
            String code = request.getParameter("code");
            HttpSession session = request.getSession();
            String randStr = (String) session.getAttribute("randStr");
            System.out.println("randStr" + randStr);
            PrintWriter out = response.getWriter();
            if (!code.equals(randStr)) {
                out.println("验证码有误");
            } else {
                if (userPassword != null && userPassword.equals(password)) {
                    session.setAttribute("user", user);
                    System.out.println("login:" + session.getAttribute("user"));
                    // request.getRequestDispatcher("/index.jsp").forward(request, response);
                    response.sendRedirect("/index.jsp");
                } else {
                    System.out.println("name 为空 ");
                    JOptionPane.showMessageDialog(null, "wrong");
                    response.sendRedirect("/client/login.html");
                }
            }
        }else {
            System.out.println("name 为空 ");
            JOptionPane.showMessageDialog(null, "wrong");
            response.sendRedirect("/client/login.html");
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
