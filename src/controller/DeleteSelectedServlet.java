package controller;
/**
 * 购物车删除选中书籍功能
 */

import model.BookModel;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

public class DeleteSelectedServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException,ServletException {
        PrintWriter out =response.getWriter();
        String[] bookIDs = request.getParameterValues("choose");
        ServletContext application = request.getServletContext();
        HttpSession session = request.getSession();
        HashMap<Integer,Map.Entry<BookModel,Integer>> map = (HashMap<Integer, Map.Entry<BookModel,Integer>>) session.getAttribute("ShoppingCar");
        for (String s:bookIDs){
            int bookID = Integer.parseInt(s);
            map.remove(bookID);
        }
        RequestDispatcher dispatcher = application.getRequestDispatcher("/client/ShowShoppingCar_.jsp");
        dispatcher.forward(request,response);
        out.write("<script>alert('删除成功')</script>");

    }
}
