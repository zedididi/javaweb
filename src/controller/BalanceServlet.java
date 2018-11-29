package controller;
/**
 * 购物车中的全选以及单选功能
 */

import model.BookModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;

public class BalanceServlet extends HttpServlet {
    private static double total = 0;
    private static int quality = 0;
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException,ServletException {
        String [] array = request.getParameter("BookIDs").split(" ");
        System.out.println(array);
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        HashMap<Integer,Map.Entry<BookModel,Integer>> map = (HashMap<Integer, Map.Entry<BookModel,Integer>>) session.getAttribute("ShoppingCar");

        for (String s:array){
            int bookID = Integer.parseInt(s);
            Map.Entry entry = map.get(bookID);
            BookModel bookModel = (BookModel)entry.getKey();
            int amount = (int)entry.getValue();
            quality += amount;
            total = total + amount*bookModel.getPrice();
            DecimalFormat df = new DecimalFormat("#.00");
            total = Double.parseDouble(df.format(total));
        }
        out.write(quality+" "+ total  );
        total = 0;
        quality=0;
    }
}
