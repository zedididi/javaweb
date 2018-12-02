package controller;

import dao.getUser;

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
        getUser u=new getUser();
        if (u!=null) {
            String name = u.getUser(username).getPassword();
            String code = request.getParameter("code");
            HttpSession session = request.getSession();
            String randStr = (String) session.getAttribute("randStr");
            PrintWriter out = response.getWriter();
            if (!code.equals(randStr)) {
                out.println("验证码有误");
            } else {
                if (name != null && name.equals(password)) {
                    HttpSession sessionUser = request.getSession();
                    sessionUser.setAttribute("username", u.getUser(name));
                    response.sendRedirect("../../index.jsp");
                } else {
                    JOptionPane.showMessageDialog(null, "wrong");
                    response.sendRedirect("../../client/login.html");
                }
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
