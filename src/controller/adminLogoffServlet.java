package controller;

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
 * @date: Create in 2018/12/2  20:25
 * @package: ${PACKAGE_NAME}
 * @project: javaweb
 */
@WebServlet(name = "adminLogoffServlet")
public class adminLogoffServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session=request.getSession();
        admin admin= (model.admin) session.getAttribute("admin");
        System.out.println("logoff"+admin);
        session.removeAttribute("admin");
        response.sendRedirect("/server/admin.html");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request,response);
    }
}
