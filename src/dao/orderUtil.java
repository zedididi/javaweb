package dao;

import model.book;
import model.order;
import model.orderItem;
import model.userOrders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/11/28  22:29
 * @package: dao
 * @project: javaweb
 */
public class orderUtil {

    public orderItem getOrderItem( int id){

        Connection conn=new getConn().getConn();
        orderItem orderItem=null;

        ResultSet set=null;
        String sql="select book.id,book.name,author,book.price,book.image,book.description,category.id,category.name,orderitem.id,"+
                "orderitem.quantity,orderitem.price from book,category,orderitem where book.category_id=category.id and orderitem.book_id=book.id and" +
                " orderitem.id=?;";

        try{
            try(PreparedStatement pstat=conn.prepareStatement(sql)){
                pstat.setInt(1,id);
                set=pstat.executeQuery();

                if (set.next()){
                    int book_id=set.getInt(1);
                    String book_name=set.getString(2);
                    String book_author=set.getString(3);
                    double book_price=set.getDouble(4);
                    String book_image=set.getString(5);
                    String book_dec=set.getString(6);
                    int category_id=set.getInt(7);
                    String category_name=set.getString(8);
                    int orderitem_id=set.getInt(9);
                    int orderitem_quantity=set.getInt(10);
                    double orderitem_price=set.getDouble(11);

                    book book=new book(book_id,book_name,book_author,book_price,book_image,book_dec,category_id,category_name);
                    orderItem=new orderItem(orderitem_id,orderitem_quantity,orderitem_price,book);

                   // System.out.println("orderitme:"+orderItem);
                }
            }
                conn.close();

        }catch (SQLException e) {
            e.printStackTrace();
        }

        return orderItem;
    }

    public order getOrder(int id){
        Connection conn=new getConn().getConn();
        order order=null;
        ResultSet set=null;
        orderItem orderItem=null;
        ArrayList<orderItem> orderItemArrayList=new ArrayList<>();
        boolean result=false;

        java.util.Date order_date=null;
        double order_price=0;
        boolean order_state = false;


        String sql="select orderitem.id,orders.ordertime,orders.price,orders.state from orderitem,orders where orderitem.order_id=orders.id and orders.id=?";
        try{
            try(PreparedStatement pstat=conn.prepareStatement(sql)){
                pstat.setInt(1,id);
                set=pstat.executeQuery();

                if (set.next()){
                    result=true;
                    int orderitem_id=set.getInt(1);
                    order_date= new Date((Long) set.getObject(2)) ;
                    order_price=set.getDouble(3);
                    order_state=set.getBoolean(4);

                    orderItem=new orderUtil().getOrderItem(orderitem_id);
                    orderItemArrayList.add(orderItem);
                }
                if (result) {
                    order = new order(id, order_date, order_price, order_state, orderItemArrayList);
                    //System.out.println(order);
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }


        return order;
    }


    public userOrders getUserOrders(int id){
        Connection conn=new getConn().getConn();
        userOrders userOrders=null;
        ResultSet set=null;
        boolean result=false;
        ArrayList<order> orderArrayList=new ArrayList<>();
        order order=null;

        String user_name=null;
        String user_phone=null;


        String sql="select orders.id,user.username,user.phone from user,orders where orders.user_id=user.id and user.id=?;";
        try{
            try(PreparedStatement pstat=conn.prepareStatement(sql)){
                pstat.setInt(1,id);
                set=pstat.executeQuery();

                if (set.next()){

                    result=true;
                    int orders_id=set.getInt(1);
                    user_name=set.getString(2);
                    user_phone=set.getString(3);

                    order=new orderUtil().getOrder(orders_id);
                    orderArrayList.add(order);
                }

                if (result){
                    userOrders=new userOrders(id,user_name,user_phone,orderArrayList);
                    System.out.println(userOrders);
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }

        return userOrders;
    }





}
