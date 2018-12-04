package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/12/4  13:56
 * @package: ${PACKAGE_NAME}
 * @project: javaweb
 */
@WebServlet(name = "userLogoffServlet")
public class userLogoffServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        request.getSession().removeAttribute("user");
        response.sendRedirect("/index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
