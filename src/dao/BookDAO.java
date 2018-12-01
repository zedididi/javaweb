package dao;

import model.BookModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {
    public static List<BookModel> queryBook(int category_id){
        List<BookModel> list = new ArrayList<>();
        Connection conn = new getConn().getConn();
        String sql = "select id,name,author,price,image,description,category_id from book where category_Id = ?";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1,category_id);
            ResultSet set = ps.executeQuery();
            while (set.next()){
                list.add(new BookModel(set.getInt("id"),set.getString("name"),set.getString("author"),
                        set.getDouble("price"),set.getString("image"),set.getString("description"),set.getString("category_id")));
            }

            ps.close();
            conn.close();
        }catch (SQLException ex){
            ex.printStackTrace();
        }
        return list;
    }

    //根据书本ID查询书籍
    public static BookModel queryBookModel(int bookID){
        BookModel bookModel = null;
        Connection conn = new getConn().getConn();
        String sql = "Select * from book where id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1,bookID);
            ResultSet set = ps.executeQuery();
            bookModel = new BookModel(set.getInt(1),set.getString(2),set.getString(3),
                    set.getDouble(4),set.getString(5),set.getString(6),set.getString(7));

            ps.close();
            conn.close();
        }catch (SQLException ex){
            ex.printStackTrace();
        }
        return bookModel;
    }
}
