package model;

import java.util.ArrayList;
import java.util.Date;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/11/28  22:30
 * @package: model
 * @project: javaweb
 */


//
    //id order表的id
    //Date order的下单时间
public class order {
    private int id;
   /* private Timestamp date;*/
    private Date date;
    private double price;
    private boolean state; //true代表已完成订单，false代表初始订单
    private String user_id;
    private ArrayList<orderItem> orderItemArrayList;

    public order() {
        this.id=0;
        this.date=null;
        this.price=0;
        this.state=false;
        this.user_id=null;
        this.orderItemArrayList=null;
    }

    public order(int id, Date date, double price, boolean state, ArrayList<orderItem> orderItemArrayList) {
        this.id = id;
        this.date = date;
        this.price = price;
        this.state = state;
        this.orderItemArrayList = orderItemArrayList;
        this.user_id=null;
    }

    public order(int id, Date date, double price, boolean state, String user_id , ArrayList<orderItem> orderItemArrayList) {
        this.id = id;
        this.date = date;
        this.price = price;
        this.state = state;
        this.user_id=user_id;
        this.orderItemArrayList = orderItemArrayList;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isState() {
        return state;
    }

    public void setState(boolean state) {
        this.state = state;
    }

    public ArrayList<orderItem> getOrderItemArrayList() {
        return orderItemArrayList;
    }

    public void setOrderItemArrayList(ArrayList<orderItem> orderItemArrayList) {
        this.orderItemArrayList = orderItemArrayList;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    @Override
    public String toString() {
        return "order{" +
                "id=" + id +
                ", date=" + date +
                ", price=" + price +
                ", state=" + state +
                ", user_id='" + user_id + '\'' +
                ", orderItemArrayList=" + orderItemArrayList +
                '}';
    }


    /*@Override
    public int compareTo(order o) {
        *//*int result=o.getDate().compareTo(this.getDate());
        System.out.println(result);*//*

        return (this.getDate().getTime()>o.getDate().getTime()?-1:(this.getDate().getTime()==o.getDate().getTime()?0:1));
    }*/
}
