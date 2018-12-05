package dao;

import model.book;
import model.order;
import model.orderItem;
import model.userOrders;

import java.sql.*;
import java.util.*;
import java.util.Date;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/11/28  22:29
 * @package: dao
 * @project: javaweb
 */
public class orderUtil {

    public orderItem getOrderItem( int id){   //id orderitem表的id

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

                }
            }
                conn.close();

        }catch (SQLException e) {
            e.printStackTrace();
        }

        return orderItem;
    }

    public order getOrder(int id){  //id orders表的id
        Connection conn=new getConn().getConn();
        order order=null;
        ResultSet set=null;
        orderItem orderItem=null;
        ArrayList<orderItem> orderItemArrayList=new ArrayList<>();
        boolean result=false;

        java.util.Date order_date=null;
        double order_price=0;
        boolean order_state = false;
        String user_id=null;
        orderUtil orderUtil=new orderUtil();


        String sql="select orderitem.id,orders.ordertime,orders.price,orders.state ,user_id from orderitem,orders where orderitem.order_id=orders.id and orders.id=?;";
        try{
            try(PreparedStatement pstat=conn.prepareStatement(sql)){
                pstat.setInt(1,id);
                set=pstat.executeQuery();

                while (set.next()){
                    result=true;
                    int orderitem_id=set.getInt(1);
                    order_date= new Date((Long) set.getObject(2)) ;
                    order_price=set.getDouble(3);
                    order_state=set.getBoolean(4);
                    orderItem=orderUtil.getOrderItem(orderitem_id);
                    orderItemArrayList.add(orderItem);
                }
                if (result) {
                    order = new order(id, order_date, order_price, order_state,orderItemArrayList);
                }
            }
            conn.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }

        return order;
    }


    public userOrders getUserOrders(int id,int state){
        //id  user表的id
        // state属性含义: -1 代表初始订单， 0 代表 初始和已完成订单， 1 代表已完成订单
        Connection conn=new getConn().getConn();
        userOrders userOrders=null;
        ResultSet set=null;
        boolean result=false;
        Comparator<order> orderComparator=new Comparator<order>() {
            @Override
            public int compare(order o1, order o2) {
                if (o2.getDate().compareTo(o1.getDate())!=0)
                    return o2.getDate().compareTo(o1.getDate());
                else
                    return o1.getId()-o2.getId();
            }
        };
        ArrayList<order> orderArrayList=new ArrayList<>();
        order order=null;
        double price=0;

        String user_name=null;
        String user_phone=null;

        String sql="select orders.id,user.username,user.phone from user,orders where orders.user_id=user.id and user.id=?";
        if (state==-1||state==1)
            sql += " and orders.state=? ;";
        try{
            try(PreparedStatement pstat=conn.prepareStatement(sql)){
                pstat.setInt(1,id);
                if (state==-1)
                    pstat.setBoolean(2,false);
                else if(state==1)
                    pstat.setBoolean(2,true);

                System.out.println(sql);
                set=pstat.executeQuery();

                while (set.next()){

                    result=true;
                    int orders_id=set.getInt(1);
                    user_name=set.getString(2);
                    user_phone=set.getString(3);
                    order=getOrder(orders_id);
                    price+=order.getPrice();
                    orderArrayList.add(order);
                }

                if (result){
                    Collections.sort(orderArrayList,orderComparator);
                    userOrders=new userOrders(id,user_name,user_phone,price,orderArrayList);
                }
            }
            conn.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println(userOrders);

        return userOrders;
    }

    public userOrders getUserAllOrders(int id){
        //id  user表的id
        // state属性含义: -1 代表初始订单， 0 代表 初始和已完成订单， 1 代表已完成订单
        Connection conn=new getConn().getConn();
        userOrders userOrders=null;
        ResultSet set=null;
        boolean result=false;
        Comparator<order> orderComparator=new Comparator<order>() {
            @Override
            public int compare(order o1, order o2) {
                if (o2.getDate().compareTo(o1.getDate())!=0)
                    return o2.getDate().compareTo(o1.getDate());
                else
                    return o1.getId()-o2.getId();
            }
        };
        ArrayList<order> orderArrayList=new ArrayList<>();
        order order=null;
        double price=0;

        String user_name=null;
        String user_phone=null;

        String sql="select orders.id,user.username,user.phone from user,orders where orders.user_id=user.id and user.id=?";

        try{
            try(PreparedStatement pstat=conn.prepareStatement(sql)){
                pstat.setInt(1,id);
                set=pstat.executeQuery();

                while (set.next()){
                    result=true;
                    int orders_id=set.getInt(1);
                    user_name=set.getString(2);
                    user_phone=set.getString(3);
                    order=new orderUtil().getOrder(orders_id);
                    price+=order.getPrice();
                    orderArrayList.add(order);
                }

                if (result){
                    Collections.sort(orderArrayList,orderComparator);
                    userOrders=new userOrders(id,user_name,user_phone,price,orderArrayList);
                }
            }
            conn.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }

       // System.out.println(userOrders);

        return userOrders;
    }

    public boolean updateOrderState(int id,boolean state){ //id   order表的id
        boolean result=false;
        Connection conn=new getConn().getConn();

        int i=0;
        String sql="update orders set state=? where id=?;";

        try{
            try(PreparedStatement pstat=conn.prepareStatement(sql)){

                pstat.setBoolean(1,state);
                pstat.setInt(2,id);
                i=pstat.executeUpdate();

                if (i>0)
                    result =true;
            }

            conn.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }


        return result;
    }

    public boolean insertOrder(order order){
        boolean result=false;
        int i=0;
        Connection conn=new getConn().getConn();
        String sql="insert into orders(ordertime,price,state,user_id) values(?,?,?,?);";

        try{
            try (PreparedStatement pstat=conn.prepareStatement(sql)){
                pstat.setObject(1,order.getDate());
                pstat.setDouble(2,order.getPrice());
                pstat.setBoolean(3,order.isState());
                pstat.setString(4,order.getUser_id());
                i=pstat.executeUpdate();
                if (i>0) {
                    result = true;
                    System.out.println("insertOrder:"+getOrder(order.getId()));
                }

            }
            conn.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean insertOrderItem(orderItem orderItem){
        boolean result=false;
        int i=0;
        Connection conn=new getConn().getConn();
        String sql="insert into orderItem(quantity,price,order_id,book_id) values(?,?,?,?);";
        try{
            try(PreparedStatement pstat=conn.prepareStatement(sql)){
                pstat.setInt(1, orderItem.getQuantity());
                pstat.setDouble(2,orderItem.getPrice());
                pstat.setString(3,orderItem.getOrder_id());
                pstat.setString(4,orderItem.getBook_id());
                i=pstat.executeUpdate();
                if (i>0){
                    result=true;
                    System.out.println("insertOrderItem:"+orderItem);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }


    public order getAOrderB_2(order order) {
        Connection conn=new getConn().getConn();
        ResultSet set=null;
        orderItem orderItem=null;
        ArrayList<orderItem> orderItemArrayList=new ArrayList<>();
        boolean result=false;

        java.util.Date order_date=null;
        double order_price=0;
        boolean order_state = false;
        String user_id=null;
        orderUtil orderUtil=new orderUtil();
        Timestamp timestamp=new Timestamp(order.getDate().getTime());


        String sql="select id from orders where ordertime=?,price=?,state=?,user_id=?;";
        try{
            try(PreparedStatement pstat=conn.prepareStatement(sql)){
               pstat.setTimestamp(1,timestamp);
               pstat.setDouble(2,order.getPrice());
               pstat.setBoolean(3,order.isState());
               pstat.setString(4,order.getUser_id());
                set=pstat.executeQuery();

               if(set.next())
                   order.setId(set.getInt(1));

            }
            conn.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }

        return order;
    }
}
