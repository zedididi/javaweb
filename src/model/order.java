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
public class order implements Comparable<order> {
    private int id;
   /* private Timestamp date;*/
    private Date date;
    private double price;
    private boolean state; //true代表已完成订单，false代表初始订单
    private String user_id;
    private ArrayList<orderItem> orderItemArrayList;

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


    /**
     * Compares this object with the specified object for order.  Returns a
     * negative integer, zero, or a positive integer as this object is less
     * than, equal to, or greater than the specified object.
     *
     * <p>The implementor must ensure
     * {@code sgn(x.compareTo(y)) == -sgn(y.compareTo(x))}
     * for all {@code x} and {@code y}.  (This
     * implies that {@code x.compareTo(y)} must throw an exception iff
     * {@code y.compareTo(x)} throws an exception.)
     *
     * <p>The implementor must also ensure that the relation is transitive:
     * {@code (x.compareTo(y) > 0 && y.compareTo(z) > 0)} implies
     * {@code x.compareTo(z) > 0}.
     *
     * <p>Finally, the implementor must ensure that {@code x.compareTo(y)==0}
     * implies that {@code sgn(x.compareTo(z)) == sgn(y.compareTo(z))}, for
     * all {@code z}.
     *
     * <p>It is strongly recommended, but <i>not</i> strictly required that
     * {@code (x.compareTo(y)==0) == (x.equals(y))}.  Generally speaking, any
     * class that implements the {@code Comparable} interface and violates
     * this condition should clearly indicate this fact.  The recommended
     * language is "Note: this class has a natural ordering that is
     * inconsistent with equals."
     *
     * <p>In the foregoing description, the notation
     * {@code sgn(}<i>expression</i>{@code )} designates the mathematical
     * <i>signum</i> function, which is defined to return one of {@code -1},
     * {@code 0}, or {@code 1} according to whether the value of
     * <i>expression</i> is negative, zero, or positive, respectively.
     *
     * @param o the object to be compared.
     * @return a negative integer, zero, or a positive integer as this object
     * is less than, equal to, or greater than the specified object.
     * @throws NullPointerException if the specified object is null
     * @throws ClassCastException   if the specified object's type prevents it
     *                              from being compared to this object.
     */
    @Override
    public int compareTo(order o) {
        int i=this.getDate().compareTo(o.getDate());
        System.out.println(i);
        return this.getDate().compareTo(o.getDate());
    }
}
