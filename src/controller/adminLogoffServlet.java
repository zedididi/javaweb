package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        request.getSession().removeAttribute("admin");
        response.sendRedirect("/server/admin.html");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
