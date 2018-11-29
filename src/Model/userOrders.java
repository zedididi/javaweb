package model;

import java.util.ArrayList;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/11/29  8:59
 * @package: model
 * @project: javaweb
 */
    //id 用户ID
    //username 用户名
    //price 用户的全部订单的总额
public class userOrders {

    private int id;
    private String username;
    private String phone;
    private double price;
    private ArrayList<order> orderArrayList=new ArrayList<>();

    public userOrders(int id, String username, String phone, double price, ArrayList<order> orderArrayList) {
        this.id = id;
        this.username = username;
        this.phone = phone;
        this.price = price;
        this.orderArrayList = orderArrayList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public ArrayList<order> getOrderArrayList() {
        return orderArrayList;
    }

    public void setOrderArrayList(ArrayList<order> orderArrayList) {
        this.orderArrayList = orderArrayList;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "userOrders{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", phone='" + phone + '\'' +
                ", price=" + price +
                ", orderArrayList=" + orderArrayList +
                '}';
    }
}
