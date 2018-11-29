package controller;
/**
 * 购物车中的添加书籍功能
 */

import model.BookModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

public class AddServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException,ServletException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        int bookID = Integer.parseInt(request.getParameter("BookID"));
        HashMap<Integer,Map.Entry<BookModel,Integer>> map = (HashMap<Integer, Map.Entry<BookModel,Integer>>) session.getAttribute("ShoppingCar");
        Map.Entry<BookModel,Integer> entry = map.get(bookID);
        int quality = entry.getValue();
        BookModel bookModel = entry.getKey();
        map.put(bookID,Map.entry(bookModel,quality+1));
        session.setAttribute("ShoppingCar",map);
        out.write(String.valueOf(quality+1));
    }
}
