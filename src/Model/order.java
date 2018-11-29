package model;

import java.util.ArrayList;
import java.util.Date;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/11/28  22:30
 * @package: model
 * @project: javaweb
 */
public class order {
    private int id;
   /* private Timestamp date;*/
    private Date date;
    private double price;
    private boolean state; //true代表已完成订单，false代表初始订单
    private ArrayList<orderItem> orderItemArrayList;

    public order(int id, Date date, double price, boolean state, ArrayList<orderItem> orderItemArrayList) {
        this.id = id;
        this.date = date;
        this.price = price;
        this.state = state;
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

    @Override
    public String toString() {
        return "order{" +
                "id=" + id +
                ", date=" + date +
                ", price=" + price +
                ", state=" + state +
                ", orderItemArrayList=" + orderItemArrayList +
                '}';
    }
}
