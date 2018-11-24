package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/11/9  23:01
 * @package: ${PACKAGE_NAME}
 * @project: javaweb
 */
@WebServlet(name = "DealWithServlet")
public class DealWithServlet extends HttpServlet {
    private static final long serialVersionUID=1L;

    public DealWithServlet(){
        super();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String country=request.getParameter("country");
        String city=request.getParameter("city");
        String county=request.getParameter("county");
        String resume=request.getParameter("resume");
        System.out.println("用户名："+name+"\n" +
                "邮箱："+email+"\n" +
                "国家："+country+"\n" +
                "城市："+city+"\n" +
                "县区："+county+"\n" +
                "简历："+resume+"\n");

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();

        out.println("<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "<head>\n" +
                "<title>个人简历</title>\n" +
                "<body>" +
                "<h1 align=\"center\">个人简历</h1>" +
                "<ul align=\"center\">\n" +
                "<li>姓 名："+name+"</li>\n"+
                "<li>国 家："+country+"</li>\n"+
                "<li>城 市："+city+"</li>\n"+
                "<li>县 区："+county+"</li>\n"+
                "<li>邮 政："+email+"</li>\n"+
                "<li>简 历："+resume+"</li>\n" +
                "</ul>" +
                "</body>" +
                "</html>");

    }
}

