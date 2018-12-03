package controller;

import dao.bookUtil;
import model.BookModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/12/3  18:03
 * @package: ${PACKAGE_NAME}
 * @project: javaweb
 */
@WebServlet(name = "deleteServlet")
public class deleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        String bookId = request.getParameter("bookId");
        String bookName = request.getParameter("bookName");
        bookUtil bookUtil = new bookUtil();
        if (bookId != null || bookName != null) { //当输入其中一个信息，bookId，bookName
            if (bookId != "" || bookName != "") {//这是个bug.刚开始加载时，bookId与bookName都为null，当不输入点击搜索，bookId与bookName都为""
                BookModel book = null;
                if (bookId != "") { //只要id不为空   查询book以id为索引（要看bookUtil().getbook(int id,String name)）
                    book = bookUtil.getBook(Integer.parseInt(bookId), null);
                } else   //查询book以name为索引
                    book = bookUtil.getBook(0, bookName);
                if (book != null) {  //输入了，书本存在  就删除此处
                    bookId= String.valueOf(book.getId());
                    if (bookUtil.deleteBook(book.getId())) {
                        request.setAttribute("deleteMessage", "此书删除成功！");
                        request.setAttribute("deleteBookId",bookId);
                        request.getRequestDispatcher("/server/deleteBook.jsp").forward(request, response);
                    }
                    else {
                        request.setAttribute("deleteMessage", "此书删除出错！");
                        request.setAttribute("deleteBookId",bookId);
                        request.getRequestDispatcher("/server/deleteBook.jsp").forward(request, response);
                    }

                } else {
                    request.setAttribute("deleteMessage", "此书不存在，无法删除！");
                    request.setAttribute("deleteBookId",bookId);
                    request.getRequestDispatcher("/server/deleteBook.jsp").forward(request, response);
                }


            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            doPost(request,response);
    }
}
