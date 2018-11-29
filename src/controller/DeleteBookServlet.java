package controller;
/**
 * 购物车删除书籍功能
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
import java.util.HashMap;
import java.util.Map;

public class DeleteBookServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException,ServletException {
        ServletContext application = request.getServletContext();
        int bookID = Integer.parseInt(request.getParameter("BookID"));
        HttpSession session = request.getSession();
        HashMap<Integer,Map.Entry<BookModel,Integer>> map = (HashMap<Integer, Map.Entry<BookModel,Integer>>) session.getAttribute("ShoppingCar");
        map.remove(bookID);
        session.setAttribute("ShoppingCar",map);
        RequestDispatcher dispatcher = application.getRequestDispatcher("/client/ShowShoppingCar_.jsp");
        dispatcher.forward(request,response);

    }
}
