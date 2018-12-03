package dao;

import model.BookModel;
import model.category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/11/30  10:51
 * @package: dao
 * @project: javaweb
 */
public class bookUtil {

    //支持id和Name查询
    //当name为null，查询模式是以id为索引；
    //当name不为null，查询模式是以name为索引
    public BookModel getBook(int id,String name){

        BookModel bookModel=null;
        Connection conn=new getConn().getConn();
        String sql="select * from book where ";
        if (name==null)
            sql+=" id=?;";
        else
            sql+=" name=?;";
        ResultSet set=null;
        try{
            try(PreparedStatement pstat=conn.prepareStatement(sql)) {

                if (name==null)
                    pstat.setInt(1,id);
                else
                    pstat.setString(1,name);
                set=pstat.executeQuery();

                if (set.next()){
                    bookModel = new BookModel(set.getInt(1),set.getString(2),set.getString(3),
                            set.getDouble(4),set.getString(5),set.getString(6),set.getString(7));
                   System.out.println(bookModel);
                }

            }
            conn.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }

        return bookModel;

    }
    public ArrayList<BookModel> getAllBook(){

        ArrayList<BookModel> bookModelArrayList=new ArrayList<>();
        BookModel bookModel=null;
        Connection conn=new getConn().getConn();
        String sql="select * from book;";
        ResultSet set=null;
        try{
            try(PreparedStatement pstat=conn.prepareStatement(sql)) {
                set=pstat.executeQuery();

                while (set.next()){
                    bookModel = new BookModel(set.getInt(1),set.getString(2),set.getString(3),
                            set.getDouble(4),set.getString(5),set.getString(6),set.getString(7));
                    bookModelArrayList.add(bookModel);
                }

            }
            conn.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }

        return bookModelArrayList;

    }


    //获取category表所有的数据
    public ArrayList<category> getAllCategory(){
        ArrayList<category> categoryArrayList=new ArrayList<>();
        Connection conn=new getConn().getConn();
        category category=null;
        ResultSet set=null;
        String sql="select * from category ;";
        try{
            try(PreparedStatement pstate=conn.prepareStatement(sql)){
                set=pstate.executeQuery();

                while (set.next()){
                    category=new category(set.getInt(1),set.getString(2),set.getString(3));
                    categoryArrayList.add(category);
                   // System.out.println(category);
                }

            }
            conn.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }

        return categoryArrayList;
    }

    //查询category  以id为索引
    public category getCategory(int id){

        Connection conn=new getConn().getConn();
        category category=null;
        ResultSet set=null;
        String sql="select * from category where id=?;";
        try{
            try(PreparedStatement pstate=conn.prepareStatement(sql)){
                pstate.setInt(1,id);
                set=pstate.executeQuery();

                while (set.next()){
                    category=new category(set.getInt(1),set.getString(2),set.getString(3));
                   // System.out.println("category 查询结果："+category);
                }

            }
            conn.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }

        return category;
    }

    //插入book
    public boolean insertBook(BookModel book){
        boolean result=false;
        int i=0;
        Connection conn=new getConn().getConn();
        String sql="insert into book(name,author,price,image,description,category_id) values(?,?,?,?,?,?);";
        try{
            try(PreparedStatement pstate=conn.prepareStatement(sql)) {
                pstate.setString(1,book.getName());
                pstate.setString(2,book.getAuthor());
                pstate.setDouble(3,book.getPrice());
                pstate.setString(4,book.getImage());
                pstate.setString(5,book.getDescription());
                pstate.setInt(6, Integer.parseInt(book.getCategory_id()));
                i=pstate.executeUpdate();

                if (i > 0) {
                    result=true;
                   // System.out.println("book 插入成功"+new bookUtil().getBook(0,book.getName()));
                }
            }

            conn.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    //插入category
    public boolean insertCategory(category category){
        boolean result=false;
        int i=0;
        Connection conn=new getConn().getConn();
        String sql="insert into category(name,description) values(?,?);";

        try{
            try(PreparedStatement pstat=conn.prepareStatement(sql)) {
                pstat.setString(1,category.getName());
                pstat.setString(2,category.getDescription());
                i=pstat.executeUpdate();
                if (i > 0) {
                    result=true;
                    //System.out.println("category 插入成功"+category);
                }
            }
            conn.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    //修改book  要求：有book表的全部属性
    //修改就是都修改，在后端修改了属性某个或者都修改了，把所有的属性都加入到book中
    public boolean updateBook(BookModel book){

        boolean result=false;
        Connection conn=new getConn().getConn();
        int i=0;
        String sql="update book set name=?,author=?,price=?,image=?,description=?,category_id=? where id=?;";
        try{
            try(PreparedStatement pstat=conn.prepareStatement(sql)) {
                pstat.setString(1,book.getName());
                pstat.setString(2,book.getAuthor());
                pstat.setDouble(3,book.getPrice());
                pstat.setString(4,book.getImage());
                pstat.setString(5,book.getDescription());
                pstat.setInt(6, Integer.parseInt(book.getCategory_id()));
                pstat.setInt(7,book.getId());

                i=pstat.executeUpdate();

                if (i>0){
                    result=true;
                    //System.out.println("book更新成功："+new bookUtil().getBook(book.getId(),null));
                }
            }
            conn.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
}
