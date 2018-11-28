package controller;

import dao.getAdmin;
import model.admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/11/25  19:23
 * @package: ${PACKAGE_NAME}
 * @project: javaweb
 */
@WebServlet(name = "adminServlet")
public class adminServlet extends HttpServlet {
    private static final long serialVersionUID=1L;

    public adminServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String adminname = request.getParameter("adminname");
        String password = request.getParameter("password");
        admin admin = new getAdmin().getAdmin(adminname);
        if (admin != null && admin.getPassword().equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            System.out.println(session.getAttribute("admin").toString());
        }
        else
            response.sendRedirect("../admin.html");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
