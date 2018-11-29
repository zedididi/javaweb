package controller;

/**
 * 添加书籍到购物车.使用Session进行存储
 */

import dao.BookDAO;
import model.BookModel;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


public class AddBookServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException {
        HttpSession session = request.getSession();
        int book_id = Integer.parseInt(request.getParameter("BookID"));
        BookModel bookModel = BookDAO.queryBookModel(book_id);
        HashMap<Integer, Map.Entry<BookModel,Integer>> shoppingCar = (HashMap)session.getAttribute("ShoppingCar");
        if (shoppingCar== null){
            shoppingCar = new HashMap<>();
            session.setAttribute("ShoppingCar",shoppingCar);
            shoppingCar.put(book_id,Map.entry(bookModel,1));
        }else {
            if (shoppingCar.containsKey(book_id)){
                Map.Entry entry = shoppingCar.get(book_id);
                int quantity = (int)entry.getValue();
                shoppingCar.put(book_id,Map.entry(bookModel,++quantity));
                System.out.println(quantity);
            }
            else{
                shoppingCar.put(book_id,Map.entry(bookModel,1));
            }
        }
    }
}
